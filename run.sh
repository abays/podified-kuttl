#!/bin/bash

$SKIP_INIT=${SKIP_INIT}
$TEST_TARGET=${TEST_TARGET}

if [ -z "$SKIP_INIT" ] || [ "$SKIP_INIT" != "true" ]; then
    ./init.sh
fi

if [ -n "$TEST_TARGET" ]; then
    TEST_TARGET="--test $TEST_TARGET"
fi

kubectl-kuttl test ${TEST_TARGET}
