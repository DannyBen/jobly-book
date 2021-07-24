---
icon: dot
label: Data Store
---

# Data Store Example

This example demonstrates how to store and retrieve arbitrary data on redis.

## Code

=== jobs/build.rb

```ruby
# jobs/build.rb
class Build < Jobly::Job
  def execute
    # Get "build_number" from redis, or default to 0
    build_number = retrieve(:build_number).to_i || 0

    # Increase build number and store it back on redis
    build_number += 1
    store build_number: build_number.to_s

    # Use the value
    puts "Building #{build_number}"
    logger.info "Built #{build_number}"
  end
end
```

===


## Commands to Try

```bash
cd examples/storing-data-in-redis

# Run the command several times to get a new build number
jobly run Build
jobly run Build
```

