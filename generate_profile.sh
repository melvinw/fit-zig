#!/bin/sh
set -eu -o pipefail

workdir=$(dirname ${0})
pushd ${workdir} > /dev/null
trap "popd > /dev/null" EXIT

tools/gen-profile-types.py \
	global-profile/enums.csv \
	global-profile/messages.csv \
	> src/gen/profile.zig

zig fmt src/gen/profile.zig > /dev/null
