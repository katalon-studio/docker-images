-- Tested against Docker Toolbox.
-- Make sure the corresponding Windows drives/directories has been added to VirtualBox's shared directories https://docs.docker.com/toolbox/toolbox_install_windows/#optional-add-shared-directories

@echo on

set currentdir=%cd::\=/%
set currentdir=%currentdir:\=/%

docker run -t --rm -v "/%currentdir%:/tmp/source" -w /tmp/source katalonstudio/katalon:%1 katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
