#!/usr/bin/env bash

header() {
  green "\n===> $@"
}

error() {
  red "\n===> $@"
}

red() { printf "\e[31m%b\e[0m\n" "$*"; }
green() { printf "\e[32m%b\e[0m\n" "$*"; }

# Check that the generated site does not have livereload
# This can happen if you push the repository after the local server ran
# locally, and was not rebuild.
header "Test: Livereload"
if grep -lir livereload docs; then
  error "FAIL: Livereload"
  echo "     Generated docs contain Livereload code. Rebuild please."
  exit 1
fi

# Check broken links
header "Test: Broken Links"
if ! (sla check localhost:3000 --depth 10 --external --ignore "/do/Hello /statuses"); then
  error "FAIL: Broken Links"
  exit 1
fi

# Check splling errors
header "Test: Spellcheck"
for f in src/*.md ; do
  echo "$f"
  output=$(aspell list --lang=en --personal aspell-custom-dict.txt --home-dir test < "$f")
  if [[ $output ]]; then
    failed=1
    echo "$output"
  fi
done

if [[ $failed ]]; then
  error "FAIL: Spellcheck"
  echo "     You have some typos."
  echo "     If they are valid, add them to test/aspell-custom-dict.txt"
  exit 1
fi

header "All good"
