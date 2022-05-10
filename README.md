# Wibio

Welcome to Wibio!

## Before you start

> 💡 Please add any other steps or info that you consider is missing

Make sure that your system has the proper prerequisites installed. You can use something like *brew*.
These include:

- Ruby (3.1.1)
- SQLite3
- Node.js (should be greater than 8.16.0.)
- Yarn
- [libvips](https://formulae.brew.sh/formula/vips)

Now you can head to the project folder and run:

`bundle install`

### Tests
We use RSpec for testing, so before start building make sure all tests are passing with `rake spec`

### Tailwind
We use tailwind for our styles. You want to run Tailwind in watch mode, so changes are automatically reflected in the generated CSS output. 
You can do this either by running rails `tailwindcss:watch` as a separate process, or by running `./bin/dev` so it starts both the Tailwind watch process and the rails server in development mode.

More to come...
