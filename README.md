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

## Project structure

The files and folders we care about are:

    app/          # The rails server
    db/           # The database migrations
    Gemfile       # The ruby dependencies
    package.json  # The javascript dependencies

You can pretty much ignore everything else.
