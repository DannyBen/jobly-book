---
icon: dot
---

# Job in Job

This example demonstrates how to call a job from inside another job.

Two approaches are possible:

1. Executing secondary jobs synchronously, as part of the parent job.
2. Spawning the secondary jobs to be executed later by the worker, as
   separate jobs.

## Code

```ruby
# jobs/run_sync.rb

# This job will call the other jobs synchronously and display progress
# in the dashboard

class RunSync < Jobly::Job
  def execute(count: 10)
    total count

    count.times do |i|
      at i
      puts "Executing Job ##{i}"
      SubJob.run number: i
    end

    at count, "Done"
  end
end
```


```ruby
# jobs/run_async.rb

# This job will spawn child threads for the sub jobs.
# Each of the spawned jobs will have its own progress bar in the dashboard.

class RunAsync < Jobly::Job
  def execute(count: 10)
    count.times do |i|
      SubJob.run_later number: i
    end
  end
end
```


```ruby
# jobs/sub_job.rb
class SubJob < Jobly::Job
  def execute(number:)
    logger.info "Executing... something... #{number}"
    sleep rand(1..5)
  end
end
```


## Commands to Try

```bash
cd examples/job-in-job

# Start the server and worker
foreman start

# From another terminal, send the jobs to the worker
jobly send RunSync count:20
jobly send RunAsync count:10
```

