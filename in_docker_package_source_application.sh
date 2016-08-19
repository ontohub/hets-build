#!/usr/bin/env bash

real_dirname() {
  pushd $(dirname $1) > /dev/null
    local SCRIPTPATH=$(pwd -P)
  popd > /dev/null
  echo $SCRIPTPATH
}
base_dir=$(real_dirname $0)

source "$base_dir/functions.sh"

package_info_printed="$(eval "declare -p $1")"
eval "declare -A package_info="${package_info_printed#*=}

set -x

package_source_application "$(declare -p package_info)"