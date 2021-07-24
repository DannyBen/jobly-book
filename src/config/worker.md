---
order: 90
icon: dot
---

# Worker Configuration

The worker options can be configured by command line options or by specifying a worker configuration file when running it.

The configuration file can be used to:

* Specify default values for the worker \(instead of specifying them inside the jobs themselves\).
* Specify additional advanced sidekiq configuration options.

!!! Tip

The worker configuration file is in fact a [sidekiq configuration file](https://github.com/mperham/sidekiq/wiki/Advanced-Options). Refer to the sidekiq documentation if you need more advanced options.

!!!

## Sample worker configuration file

```yaml config/my-worker.yml
---
:concurrency: 2
:queues:
- critical
- default
- mundane
```


Place your YAML config file inside the config folder, and use the `jobly worker --config my-worker` to use it.

!!! Note

The filename specified with the `--config` flag must be placed inside the config folder. You do not need to specify the folder name or the `.yml` extension.

!!!

See the **Worker Configuration Example** for more details:

[!ref](/examples/worker-config.md)

