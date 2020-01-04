# GitHub Integration Example

This example demonstrates how to integrate Jobly with GitHub for:

- Handling incoming webhooks from GitHub
- Sending pull request status updates

These features are not built into Jobly, but can be easily implemented by
adding the [Loadrunner][loadrunner] gem.

## Code

```ruby
# jobs/build.rb
require 'loadrunner/status'

class Build < Jobly::Job
  def execute(repo:, commit: nil)
    logger.info "Building #{repo}"

    # Send status update to GitHub
    if commit
      Loadrunner::Status.update repo: "YourGithubUser/#{repo}", 
        sha: commit, 
        state: :pending,  # :pending :success :failure :error
        context: "Jobly Demo",
        description: "Build in progress",
        url: "http://example.com"

    end
  end
end

```

```ruby
# hooks/global
#!/usr/bin/env ruby

# Handle any incoming GitHub hook

require 'jobly/boot'

commit = ENV['LOADRUNNER_COMMIT']
repo = ENV['LOADRUNNER_REPO']

# Execute a Jobly job

Build.run_later repo: repo, commit: commit

```

```ruby
# config/jobly.rb
require 'loadrunner/server'

Jobly.configure do |config|
  # Mount the Loadrunner server under Jobly's /github endpoint
  config.mounts = { "/github" => Loadrunner::Server }
end
```


## Commands to Try

```bash
cd examples/github
bundle install

# Start the server
foreman start

# Simulate a webhook using loadrunner command line interface
loadrunner event localhost:3000/github repo push
```

[loadrunner]: https://github.com/dannyben/loadrunner