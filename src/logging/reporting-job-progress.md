---
order: 90
icon: dot
---

# Reporting Job Progress

Jobly comes bundled with [Sidekiq::Status](https://github.com/utgarda/sidekiq-status) which provides you with a live status dashboard, and a way to report progress in your jobs.

![](/assets/screen.gif)

In order to report progress from your job, use the `total` and `at` methods. In addition, you can store arbitrary data related to your job with `store` and `retrieve`.

```ruby jobs/hello.rb
class Hello < Jobly::Job
  def execute(name: 'bob')
    # How many steps this job has (default is 100)
    total 100 

    # 5/100 = 5% completion
    at 5, "Initializing"
  end
end
```
