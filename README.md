# Mina Lock

Manually lock and unlock the deployment of your app when using Mina. Prevent other team members from deploying an application using a custom lockfile.


When the deployment is locked it will make it fail and output something like "The deployment of this project was locked by USERNAME at TIME. Run mina unlock:deployment"


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

Adds 2 task to manually 'lock' and 'unlock' the deployment of mina creating a file called 'deployment.lock' that should be checked before each deployment.

## Tasks

```
mina lock:deployment    # Locks the deployment manually
mina unlock:deployment  # Unlocks the deployment
```

## Contributing

Feel free to contribute!
