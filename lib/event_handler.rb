class EventHandler
  include Phobos::Handler

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
  end
end
