# podified-kuttl

A rough sketch of an approach to KUTTL testing of Podified operators.

In addition to what follows, see contents of [kuttl-test.yaml](https://github.com/abays/podified-kuttl/blob/master/kuttl-test.yaml) for further details.

## Execution

`[SKIP_INIT=true] [TEST_TARGET=<test name>] ./run.sh`.
Omitting a `TEST_TARGET` will cause all tests to be executed.

## Structure

- `init.sh`: clones operator repos to acquire CRDs and sample CR YAMLs
- `run.sh`: executes the actual test or tests
- `kuttl-test.yaml`: configuration file for KUTTL itself
- `common`: contains elements that might be used across multiple tests, which include:
    - `manifests`: resource YAMLs
    - `scripts`: bash scripts
    - `tests/steps`: KUTTL steps
    - `tests/assert`: KUTTL assertions
- `tests`: contains the individual tests in their own sub-directories.  These will likely symbolically link to common elements in `common` but also contain unique KUTTL steps and assertions pertaining to each test.
