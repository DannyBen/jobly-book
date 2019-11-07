# Custom Rack Mount

This example demonstrates how to ammend the web server so that it also serves any custom rack app.

## Code

```ruby
# config/jobly.rb
require_relative '../app/my_server'

Jobly.configure do |config|
  config.mounts = { "/my" => MyServer }
end
```

```ruby
# app/my_server.rb
require "sinatra/base"

class MyServer < Sinatra::Base
  get '/' do
    "Hello from MyServer!"
  end
end
```


## Commands to Try

```bash
cd examples/custom-rack-mount

# Start the server
jobly server

# Call your custom app
curl http://localhost:3000/my
```

