@echo on

set current_dir=%cd%
set script_dir=%~dp0
set project_dir=%script_dir%.
set reports_dir=%project_dir%\..\reports\chrome

del /f /s /q "%reports_dir%"
rmdir /s /q "%reports_dir%"
mkdir "%reports_dir%"

set katalon_opts="-browserType=\"Chrome\" -retry=0 -statusDelay=15 -testSuitePath=\"Test Suites/TS_RegressionTest\""
docker run --rm -v "%project_dir%":/katalon/katalon/source:ro -v "%reports_dir%":/katalon/katalon/report -e KATALON_OPTS=%katalon_opts% katalon-katalon

cd "%current_dir%"
