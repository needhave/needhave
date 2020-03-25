# NeedHave.io

## Setup

Run these commands on MacOS to install required dependencies.

```sh
brew install ruby yarn
gem install rails
bundle install
yarn install
yarn run init
```

## Development

Use `rails server` to run the server.
Use `rails db:migrate` to initialize the database.

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
