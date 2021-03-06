#!/usr/bin/env bash
set -e

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! "${BASEDIR}" == "/app/tests" ]]; then
  echo "[!] The tests currently require a MySQL backend."
  echo "[!] Please execute this instead through Docker with:"
  echo -e "\tdocker/docker-admin.sh test"
  exit
fi

# Make sure we are in the project root directory before executing the test runner.
cd ${BASEDIR}/../

# More pytest options:
# -s:           To disable stdout capturing / to always show stdout.
# -k "keyword": Filter tests for a specific keyword.

pytest -vv \
  --cov-config=.coveragerc \
  --cov-report html \
  --cov=app \
  --cov=lib \
  --cov=data \
  --cov=templates \
  --log-level=DEBUG \
  --color=yes \
  -k "${TEST_FILTER}" \
  tests
