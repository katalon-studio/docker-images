#!/usr/bin/env bash

set -xe

echo "Starting Katalon Studio"

cat $KATALON_VERSION_FILE

current_dir=$(pwd)

# create tmp directory
tmp_dir=$KATALON_KATALON_ROOT_DIR/tmp
mkdir -p $tmp_dir
chmod -R 777 $tmp_dir

# source directory
source_dir=$KATALON_KATALON_ROOT_DIR/source
if [ -d "$source_dir" ]; then
  source_dir=.
fi

# project source code
project_dir=$KATALON_KATALON_ROOT_DIR/project
mkdir -p $project_dir

cp -r $source_dir $project_dir

# create .classpath if not exist
touch $project_dir/.classpath || exit
chmod -R 777 $project_dir

# create report directory
if [ -d "$KATALON_KATALON_ROOT_DIR/report" ]; then
  report_dir=$KATALON_KATALON_ROOT_DIR/report
else
  report_dir=$source_dir/report
fi
mkdir -p $report_dir

# build command line
project_file=$(find $project_dir -maxdepth 5 -type f -name "*.prj" -print -quit)

if [ -z "$report_dir" ]; then
  cmd="$KATALON_KATALON_INSTALL_DIR/katalon -runMode=console -reportFolder=$report_dir -projectPath=$project_file $KATALON_OPTS"
else
  cmd="$KATALON_KATALON_INSTALL_DIR/katalon -runMode=console -projectPath=$project_file $KATALON_OPTS"
fi

# execute
$KATALON_BASE_ROOT_DIR/scripts/xvfb.sh start
cd $tmp_dir
eval "$cmd"

#clean up

chmod -R 777 $report_dir
ls $report_dir

cd $current_dir
