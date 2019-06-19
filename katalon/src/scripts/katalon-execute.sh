#!/usr/bin/env bash

set -x
# Skip set -e to save the reports

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

cp -r $source_dir/* $project_dir

project_prj_file=$(find $project_dir -name "*.prj")

# download dependencies
cd $project_dir
if [ -f "$project_dir/build.gradle" ]; then
  gradle --console=plain katalonCopyDependencies
fi
cd $current_dir

# create .classpath if not exist
touch $project_dir/.classpath || exit
chmod -R 777 $project_dir

# remove generated file
rm -rf $project_dir/bin
rm -rf $project_dir/Libs

ls -la $project_dir

# create report directory
report_dir=$KATALON_KATALON_ROOT_DIR/report
if ! [ -d "$report_dir" ]; then
  report_dir=$source_dir/report
fi
mkdir -p $report_dir

# build command line
args=("$KATALON_KATALON_INSTALL_DIR/katalon" "$@")
args+=("-runMode=console")
args+=("-reportFolder=$report_dir")
args+=("-projectPath=$project_prj_file")

cd $workspace_dir

xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

#clean up

chown -R $(id -u):$(id -g) $report_dir
chmod -R 777 $report_dir
ls $report_dir

cd $current_dir

exit $ret_code
