require 'aws-sdk'

class SesMailer

  def send(payload)
    ses_client = Aws::SES::Client.new

    response = ses_client.send_email({
      source: 'kalo@abletech.nz',
      destination: {
        to_addresses: ['kalo.pilato@abletech.nz']
      },
      message: {
        subject: {
          charset: 'UTF-8',
          data: 'Kafka Says'
        },
        body: {
          html: {
            charset: 'UTF-8',
            data: "<h3>Test email from phobos</h3><p>#{payload}</p>"
          },
          text: {
            charset: 'UTF-8',
            data: "#{payload}\n\nSent from phobos via AWS SES"
          }
        },
      },
    })
  end
end

# SES `send_email` request syntax:

# resp = client.send_email({
#   source: "Address", # required
#   destination: { # required
#     to_addresses: ["Address"],
#     cc_addresses: ["Address"],
#     bcc_addresses: ["Address"],
#   },
#   message: { # required
#     subject: { # required
#       data: "MessageData", # required
#       charset: "Charset",
#     },
#     body: { # required
#       text: {
#         data: "MessageData", # required
#         charset: "Charset",
#       },
#       html: {
#         data: "MessageData", # required
#         charset: "Charset",
#       },
#     },
#   },
#   reply_to_addresses: ["Address"],
#   return_path: "Address",
#   source_arn: "AmazonResourceName",
#   return_path_arn: "AmazonResourceName",
#   tags: [
#     {
#       name: "MessageTagName", # required
#       value: "MessageTagValue", # required
#     },
#   ],
#   configuration_set_name: "ConfigurationSetName",
# })