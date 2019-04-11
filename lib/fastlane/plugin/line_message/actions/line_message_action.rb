require 'fastlane/action'
require_relative '../helper/line_message_helper'

module Fastlane
  module Actions
    class LineMessageAction < Action
      def self.run(params)
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

      def self.details
        # Optional:
        "Use api from https://developers.line.biz call api at https://api.line.me/v2/bot/message/push"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "LINE_MESSAGE_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
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
