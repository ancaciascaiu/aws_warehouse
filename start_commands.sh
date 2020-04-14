#!/bin/bash
./prod/rel/aws_warehouse/bin/aws_warehouse eval "AwsWarehouse.ReleaseTasks.migrate"
./prod/rel/aws_warehouse/bin/aws_warehouse start