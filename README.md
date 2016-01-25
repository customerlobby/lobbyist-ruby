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

### VCR Tests

The tests have been converted over to VCR. This makes the tests much easier to write and
maintain. Check the official [VCR gem](https://relishapp.com/vcr/vcr/docs) for full documentation.

This will be a brief introduction to writing VCR tests for this project. Here is a sample from the
company_spec.rb tests.

```ruby
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('company_find_error') do
        expect{Lobbyist::Company.find(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end
    
    it 'should return the found company' do
      VCR.use_cassette('company_find') do
        company = Lobbyist::Company.find(127)

        expect(company).to_not be_nil
        expect(company).to be_a(Lobbyist::Company)
        expect(company.company_name).to eq('Customer Lobby')
      end
    end
  end
```

The first line in each test is `VCR.use_cassette('...')`. The string provided is the name of
a file that VCR will use to simulate the remote call. If the file doesn't exit yet VCR will
actually call the remote API, get the results and use them to generate the fixture file. So the test
writing process goes something like:

1. Write the particular test you need and specify a file name for VCR to save the results in.
2. Run the test. At this point the cassette file doesn't exist, so VCR will actually hit the API.
3. If the API call was successful and the test assertions passed the test complete. Future test runs will use the cassette file that was just generated.
4. If the API call failed for some reason you will need to delete the cassette file that was created and fix whatever problem caused the API call to fail.

There is no need to write complex mock statements. You write your test the way you normally would for
non-remote code, and just wrap that in a `VCR.use_cassette('...') do end` block.

Keep in mind that because VCR hits the API for each cassette file you will need to have your development
API server running and the data you pass must be valid data. In the example above, for example, the company_id
that is passed to the find method actually exists in the database. For create and update tests you
will also need to actually create a record and update an existing record.

If you would like to see the cassette files generated from your calls they are stored at `spec/cassettes`.
There is a subdirectory for V2 based tests.

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

1. Make a gemfury directory somewhere in your local drive.
2. Clone the lobbyist-ruby project into the gemfury directory.
3. Run the deploy script which will build and push the gem to gemfury `ruby deploy.rb`