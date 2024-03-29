---
icon: dot
label: Options and Errors
---

# Options and Errors Example

This example illustrates setting the job options: `backtrace`, `queue` and `retries`.

## Code

=== jobs/deploy.rb

```ruby
# jobs/deploy.rb
class Deploy < Jobly::Job
  # This job runs on the 'critical' queue
  queue 'critical'

  # On failure, show 5 backtrace lines in the web UI
  backtrace 5

  # On failure, retry once only
  retries 1

  def execute(env: 'stage')
    puts "Deploying to #{env}"
    raise "Something went wrong..."
  end
end
```

===

## Commands to Try

```bash
cd examples/options-and-errors

# Start the server and the worker
foreman start

# Or one by one
jobly server
jobly worker --queue critical

# From another terminal, send the job to the worker
jobly send Deploy

# View the failed job and its backtrace in the Retries tab
open http://localhost:3000/retries
```

