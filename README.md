# Task 1 Solution

## Requirements

- [x] There must be a function for each number from 0 ("zero") to 9 ("nine")
- [x] There must be a function for each of the following mathematical operations: plus, minus, times, divided_by
- [x] Each calculation consist of exactly one operation and two numbers
- [x] The most outer function represents the left operand, the most inner function represents the right operand

## Guidelines

- [x] Use Git and commit as often as you think is necessary to properly tell your story
- [x] Write tests using RSpec proving that your solution works (TDD strongly encouraged)
- [x] Use whatever tools you’d like (gems, patterns, etc)
- [x] Engineer your solution as if there’s a high chance it will be re-used
- [x] Keep lines wrapped at 120 characters
- [x] Enjoy this challenge!

## Solution

Calculator functions are written in a module. Number functions are dynamically defined and return either a proc which accepts an argument, or an integer if no arg is supplied.

Operator functions accept the right-side operand as an argument and return a proc where the left-side operand is supplied as an arg when the proc is `call`ed.

The module can be included in class and the functions will be available as instance methods.
The module can also be used to extend a class and the functions will be available as class methods.

Unit tests `include Calculator` in an `Example` class which is subsequently instantiated as the example Rspec `subject`.

Integration tests `extend Calculator`. Extending allows us to call `six(times(five))` without instantiating an object first.

In order the re-use the calculator, the class and specs could simply be copied into a project, or the entire repo could be included in your project's Gemfile:

```ruby
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gem 'calculator', '~> 1.0', github: 'JurgenJocubeit/task1'
```

## How to use

Calulator module can be included in your class for instance methods, or you can extend your class to access functions as class methods.

```ruby
class InclusionExample
  include Calculator

  def initialize
    puts "six(times(five)) = #{six(times(five))}"
  end
end

InclusionExample.new
#=> six(times(five)) = 30
```

```ruby
class ExtendedExample
  extend Calculator

  def self.call
    puts "six(times(five)) = #{six(times(five))}"
  end
end

ExtendedExample.call
#=> six(times(five)) = 30
```

## Testing

There are 18 examples in total, 11 unit tests and 7 integration tests.

To run the tests, ensure the dependencies are installed:
```
bundle install
```

In Terminal, from the project directory, execute the following:
```
bundle exec rspec
```

Rspec output configuration is included in `.rspec`. To include test profile summary (top 10 slowest examples etc.) change the configuration to include `--profile`:

```
--colour --format documentation --profile
```

### Code Coverage

SimpleCov is used to report code coverage and is automatically included when you run the Rspec examples. You can access the HTML report after running the Rspec examples (see above) by opening `/coverage/index.html`.

The test suite currently has 100% coverage.

### Static Code Analysis & Formatting

Rubocop is used to check for coding and formatting offenses. Rubocop configuration is included in `.rubocop.yml`.

Metrics/BlockLength is overridden to exclude spec files and Metrics/LineLength is set to 120 characters. To perform the check, execute the following:
```
bundle exec rubocop
```

There are currently no offenses detected.
