# line_message plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-line_message)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-line_message`, add it to your project by running:

```bash
fastlane add_plugin line_message
```

## About line_message

Use to send message to Line chat

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```ruby
line_message(
    api_token: ENV["LINE_MESSAGE_API_TOKEN"],
    to: ENV["LINE_MESSAGE_TARGET"],
    messages: [{
        "type": "text",
        "text": "test ๆ"
    }, {
        "type": "sticker",
        "packageId": "1",
        "stickerId": "1"
    }]
)
```

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

- Post message to https://api.line.me/v2/bot/message/push
- Read more for Line api's documents at https://developers.line.biz

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
