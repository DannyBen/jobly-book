#!/usr/bin/env bash
set -e

test/live_reload.sh
test/spell_check.sh
test/broken_links.sh

