@echo on

docker run -t --rm -v "%cd%:/tmp/source" -w /tmp/source katalonstudio/katalon:test katalon-execute.sh -browserType="Firefox" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
