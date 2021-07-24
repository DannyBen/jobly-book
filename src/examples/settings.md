---
icon: dot
label: Settings
---

# Settings Example

This example illustrates how to use the `settings` helper to load custom settings into your jobs.

## Code

=== jobs/show_settings.rb

```ruby
# jobs/show_settings.rb
class ShowSettings < Jobly::Job
  def execute
    puts "Loading settings for #{Jobly.environment}"

    # Show all settings hash
    pp settings.settings

    # Access a value
    puts settings.host

    # Access a deeper value or an array value
    puts settings.apps[0]
    puts settings.login['user']
  end
end
```

==- config/settings.yml

```yaml
# config/settings.yml
host: example.com
port: 80

apps:
- /apps/todo-list
- /apps/greeter

login:
  user: admin
  password: <%= ENV['MY_SECRET'] =>
```

==- config/settings.development.yml

```yaml
# config/settings.development.yml
host: localhost
port: 3000
```

===

## Commands to Try

```bash
cd examples/settings

# Run the job
jobly run ShowSettings
```

