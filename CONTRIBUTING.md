# Contributing

## Installing the code for development

This project uses [Appraisal](https://github.com/thoughtbot/appraisal) to test
against Rails 3.0-4.2 You can get up and running via the default rake task:

```
bundle
bundle exec rake
```

This will install all gemfiles needed and run the test suite against each.

## Submitting Issues

Feel free to open issues on this repo that:

- Clearly articulate the problem
- Describe how to reproduce it in a development environment
- Describe the expected output
- Include tangible examples

## Submitting Pull Requests

Likewise, pull requests should:

- Describe the problem and its solution
- Include passing tests on all supported versions of AR for any new or changed code
- Not introduce new lint violations
