---
order: 20
icon: dot
---

# Loading Additional Code

In case your jobs require additional functionality, you may create the `./app` folder as a sibling to the `./jobs` folder (configurable).

- All ruby files in this folder (and sub folders) will be automatically loaded and available to your jobs. Note that files will be `required` in alphabetical order.
- In case there is an `app/boot.rb` file, it will be loaded first.

## Accessing job helpers from custom code

Custom code that does not inherit from `Jobly::Job` will not be able to access some job features, such as logging and slack notifications.

To enable such access, you can `include Jobly::Helpers` in your custom code:

```ruby app/git.rb
class Git
  include Jobly::Helpers

  def pull(repo)
    logger.info "pulling #{repo}..."
  end
end
```

The `Jobly::Helpers` module is a shortcut that includes several helpers. You can include them separately if you prefer:

```ruby
include Jobly::Logging
include Jobly::Slack
include Jobly::Shell
include Jobly::Settings
```

