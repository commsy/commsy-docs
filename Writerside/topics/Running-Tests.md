# Running tests
In CommSy tests are performed by running Codeception, a complete test suite for php.
Different types of tests are preformed. Those are - but not limited to - Unit-, Acceptance- and Functional- Tests.

Tests are performed in a dedicated environment and database.

```bash
    # Run all tests
    make test
    
    # Just unit tests
    make test c="Unit"
```

Running test from within the php container:
```bash
    APP_ENV=test php vendor/bin/codecept run
```