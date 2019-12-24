# Logging

### Logging from within jobs

All your jobs have access to a standard Ruby logger.

```ruby
# jobs/hello.rb
class Hello < Jobly::Job
  def execute(name: 'bob')
    logger.info "said hello to #{name}"
  end
end
```


### Logging from other classes

In case you need access to the logger from other classes (that do not
inherit from `Jobly::Job`), you may include the `Jobly::Logging` module.

```ruby
# app/git.rb
class Git
  include Jobly::Logging

  def pull(repo)
    logger.info "pulling #{repo}..."
  end
end
```


### Configuring the logger

By default, output is sent to `STDOUT` but you can provide your own logger
and log to a file or to syslog by using the `config.log` or the
`config.logger` option in `./config/jobly.rb`

```ruby
# config/jobly.rb
Jobly.configure do |config|
  config.log = '/var/log/jobly.log'
  
  # same as:
  # config.log = Logger.new '/var/log/jobly.log'

  config.logger.level = Logger::WARN
end
```


The `config.log` option controls how logging is handled.

1. If left empty \(`nil`\), the web server and workers will NOT log anywhere, and your jobs will log to `STDOUT` whenever you use `logger`.
2. Setting it to `config.log = 'stdout'` will also instruct the web server and worker to send their logging to `STDOUT`.
3. Setting it to a filename, will log to a file.
4. Setting it to a syslog connection string will log to a remote syslog server. 

### Logging to syslog

Set `config.log` to a syslog connection string in the following format:

`syslog://system:program@host:port`

Omitting any of the options will fall back to a sensible default.

> <i class='fa fa-arrow-right'></i> **See Also**: [Syslog Example](/examples/syslog-example.md)

### Separate log files for each job class

If  `Jobly.log` contains `%s` in the file path, it will be replaced with the slug of the job, and will create separate log files for each job class.

```ruby
# config/jobly.rb
Jobly.configure do |config|
  config.log = 'logs/%s.log'
end
```


### Automatic syslog tagging

The same `%s` replacement principle applies when using a syslog connection string. This is intended to allow tagging of syslog messages with the job name.

```ruby
# config/jobly.rb
Jobly.configure do |config|
  config.log = 'syslog://jobserver:%s@localhost:514'
end
```

### Bring your own logger

The `config.log` option can also accept any `Logger` instance, in case you
wish to provide a custom logger.

