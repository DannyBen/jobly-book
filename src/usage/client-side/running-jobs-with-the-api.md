# Running Jobs with the API

The API supports running jobs either by GET or by POST in the following URL structure:

```text
http://localhost:3000/do/JobName
```

## Example

```text
$ curl localhost:3000/do/Build
```

Or, if your job requires parameters, provide them through the query string:

```text
$ curl localhost:3000/do/Build?deploy=no
```


## Response

### On success (**200 OK**)

```json
{
  "status": "received",
  "job": "Build",
  "params": {
    "deploy":"no"
  }
}
```

### On failure (**404 Not Found**)

```json
{
  "status": "error",
  "message": "No such job",
  "job": "BuildAndRun",
  "params": {}
}
```
