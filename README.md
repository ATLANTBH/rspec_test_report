rspec_test_report: RSpec test reports web dashboard
===================================================

This project is directly related to https://github.com/ATLANTBH/rspec and uses its database from which it pulls the results and shows them on web app dashboard.

Following steps needed fo installation:

1. Git clone this (rspec_test_report) repository

2. Run bundle install to install dependencies needed for rspec_test_report application

3. Configure database config file params (/rspec_test_report/config/database.rb) to point to correct database params which can be find in rspec2db.yml (/rspec_test_report/config/rspec2db.yml)

4. Run padrino rake ar:migrate to create accounts db table from existing model (e.g. bundle exec padrino rake ar:migrate)

5. Run padrino start from the rspec_test_report directory to start the application (e.g. bundle exec padrino start)
