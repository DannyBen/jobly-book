#!/usr/bin/env bash
# Check that the generated site does not have livereload
# This can happen if you push the repository after the local server ran
# locally, and was not rebuild.
grep -lir livereload docs
if [[ $? == 0 ]]; then
  echo "Failed: Generated docs contain Livereload code. Rebuild please."
  exit 1
fi

set -e

# Check broken links
sla check localhost:3000 --depth 10 --external --ignore "/do/Hello /statuses"

echo "Completed successfully"
