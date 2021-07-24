---
order: 100
icon: rocket
---

# Quick Start

These steps are similar (but not identical) to the steps demonstrated in the [Jobly screencast](/index.md#screencast).

=== Step 1: Setup a Jobly workspace

```bash
# Create a new workspace (directory)
$ jobly init myjobs

# Make sure dependencies are installed
$ cd myjobs
$ bundle install

# Start the web server and the worker
$ foreman start

# Alternative:
# You may also start the server and worker manually in two separate screens
$ jobly server
$ jobly worker
```

==- Step 2: Verify the server is working

Go to <http://localhost:3000> - you should see the Sidekiq dashboard.

==- Step 3: Execute a job through the API

Go to <http://localhost:3000/do/Hello> - you should receive a JSON encoded acknowledgement.

Go back to the dashboard and view the job's status.

==- Step 4: Execute a job through the CLI

Form the same workspace directory, run:

```bash
# Execute the job directly (without the server)
$ jobly run Ping

# Send the job through the Web API server
$ jobly send Ping

# Send the job through the Web API server, with parameters
$ jobly send Hello name:Arnold
```

Finally, view the <http://localhost:3000/statuses> page to ensure your jobs were executed.

===