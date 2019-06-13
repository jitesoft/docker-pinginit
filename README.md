# Pinginit

Alpine linux image running a script which tests a `target` endpoint with ping until it responds or until `times` queries have been made.  
If service responds, it will return `exit 0`, if time out, `exit 1`.

This image is intended to be used as a init container in kubernetes to make sure that a given service is running before the pod starts the real containers.

## Usage

```bash
docker exec --rm pinginit:latest pinginit --target=https://example.com --times=3 --await=2
```

### Arguments

`--target`  
Target is required, if not set, the script will exit. Should be an endpoint reachable with `ping`.

`--times`  
How many times to ping until timeout. Defaults to 50 if not set.

`--await`  
How long to wait between sending ping. Defaults to 1 second if not set.

`--help`  
Prints usage information.

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).
