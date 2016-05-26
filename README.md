# Demo App
## Installation
Requirement
  - Ruby on rails
  - postgresql database
  - create enviroment variable PG_USER with value your postgresql user
  - create enviroment variable PG_PASS with value your postgresql password

Development :
  - create demoapp_development database
  - rake db:migrate
  - rake db:seed
  - rails s

check your http://localhost:3000/

Testing : 
    - create demoapp_test database
    - rake db:migrate RAILS_ENV=test
    - bundle exec rspec spec/controllers/api/v1/users_controller_spec.rb
    - bundle exec rspec spec/controllers/api/v1/organizations_controller_spec.rb

### Version
1.0.0

