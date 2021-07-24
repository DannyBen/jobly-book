---
order: 80
icon: dot
---

# Custom Settings

Jobly comes bundled with [Sting](https://github.com/dannyben/sting), which provides you with a `settings` helper that lets you use custom YAML files for configuring your jobs.

## Settings files

1. Place `settings.yml` in the `config` folder.
2. Optionally, place additional `settings.<environment>.yml` (for example `settings.production.yml`) files for each of your environments. These files will be loaded based on the `JOBLY_ENVIRONMENT` configuration.

## ERB

Before the YAML files are loaded, they are evaluated with ERB, so you can use Ruby code in them (for example, to load environment variables):

```yaml config/settings.yml
host: localhost
port: <%= ENV['PORT'] || 3000 %>
```

## Extended YAML

Your `settings*.yml` files can use the `extends` key to load and merge additional YAML files:

```yaml config/settings.yml
extends: some-other-file.yml
host: localhost
```

- The `.yml` extension is optional.
- You may extend either a single file or an array of files.

This functionality is provided by [ExtendedYAML](https://github.com/dannyben/extended_yaml).


## Using settings in your jobs

Your jobs will have access to a `settings` object:

```ruby jobs/push.rb
class Push < Jobly::Job
  def execute
    puts settings.host
  end
end
```

## Using settings in other classes

To have the `settings` object available to other (non `Jobly::Job`) classes, include the `Jobly::Settings` module (or the more inclusive `Jobly::Helpers` module).

```ruby app/docker.rb
class Docker
  include Jobly::Settings
  
  def pull
    puts settings.docker_registry
  end
end
```

See the **Settings Example** for mode details:

[!ref](/examples/settings.md)
