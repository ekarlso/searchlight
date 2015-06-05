#!/bin/bash

set -ex

# Run the Searchlight DevStack exercises
#$BASE/new/devstack/exercises/searchlight.sh

# Run the Searchlight Tempest tests
sudo ./run_tempest_tests.sh
