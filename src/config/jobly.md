---
order: 100
icon: dot
---

# Jobly Configuration

Configuring Jobly can be done by one of two methods:

1. Setting environment variables.
2. Adding a `config/jobly.rb` to your jobs workspace.

## Environment variable reference

| Environment Variable | Default |
| :--- | :--- |
| `JOBLY_ENVIRONMENT` | `development` |
| `JOBLY_API_URL` | `http://localhost:3000/do` |
| `JOBLY_APP_PATH` | `app` |
| `JOBLY_CONFIG_PATH` | `config` |
| `JOBLY_REDIS_URL` | `redis://localhost:6379/0` |
| `JOBLY_STATUS_EXPIRATION` | `30` |
| `JOBLY_JOBS_NAMESPACE` | unset |
| `JOBLY_LOG` | unset |
| `JOBLY_LOG_LEVEL` | `info` |
| `JOBLY_SLACK_WEBHOOK` | unset |
| `JOBLY_SLACK_CHANNEL` | `#general` |
| `JOBLY_SLACK_USER` | `Jobly` |
| `JOBLY_AUTH` | unset |
| `JOBLY_SHELL_DRY_RUN` | unset |

## Jobly configuration file

The below configuration file shows all the available options. Everything is optional and has defaults. This file is loaded on boot by the server, worker and jobly CLI.

```ruby config/jobly.rb
Jobly.configure do |config|
  # environment: development | production
  # Sets the environment for the API Sinatra server and for Sidekiq.
  # Default: ENV['JOBLY_ENVIRONMENT'] || 'development'
  config.environment = 'production'

  # api_url: url
  # Sets the URL to the API server.
  # Default: ENV['JOBLY_API_URL'] || 'http://localhost:3000/do'
  config.api_url = 'http://localhost:3000/do'

  # app_path: relative or absolute path
  # Sets the path to the optional folder that may contain support files for
  # the jobs. All ruby files in this folder are loaded first.
  # Default: ENV['JOBLY_APP_PATH'] || 'app'
  config.app_path = 'app'

  # jobs_path: relative or absolute path
  # Sets the path to the jobs folder. All ruby files in this folder are loaded
  # automatically by all of Jobly's components.
  # Default: ENV['JOBLY_JOBS_PATH'] || 'jobs'
  config.jobs_path = 'jobs'

  # config_path: relative or absolute path
  # Sets the path to the config directory. This is where Jobly looks for this
  # jobly.rb configuration file, so it should be set via the environment
  # variable if you wish to change it.
  # Default: ENV['JOBLY_CONFIG_PATH'] || 'config'
  config.config_path = 'config'

  # redis_url: url
  # Sets the full URL to the redis database
  # Default: ENV['JOBLY_REDIS_URL'] || 'redis://localhost:6379/0'
  config.redis_url = 'redis://localhost:6379/0'

  # status_expiration: minutes
  # Sets the number of minutes that completed jobs are kept in the Statuses
  # tab.
  # Default: ENV['JOBLY_STATUS_EXPIRATION'] || 30
  config.status_expiration = 5

  # jobs_namespace: string
  # Sets the namespace (module name) that your jobs are defined in. For 
  # example, if your Job classes are in fact defined as `MyJobs::SomeJob` 
  # then this option should be set to `MyJobs`.
  # Default: ENV['JOBLY_JOBS_NAMESPACE'] || nil
  config.jobs_namespace = nil

  # log: string or logger instance
  # Sets the logger that will be used by the servers and worker. This logger
  # is also available to your jobs with the `logger` method.
  # This can be one of these strings:
  # - stdout
  # - syslog://system:program@host:port
  # - filename
  # Or your own Logger instance.
  # Default: ENV['JOBLY_LOG'] || nil (log to STDOUT)
  config.log = 'jobly.log'

  # log_level: string
  # Sets the logger level.
  # This can be one of these strings:
  # - debug
  # - info
  # - warn
  # - error
  # - fatal
  # Default: ENV['JOBLY_LOG_level'] || 'info'
  config.log_level = 'info'

  # slack_webhook: url
  # To use the built in slack notifier, set this slack
  # webhook.
  # Default: ENV['JOBLY_SLACK_WEBHOOK']
  config.slack_webhook = "https://hooks.slack.com/..."
  
  # slack_channel: string
  # Sets the default slack channel.
  # This can be overwritten on a per-job basis.
  # Default: ENV['JOBLY_SLACK_CHANNEL'] || '#general'
  config.slack_channel = '#debug'
  
  # slack_user: string
  # Sets the default slack user name to display.
  # This can be overwritten on a per-job basis.
  # Default: ENV['JOBLY_SLACK_USER'] || 'Jobly'
  config.slack_user = 'Botly'
  
  # mounts: hash
  # Mount additional rack apps to the web server.
  config.mounts = { "/my" => MyApp }
  
  # auth: user:password string
  # Set basic authentication for the server and client.
  config.auth = "admin:secret"

  # shell_dry_run: boolean
  # When true, calls to shell.run will print the command to the screen 
  # instead of executing.
  # Default: ENV['JOBLY_SHELL_DRY_RUN'] || false
  config.shell_dry_run = false

end
```


## Accessing options from your code

In case you need to access any of these settings from your code, simply use the `Jobly.option_name` syntax or `Jobly.settings` to get a hash of all settings.

```ruby job/show_options.rb
class ShowOptions < Jobly::Job
  def execute
    pp Jobly.options
    pp Jobly.slack_user
    pp Jobly.root
  end
end
```


## Additional read only options

These options can also be accessed from anywhere in your code, as read only:

```ruby
Jobly.root              # the root path of the workspace
Jobly.full_app_path     # the full path to Jobly.app_path
Jobly.full_jobs_path    # the full path to Jobly.jobs_path
Jobly.full_config_path  # the full path to Jobly.config_path
```
