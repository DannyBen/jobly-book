# Slack Notifications Example

This example illustrates how to send slack notifications from your jobs. Note that for this to work, you need to [set up a web hook in your Slack configuration](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) and then make it available to Jobly by the `slack_webhook` option or the `JOBLY_SLACK_WEBHOOK` environment variable.

## Code

```ruby
# jobs/greet.rb
class Greet < Jobly::Job
  # Optional settings (defaults to #general and Jobly)
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

## Commands to Try

```bash
cd examples/slack-notifications

# Set your slack webhook in an environment variable
export JOBLY_SLACK_WEBHOOK=https://hooks.slack.com/services/...

# Run the job
jobly run Greet
```

