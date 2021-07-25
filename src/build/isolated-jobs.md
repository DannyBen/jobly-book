---
order: 50
icon: dot
---

# Isolated Jobs

Jobs can be defined so that they are executed in their own temporary directory by using the `isolated` method.

```ruby jobs/test.rb
class Test < Jobly::Job
  isolated

  def execute
    # Job code here - will be executed in a new temporary directory
  end
end
```


