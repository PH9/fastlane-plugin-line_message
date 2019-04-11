require 'fastlane/action'
require 'net/https'
require_relative '../helper/line_message_helper'

module Fastlane
  module Actions
    class LineMessageAction < Action
      def self.run(params)
        to = params[:to] || ENV["LINE_MESSAGE_TARGET"]
        api_token = params[:api_token] || ENV["LINE_MESSAGE_API_TOKEN"]

        uri = URI.parse('https://api.line.me/v2/bot/message/push')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.set_debug_output($stdout)

        request = Net::HTTP::Post.new(uri.request_uri)
        request["Content-Type"] = "application/json;charset=UTF-8"
        request["Authorization"] = "Bearer #{api_token}"
        request.set_form_data({
          "to" => to,
          "messages" => params[:messages],
        })

        http.request(request)

        UI.message("The line_message plugin is working!")
      end

      def self.description
        "Use to send message to Line chat"
      end

      def self.authors
        ["Wasith Theerapattrathamrong"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.example_code
        [
          # TODO: default type as text
          # 'line_message(message: "App is ready!!!")',
          'line_message(
            messages: [{
              "text": "App is ready!!!"
            }, {
              "type": "text",
              "text": "Download at https://..."
            }, {
              # check sticker list https://developers.line.biz/media/messaging-api/sticker_list.pdf
              "type": "sticker",
              "packageId": "2",
              "stickerId": "144"
            }]
          )'
        ]
      end

      def self.category
        :notifications
      end

      def self.details
        "Use api from https://developers.line.biz/en/docs/messaging-api/ call api at https://api.line.me/v2/bot/message/push"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                  env_name: "LINE_MESSAGE_API_TOKEN",
                               description: "API token for Line Messaging API",
                              verify_block: proc do |value|
                                            UI.user_error!("No API token for Line Notify given, pass using `api_token: 'token'`") unless (value and not value.empty?)
                                          end),
          FastlaneCore::ConfigItem.new(key: :to,
                                  env_name: "LINE_MESSAGE_API_TO",
                               description: "Target id you want to send message",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :messages,
                                  env_name: "LINE_MESSAGE_API_MESSAGES",
                               description: "Message you want to send follow https://developers.line.biz/en/docs/messaging-api/ spces",
                                  optional: false,
                                      type: Array),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
