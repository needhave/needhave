# NeedHave.io

## Setup

Run these commands on MacOS to install required dependencie
and setup the project directory.

```sh
brew install ruby yarn postgresql
brew install postgis
brew services start postgresql
gem install rails
gem install pg -- --with-pg-config=/usr/local/bin/pg_config
npm install -g ember-cli
bundle install
yarn install
yarn setup
rails db:setup
```

## Development

Use `rails db:migrate` to run outstanding database migrations.
Use `rails server` to run the server.

The app runs at [http://localhost:3000](http://localhost:3000).

  > WARNING: The first render might fail, just reload the page.

Other commands:

    # Create a new model
    rails generate resource Article title:string text:text

    # Create a file to change a database table
    rails generate migration AddPartNumberToProducts


## Project structure

The files and folders we care about are:

    # Backend
    app/
      models/       # Data Model
      channels/     # Websockets
      controllers/  # HTTP Handlers
    config/
      routes.rb   # Defines API endpoints

    # Database
    db/
      migrations/   # SQL migrations

    # Frontend
    frontend/app
      models/       # Data access layer
      routes/       # JS for pages
      templates/    # HTML for pages
      components/   # Reusable components
      router.js     # List of pages
      app.js

You can pretty much ignore everything else.
