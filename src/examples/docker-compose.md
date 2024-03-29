---
icon: dot
label: Docker Compose
---

# Docker Compose Example

This example demonstrates how to use Jobly inside a docker container and with docker compose.

## Code

=== Dockerfile

```dockerfile
# Dockerfile
FROM dannyben/alpine-ruby
RUN gem install jobly
WORKDIR /app
COPY app .
```

==- docker-compose.yml


```yaml
# docker-compose.yml
services:
  redis:
    image: redis

  bash: &default
    build: .
    image: temp/jobly
    depends_on: [redis]
    volumes:
    - ./app:/app
    environment:
      JOBLY_REDIS_URL: redis://redis:6379/0
      JOBLY_API_URL: http://web:3000/do

  web:
    <<: *default
    ports: ["3000:3000"]
    command: jobly server

  worker:
    <<: *default
    command: jobly worker

  send:
    <<: *default
    depends_on: [web]
    entrypoint: jobly send
    command: Hello
```

==- app/jobs/hello.rb

```ruby
# app/jobs/hello.rb
class Hello < Jobly::Job
  def execute(name: 'bob')
    puts "Hello #{name}"
    logger.info "said hello to #{name}"
  end
end
```

===


## Commands to Try

```bash
cd examples/docker-compose

# Build the images
docker-compose build

# Start the server and the worker
docker-compose up web worker

# Visit your server
open http://localhost:3000

# Send a test job
docker-compose run send

# ... or with parameters
docker-compose run send Hello name:Bobby
```

