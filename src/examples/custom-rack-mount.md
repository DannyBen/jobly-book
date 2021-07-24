---
icon: dot
label: Custom Rack Mount
---

# Custom Rack Mount Example

This example demonstrates how to amend the web server so that it also serves any custom rack app.

## Code

=== config/jobly.rb

```ruby
# config/jobly.rb
require_relative '../app/my_server'

Jobly.configure do |config|
  config.mounts = { "/my" => MyServer }
end
```

==- app/my_server.rb

```ruby
# app/my_server.rb
require "sinatra/base"

class MyServer < Sinatra::Base
  get '/' do
    "Hello from MyServer!"
  end
end
```

===


## Commands to Try

```bash
cd examples/custom-rack-mount

# Start the server
jobly server

# Call your custom app
curl http://localhost:3000/my
```

