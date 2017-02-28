Create config/external_apis.yml using config/external_apis.yml.example as a guide.

Starting Rails either:
* $`passenger start`
* $`rails s -b 0.0.0.0` webrick (byebug works)

To process deployment background jobs you must do one of the following:
* $`RAILS_ENV=development script/delayed_job start` for a background process
* $`rake jobs:work` foreground process and CTRL+C to stop
* $`rake jobs:workoff` to run all queued jobs and quit
