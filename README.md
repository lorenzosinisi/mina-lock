# Mina Lock

Lock the deployment of your app using mina.

Quite often I found myself in need to ask other developers to not deploy a specific app for some time. Usually I have used slack or other chat channels for that purpose but it is not efficient and you need to read updates from the channel in order to know if it is 'ok' to deploy or not. 

This gems adds 2 task to manually 'lock' and 'unlock' the deployment of mina creating a file called 'deployment.lock' that should be checked before each deployment, using the task 'fail:when_locked'.

## Installation

Via Bundler:

```ruby
# Gemfile
gem 'mina-lock', require: false
```


## Usage example

```ruby
# config/deploy.rb

require 'mina/lock'

... other options

task deploy: :environment do
  deploy do
    invoke 'fail:when_locked' # should be the first thing you want to check
    invoke 'git:clone'
    ...
  end
end
```

## Tasks

```
mina lock:deployment    # Locks the deployment
mina unlock:deployment  # Unlocks the deployment
```

## Contributing

Feel free to contribute!
