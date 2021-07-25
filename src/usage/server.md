---
order: 90
icon: server
---

# Server

The Jobly server side consists of two components:

1. **Web Server** - provides both a dashboard and an API for running jobs.
2. **Worker** - executes jobs.

## Web Server

To start the web server:

1. Run `jobly server` from the command line.
2. Open [localhost:3000](http://localhost:3000) in your browser.

This will start a server with two primary entry points: Web Dashboard and Jobly API.

### Web Dashboard

This dashboard is available at the root of the web server. It is a sidekiq web dashboard, with additional plugins for job progress and status.

### API Server

This is a simple web API server that allows you to execute jobs remotely by calling `/do/JobName?param=value`.

[!ref](/usage/client/api.md)


## Worker

To start processing jobs, run:

```shell
$ jobly worker
```


[!ref](/config/worker.md)



