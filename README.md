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

Other commands:

  - __Create Model:__ rails generate model Article title:string text:text
  - __Update Model:__ rails generate migration AddPartNumberToProducts

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
