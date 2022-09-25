# Wibio

Welcome to Wibio!

## Before you start

### Prerequisites
Make sure that your system has the proper prerequisites installed. You can use something like *brew*.
These include:

- Ruby (3.1.1) ([Tutorial macOS](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos) | [More info on installing Ruby](https://www.ruby-lang.org/en/documentation/installation/))
- PostgreSQL
- Node.js (should be greater than 8.16.0.)
- Yarn
- [libvips](https://formulae.brew.sh/formula/vips)

### Set up environment

Now you can head to the project folder and run `./bin/setup`

To start the server run `./bin/dev`

> ℹ️ If you are using Windows, you may have to pass the scripts under the bin folder directly to the Ruby interpreter e.g. `ruby bin\rails server`

> 💡 Please add any other steps or info that you consider is missing

### Tailwind
We use tailwind for our styles. You want to run Tailwind in watch mode, so changes are automatically reflected in the generated CSS output. 
You can do this either by running `rails tailwindcss:watch` as a separate process, or by running `./bin/dev` so it starts both the Tailwind watch process and the rails server in development mode.

More to come...
