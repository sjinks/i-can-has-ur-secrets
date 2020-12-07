# i-can-haz-ur-secrets

Node.js package to catch insecure invocations of 'npm ci', when a malicious script has a chance to steal your secret environment variables

The package provides `preinstall`, `install`, `postinstall` scripts, which scan your environment variables for some common patterns; if a suspicious variable is found, the script aborts with the exit code of 1.

The idea behind the package is to enforce the correct usage of `npm ci`, so that malicious scripts cannto steal your `GITHUB_TOKEN` or `NODE_AUTH_TOKEN`.
