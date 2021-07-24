---
icon: dot
---

# Namespaces

This example illustrates how to define jobs that are namespaced in modules.

It illustrates:

1. How all jobs can be nested inside a specific module that is used as the default namespace for all jobs - see the config folder.
2. How additional namespacing is done by putting some jobs under a nested module and (optionally, by convention) putting them inside a subfolder - see the jobs folder.

## Code

=== config/jobly.rb

```ruby
# config/jobly.rb
Jobly.configure do |config|
  config.jobs_namespace = 'Jobs'
end
```

==- jobs/hello.rb

```ruby
# jobs/hello.rb

# Global namespace for all jobs
module Jobs
  class Hello < Jobly::Job
    def execute(name: 'bob')
      puts "Hello #{name}"
      logger.info "said hello to #{name}"
    end
  end
end
```

==- jobs/inner/hi.rb

```ruby
# jobs/inner/hi.rb
module Jobs
  # A nested job, can be executed with Inner::Hi or Inner/Hi
  module Inner
    class Hi < Jobly::Job
      def execute(name: 'bob')
        puts "Hi #{name}, this is #{self.class.name}"
        logger.info "said hello to #{name} from #{self.class.name}"
      end
    end
  end
end
```

===

## Commands to Try

```bash
cd examples/namespaces

# Run the namespaced job that is found in the root namespace `Jobs`
jobly run Hello

# Run the nested job that is found in the root namespace `Jobs::Inner`
jobly run Inner::Hi
```

