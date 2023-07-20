---
icon: home
label: Welcome
---

# Welcome to Jobly

**Jobly** is a sidekiq-based job server with a command line interface, web API and a web dashboard.

## What's in the Box

* **Command line interface** - for starting the server, starting the worker, and for running jobs.
* **Web API** - for executing jobs.
* **Web Dashboard** - including job progress and status.
* **Remote Syslog Support** - send output to Papertrail or remote syslog.
* **Slack Notifications** - report job progress to Slack.

## Screencast

<object data="/assets/cast.svg" style='width:100%'></object>

[!button variant="info" icon="screen-full" text="Enlarge Screencast"](/screencast/)

## Screenshot

![](/assets/screen.gif)

## Interactive Demo

For an interactive demo, visit the Jobly scenario on Katacoda:

[!button variant="primary" icon="terminal" text="Jobly Interactive Demo"](https://www.katacoda.com/dannyb/scenarios/jobly)


## Installation

Jobly is packaged as a Ruby gem, install it by running:

```text
$ gem install jobly
```

Alternatively, you can download the the official [Jobly docker image](https://github.com/dannyben/docker-jobly), or take a look at the **Docker Compose Example**:

[!ref](examples/docker-compose.md)

## Prerequisites

- Ruby
- Redis server
