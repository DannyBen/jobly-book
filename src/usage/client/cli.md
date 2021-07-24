---
icon: dot
---

# Running Jobs with the CLI

There are three ways to run a job from the command line:

Run the job locally, without going through any of the background job processing chain:

```shell
$ jobly run JobName param:value
```

Run the job locally, but wait for a worker to process it.

```shell
$ jobly run --later JobName param:value
```

Send a job through the API (either localhost or remote).

```shell
$ jobly send JobName param:value
```

