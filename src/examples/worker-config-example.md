# Worker Config Example

This example makes use of worker configuration file in order to tell the
worker to process two queues (`critical` and `mundane`) instead of the
`default` queue.

Note that the same can also be achieved through the command line, without
using a config file.

## Code

```yaml
# config/worker.yml
:concurrency: 2
:queues:
- critical
- default
- mundane
```

```ruby
# jobs/critical.rb
class Critical < Jobly::Job
  options queue: 'critical'

  def execute
    logger.info "Running a critical job"
  end
end
```

```ruby
# jobs/mundane.rb
class Mundane < Jobly::Job
  options queue: 'mundane'

  def execute
    logger.info "Running a mundane job"
  end
end
```

```text
# Procfile
web: jobly server
worker: jobly worker --config worker
```


## Commands to Try

```bash
cd examples/worker-config

# Start the server and worker
# Note that the `Procfile` is defined to run `jobly worker --config worker`
# which points the worker to the `config/worker.yml` configuration file
foreman start

# From another terminal, send the jobs to the worker
jobly send Critical
jobly send Mundane
```

