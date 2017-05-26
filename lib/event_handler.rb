require 'byebug'
require './lib/ses_mailer'

class EventHandler
  include PhobosDBCheckpoint::Handler

  # def self.start(kafka_client)
  #   # setup handler
  # end

  # def self.stop
  #   # teardown
  # end

  def self.around_consume(payload, metadata)
    super(JSON.parse(payload), metadata)
  end

  # This method will attempt to process the incoming event (payload, metadata).
  # If the event is successfully processed (i.e. no exception thrown), the call
  # to ack() will persist the event, marking it as processed.
  # If an exception is thrown, this method will be called again up to
  # `db_checkpoint.max_retries` times, as configured in `phobos.yml`.
  # If the event is not successfully processed (i.e. no ack returned), the event
  # will be persisted as a failure.
  def consume(payload, metadata)
    event = JSON.parse(payload)
    puts "Consuming event: #{event}"
    # mailer = SesMailer.new
    # mailer.send(event)

    ack(event[:id], Time.now)
  end
end
