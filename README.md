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
- [ ] Engineer your solution as if there’s a high chance it will be re-used
- [x] Keep lines wrapped at 120 characters
- [ ] Enjoy this challenge!

## How to use

Calulator module can be included in your class for instance methods, or you can extend your class to access functions as class methods.

```
class InclusionExample
  include Calculator

  def initialize
    puts "six(times(five)) = #{six(times(five))}"
  end
end

InclusionExample.new
#=> six(times(five)) = 30
```

```
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

### Static Code Analysis & Formatting

Rubocop is used to check for coding and formatting offenses. Rubocop configuration is included in `.rubocop.yml`.

Metrics/BlockLength is overridden to exclude spec files and Metrics/LineLength is set to 120 characters. To perform the check, execute the following:
```
bundle exec rubocop
```
