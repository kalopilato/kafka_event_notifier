require 'shoryuken'
require './lib/ses_mailer'

class SqsWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'lic_phobos_poc', auto_delete: true
  # shoryuken_options queue: ->{ "#{ENV['environment']}_default" }

  shoryuken_options body_parser: :json
  # shoryuken_options body_parser: ->(sqs_msg){ REXML::Document.new(sqs_msg.body) }
  # shoryuken_options body_parser: JSON

  def perform(sqs_msg, body)

    # Send the payload to SES Mailer
    # mailer = SesMailer.new
    # mailer.send(body)

    puts "SQS Msg: #{sqs_msg}"
    puts "SQS Body: #{body}"
  end
end
