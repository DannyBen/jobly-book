---
icon: dot
label: Job Callbacks
---

# Job Callbacks Example

This example illustrates the use of `before`, `after`, `on_skip`, `on_success`, and `on_failure` blocks.

## Code

=== jobs/actions.rb

```ruby
# jobs/actions.rb
class Actions < Jobly::Job
  before { puts "before" }
  after  { puts "after" }

  on_success { puts "on_success" }
  on_failure { puts "on_failure" }

  after :after_party

  def execute(fail: false)
    puts "execute 1/2"
    raise "RAISED" if fail
    puts "execute 2/2"
  end

  def after_party
    puts "after_party"
  end
end
```

==- jobs/filter.rb

```ruby
# jobs/filter.rb
class Filter < Jobly::Job
  before do
    puts "before"
    skip_job
  end

  after do
    puts "after"
  end

  on_skip    { puts "on_skip" }
  on_success { puts "on_success" }
  on_failure { puts "on_failure" }

  def execute
    puts "execute"
  end
end
```

===

## Commands to Try

```bash
cd examples/before-after-actions

# Run the job in its successful form
jobly run Actions

# Run the job in its failed form
jobly run Actions fail:yes

# Run the filter job (will not execute the job body)
jobly run Filter
```

