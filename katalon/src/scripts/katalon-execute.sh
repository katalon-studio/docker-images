#!/usr/bin/env bash

set -xe

$KATALON_BASE_ROOT_DIR/scripts/xvfb.sh start

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

current_dir=$(pwd)

# create tmp directory
workspace_dir=/tmp/katalon_execute/workspace
mkdir -p $workspace_dir
chmod -R 777 $workspace_dir

# source directory
source_dir=$KATALON_KATALON_ROOT_DIR/source
if ! [ -d "$source_dir" ]; then
  source_dir=$(pwd)
fi

# project source code
project_dir=/tmp/katalon_execute/project
mkdir -p $project_dir

cp -r $source_dir $project_dir

# create .classpath if not exist
touch $project_dir/.classpath || exit
chmod -R 777 $project_dir

# create report directory
report_dir=$KATALON_KATALON_ROOT_DIR/report
if ! [ -d "$report_dir" ]; then
  report_dir=$source_dir/report
fi
mkdir -p $report_dir

# build command line
project_file=$(find $project_dir -maxdepth 5 -type f -name "*.prj" -print -quit)

for x in "${@}" ; do
  # try to figure out if quoting was required for the $x
  if [[ "$x" != "${x%[[:space:]]*}" ]]; then
    x="\""$x"\""
  fi
  echo $x
  _args=$_args" "$x
done

cmd="$KATALON_KATALON_INSTALL_DIR/katalon -runMode=console -reportFolder=$report_dir -projectPath=$project_file $_args"

cd $workspace_dir
eval "$cmd"

#clean up

chmod -R 777 $report_dir
ls $report_dir

cd $current_dir
