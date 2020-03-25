# NeedHave.io

## Setup

Run these commands on MacOS to install required dependencie
and setup the project directory.

```sh
brew install ruby yarn postgresql
brew services start postgresql
gem install rails
gem install pg -- --with-pg-config=/usr/local/bin/pg_config
bundle install
yarn install
yarn run touch
rails db:setup
```

## Development

Use `rails server` to run the server.
Use `rails db:migrate` to run outstanding database migrations.

Other commands:

    # Create a new database table / model
    rails generate model Article title:string text:text

    # Create a file to change a database table
    rails generate migration AddPartNumberToProducts


## Project structure

The files and folders we care about are:

    # Server
    app/
      assets/       # Static assets
      channels/     # Websocket handlers
      controllers/  # HTTP Handlers
      models/       # Database / ORM
    config/
        routes.rb   # Defines API endpoints

    # Database
    db/

    # Dependencies
    Gemfile
    package.json

You can pretty much ignore everything else.
