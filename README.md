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