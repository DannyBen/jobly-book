# Sending Slack Notifications

Jobly comes bundled with
[Slack::Notifier](https://github.com/stevenosloan/slack-notifier)
which is made available to your jobs using the `#slack` method.

```ruby
# jobs/greet.job
class Greet < Job
  # Optional settings (defaults to #debug and Jobly)
  slack_channel '#debug'
  slack_user 'Greeter'

  def execute(name: 'bob')
    # Quick message
    slack.ping "Hello #{name}"

    # Message with attachment
    slack.post attachments: { text: "Good text", color: "good" }
  end
end
```

> <i class='fa fa-arrow-right'></i> **See Also**:
> [Slack Notifications Example](/examples/slack-notifications-example.md)