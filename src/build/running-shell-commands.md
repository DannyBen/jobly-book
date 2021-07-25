---
order: 30
icon: dot
---

# Running Shell Commands

Although you can use any Ruby method to execute shell and system commands from within your jobs, Jobly comes bundled with [TTY::Command](https://github.com/piotrmurach/tty-command) which is made available to your jobs by using the `#shell` method.

```ruby jobs/shell.rb
class Shell < Jobly::Job
  def execute
    shell.run "docker pull ubuntu"
  end
end
```

Using this method is recommended, since it automatically sends the STDOUT and STDERR of the command to the configured logging device, and it will raise an exception on failure, which will fail the job.


## Dry run

When the `JOBLY_SHELL_DRY_RUN` environment variable is set, the `shell.run` helper will not run the commands, and instead, only print them to the log.


## Accessing the shell helper from other classes

To include the `shell` helper in other classes (non `Jobly::Job`), you can include the `Jobly::Shell` module (or the more inclusive `Jobly::Helpers` module).

```ruby app/git.rb
class Git
  include Jobly::Shell

  def clone(repo)
    shell.exec "git clone #{repo}"
  end
end
```
