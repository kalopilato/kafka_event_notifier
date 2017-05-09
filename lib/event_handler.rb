class EventHandler
  include PhobosDBCheckpoint::Handler

  # def self.start(kafka_client)
  #   # setup handler
  # end

  # def self.stop
  #   # teardown
  # end

  # def self.around_consume(payload, metadata)
  #   Phobos.logger.info "consuming..."
  #   output = yield
  #   Phobos.logger.info "done, output: #{output}"
  # end

  def consume(payload, metadata)
    puts "Payload: #{payload}\nMetadata: #{metadata}"

    # my_event = JSON.parse(payload)
    # ack(my_event['id'], Time.now)
    ack(1, Time.now);
  end
end
