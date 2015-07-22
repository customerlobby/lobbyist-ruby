# Lobbyist Ruby bindings

## Installation

You don't need this source code unless you want to modify the gem. If
you just want to use the Lobbyist Ruby bindings, you should run:

  gem install lobbyist

If you want to build the gem from source:

  gem build lobbyist.gemspec

## Documentation

  TODO: Get Documentation URL.

  Please see ### API DOCUMENTATION URL ### for up-to-date documentation.

### Usage Note

  If you need to check for the presence of an object returned from Lobbyist you will need
  to check for the presence of an actual attribute. For example:

  ```ruby
  company = Lobbyist::V2::Company.find(10000)
  company.present? # This will always be true because 'company' is a valid Lobbyist object.
  # This is probably what you want. It checks that data was actually returned from the API.
  company.company_id.present?
  ```

## Requirements

* Ruby 1.9.0 or above.
* faraday, multi-json, activesupport

## Development

If you would like to run the tests simply run `rspec` in the root of the project.

Open `coverage/index.html` to see a code coverage report generated from the test run.

### Building Lobbyist

For projects that include Lobbyist as a gem, currently only the Members project, follow
these steps to update the lobbyist-ruby gem.

1. Clone the lobbyist-ruby project separately.
2. Create a branch to make your changes on.
3. Make any required changes. (Add classes, methods, attributes, etc.)
4. If you added a new class be sure to update `lib/lobbyist.rb` with a `require` statement for the new class.
5. Bump the `lib/lobbyist/version.rb` patch number. This is required for bundler to detect the update.
6. Add a note to the CHANGELOG about your changes.
7. Commit those changes directly to the lobbyist-ruby branch you created.
8. Create a pull request on Github.

Using the changes in the host project.

1. Go to the host project.
2. Create a branch for your changes.
3. Run `bundle update lobbyist-ruby` to force bundler to update the lobbyist gem.
4. Make any other required changes.
5. Commit your changes along with the Gemfile.lock to your branch.
6. Create a pull request on Github.

Now lobbyist-ruby needs to be updated on the gem host we use with Semaphore, Gemfury.

1. Make a gemfury directoy somewhere in your local drive.
2. Clone the lobbyist-ruby project into the gemfury directory.
3. Build the gemspec, `gem build lobbyist.gemspec`.
4. Upload the gem to Gemfury, `curl -F package=@lobbyist-ruby-0.#.##.gem https://P7qkxZzYFkrcJPGnWV43@push.fury.io/customerlobby/`. Be sure to replace the version and patch numbers.
