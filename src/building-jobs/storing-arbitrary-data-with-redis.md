---
order: 40
icon: dot
---

# Storing Arbitrary Data with Redis

Jobly comes bundled with [Sidekiq::Status](https://github.com/utgarda/sidekiq-status) which has a built in ability allowing you to store and use arbitrary data in its Redis database.

```ruby Example
# jobs/hello.rb
class Hello < Jobly::Job
  def execute(name: 'bob')
    # Store arbitrary data
    store vino: 'veritas'

    # Retrieve data.
    vino = retrieve :vino
  end
end
```

Note that:

1. Values are always stored as a `String`, so you will need to convert them to other types when appropriate.
2. When `retrieve` does not find the key, `nil` is returned.
3. Stored keys are available across jobs.
