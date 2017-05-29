# Notifier
A quick proof of concept Ruby application for consuming kafka events, queueing those events in AWS SQS, and processing the events off SQS, triggering emails via AWS SES.

## Signal flow
Incoming kafka events are processed by EventHandler which will attempt to queue the event in SQS. If it succeeds, the event will be persisted in the `phobos_db_checkpoint_events` table. If it fails the event will be persisted in the `phobos_db_checkpoint_failures` table.
The SqsWorker pulls events off the SQS queue and attempts to convert these events into emails sent via SES.

## Quick Start
This app only consumes kafka events, you'll still need a kafka server running and a producer
to provide messages for this app to consume.  In the absence of an existing kafka server
you can follow the [Apache Kafka Quickstart guide](https://kafka.apache.org/quickstart).

To start this app:
```
phobos start
```

To start the worker to process the SQS events:
```
bundle exec shoryuken -r ./lib/sqs_worker.rb -C ./config/shoryuken.yml
```

This app expects the kafka event payload to be in JSON form, else it will explode when
handling events.  The only other requirement of this payload is that it must have an `id` attribute.

Example payload:
```
{"id": "1", "data": "all of the things"}
```
