# efend

**efend** (short for *External Frontend*) is a simple web interface for various activities performed during penetration test activities. It is being written in a way that should make contributors worry most about the tests themselves than in how to integrate their results back into the application.

## Installation

**efend** uses [Bundler](http://gembundler.com/) for dependency management. Setting up the required gems should be as simple as running:

    bundle install

If you try to run **efend** without first installing all the required gems, Bundler will complain and abort its execution.

## Running

Since **efend** uses [Sinatra](http://www.sinatrarb.com/), which is based on [Rack](http://rack.github.com/), running require starting up the **rackup** script from the application root:

    rackup
    
## Screenshot

http://img248.imageshack.us/img248/2438/screenshot20121217at217.png
