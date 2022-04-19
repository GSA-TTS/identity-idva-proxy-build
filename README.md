# IDVA Proxy Build
The proxy build repo exists for the sole purpose of providing precompiled
[Caddy2](https://caddyserver.com/v2) binaries that have the 
[forwardproxy](https://github.com/caddyserver/forwardproxy/tree/caddy2) plugin
included by default. See the [releases page](https://github.com/18F/identity-idva-proxy-build/releases).

## Why this project
Caddy2 has become an unofficial default for Cloud.gov applications needing an
easy-to-use forwardproxy implementation. By default the Caddy2 binary does not
have the required forwardproxy plugin needed to use the server as a forward
proxy. This repo solves that problem by compiling Caddy using
[xcaddy](https://github.com/caddyserver/xcaddy) with the forwardproxy plugin
ready to go, reducing the effort required to quickly get the proxy in place.

See the [example script](install_caddy_example.sh)

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in
[CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright
and related rights in the work worldwide are waived through the
[CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication.
By submitting a pull request, you are agreeing to comply with this waiver of
copyright interest.
