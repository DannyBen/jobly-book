#!/usr/bin/env bash
source "test/test_helper.bash"

header "Test: Broken Links"
if ! (sla check localhost:3000 --depth 10 --external --ignore "/do/Hello /statuses"); then
  error "FAIL: Broken Links"
  exit 1
fi
