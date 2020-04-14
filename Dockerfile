# ---- Build Stage ----
FROM elixir:1.9 as app_builder

# Set environment variables for building the application
ENV MIX_ENV=prod \
    TEST=1 \
    LANG=C.UTF-8

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Create the application build directory
RUN mkdir /app
WORKDIR /app

# Copy over all the necessary application files and directories
COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY mix.exs .
COPY mix.lock .

# Fetch the application dependencies and build the application
RUN mix deps.get
RUN mix deps.compile
RUN mix phx.digest
RUN mix release

# ---- Application Stage ----
FROM debian AS app

ENV LANG=C.UTF-8

# Install openssl
RUN apt-get update && apt-get install -y openssl

# Copy over the build artifact from the previous step and create a non root user
RUN useradd --create-home app
WORKDIR /home/app
COPY --from=app_builder /app/_build .
RUN chown -R app: ./prod

ADD start_commands.sh /scripts/start_commands.sh
RUN chmod +x /scripts/start_commands.sh

USER app

# run the start-up script which run migrations and then the app
ENTRYPOINT ["/scripts/start_commands.sh"]