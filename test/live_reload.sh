#!/usr/bin/env bash
source "test/test_helper.bash"

# Check that the generated site does not have livereload
# This can happen if you push the repository after the local server ran
# locally, and was not rebuild.
header "Test: Livereload"
if grep -lir livereload docs; then
  error "FAIL: Livereload"
  echo "     Generated docs contain Livereload code. Rebuild please."
  exit 1
else
  echo "Done, no issues"
fi

