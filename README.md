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
- rake db:migrate RALS_ENV=test
- bundle exec rspec spec/controllers/api/v1/users_controller_spec.rb
- bundle exec rspec spec/controllers/api/v1/organizations_controller_spec.rb

## Endpoints

    GET /api/v1/users
    
    GET /api/v1/users/:id
    
    POST /api/v1/users
    required params : 
    name
    address
    email
    
    PUT /api/v1/users/:id
    required params : 
    name
    address
    email
    
    DELETE /api/v1/users
    
    POST /api/v1/users/:id/join
    required params : 
    organization_id
    
    POST /api/v1/users/:id/leave
    required params : 
    organization_id
    
    GET /api/v1/organizations
    
    GET /api/v1/organizations/:id
    
    POST /api/v1/organizations
    required params : 
    name
    
    PUT /api/v1/organizations/:id
    required params : 
    name
    
    DELETE /api/v1/organizations/:id

### Version
1.0.0

