---
icon: dot
label: Basic Auth
---

# Basic Auth Example

## Code

=== jobs/hello.rb

```ruby
# jobs/hello.rb
class Hello < Jobly::Job
  def execute(name: 'bob')
    puts "Hello #{name}"
    logger.info "said hello to #{name}"
  end
end
```

===

## Commands to Try

```bash
cd examples/basic

# Start the server with basic auth enabled
JOBLY_AUTH=user:pass jobly server

# Send a job without authentication
# This operation will fail
jobly send Hello

# Send an authenticated job request
# This operation will succeed
JOBLY_AUTH=user:pass jobly send Hello
```

