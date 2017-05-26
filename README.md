# Notifier
A quick proof of concept Ruby application for consuming kafka events and triggering emails via AWS SES.

## Quick Start
This app only consumes kafka events, you'll still need a kafka server running and a producer
to provide messages for this app to consume.  In the absence of an existing kafka server
you can follow the [Apache Kafka Quickstart guide](https://kafka.apache.org/quickstart).

To start this app:
```
phobos start
```

This app expects the kafka event payload to be in JSON form, else it will explode when
handling events.  The only other requirement of this payload is that it must have an `id` attribute.

Example payload:
```
{"id"=>"1", "data"=>"all of the things"}
```