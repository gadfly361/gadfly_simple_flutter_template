# Development Workflows

## Starting a new feature

When getting ready to develop a new feature, this is my typical workflow:

### Step 1: Update your local repository

- in a terminal, run: `git pull origin main`
- run VSCode task `[App] Prebuild (Once)`

### Step 2: Run development tasks

- run VSCode task `[App] Local Development Tasks`*

_*A convenience task that starts up the following in parallel:_

- run VSCode task `[App] Build Runner (Watch)`
- run VSCode task `[App] Slang (Watch)`
- run VSCode task `[App] Test Gallery (Serve)`
- run VSCode task `[Project] Documentation (Serve)`

### Step 3: Run the application

- in VSCode, go to "Run and Debug", and run `development (debug)`
- in VSCode, open Command Palette, and run `Flutter: Open DevTools`, and select `Open DevTools in Web Browser`. In particular, I go to the `bloc_devtools_extension` tab.

## Writing Flutter Tests

When writing flutter tests, this is my typical workflow:

- run VSCode task `[App] Test Gallery (Serve)`
- open a browser and go to [localhost:8001](http://localhost:8001)
- write flows tests in `app/test/flows/` directory
- to run an individual test, I tap on the Code Lens above the test that says `FlowTest`
- to run all of the tests, I go to "Run and Debug" tab, and run `run flow tests`
- after running the tests, I refer back to the Test Gallery that is running at [localhost:8001](http://localhost:8000)
- sometimes tests fail or you change the name of tests, etc. When this happens, I will often clean up all the generated screenshots by running the task `[App] Test Gallery (Clean)`. To regenerate the screenshots based on the current tests, I would rerun `run flow tests` from the "Run and Debug" tab.
