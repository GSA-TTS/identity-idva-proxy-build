#!/bin/bash -e
# Install 'xcaddy' to build caddy binary with forwardproxy plugin
xcaddy_version=$(cat XCADDY_VERSION)
xcaddy_downloads_url="https://github.com/caddyserver/xcaddy/releases/download/v$xcaddy_version"
xcaddy_archive_filename=xcaddy_"$xcaddy_version"_linux_amd64.tar.gz
xcaddy_checksum_filename=xcaddy_"$xcaddy_version"_checksums.txt

wget --no-verbose "$xcaddy_downloads_url/$xcaddy_archive_filename" 
wget --no-verbose "$xcaddy_downloads_url/$xcaddy_checksum_filename"

shasum --check --ignore-missing --status "$xcaddy_checksum_filename"

# Extract xcaddy and clean up
xcaddy_binary=xcaddy
tar -xzf "$xcaddy_archive_filename" "$xcaddy_binary"
rm "$xcaddy_archive_filename" "$xcaddy_checksum_filename"

# Build caddy2 with the forwardproxy plugin and produce release artifacts
caddy_version=$(cat CADDY_VERSION)
./xcaddy build v"$caddy_version" --with github.com/caddyserver/forwardproxy@caddy2
rm "$xcaddy_binary" # We're done with xcaddy

# Create the release artifacts
caddy_binary=caddy
forwarproxy_archive_filename=caddy-forwardproxy-"$caddy_version"-linux-amd64.tar.gz
tar -czvf "$forwarproxy_archive_filename" "$caddy_binary"
rm "$caddy_binary"

sha256sum_filename=sha256sums.txt
sha256sum "$forwarproxy_archive_filename" > "$sha256sum_filename"

release_dir=release
mkdir "$release_dir"
mv "$sha256sum_filename" "$release_dir"
mv "$forwarproxy_archive_filename" "$release_dir"
