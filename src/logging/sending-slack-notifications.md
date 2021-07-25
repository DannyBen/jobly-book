---
order: 80
icon: dot
---

# Sending Slack Notifications

Jobly comes bundled with [Slack::Notifier](https://github.com/stevenosloan/slack-notifier) which is made available to your jobs using the `#slack` method.

```ruby jobs/greet.job
class Greet < Job
  # Optional settings (defaults to #debug and Jobly)
  # Can also be set in the configuration
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

## Sending notifications from other classes

To include the `slack` helper in other classes (non `Jobly::Job`), you can include the `Jobly::Slack` module (or the more inclusive `Jobly::Helpers` module).

```ruby app/git.rb
class Git
  include Jobly::Slack

  def pull(repo)
    slack.ping "pulling #{repo}"
  end
end
```

See the **Slack Notifications Example** for more details:

[!ref](/examples/slack-notifications.md)

