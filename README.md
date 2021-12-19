# SystemX - Customer Control System 

SystemX is a system that was thought and designed to control the sales of products or services made to clients. It is the beginning of a future labor independence.

Notes: 

- Idea, Design and Development by: Diego Valdés.

- System developed with Ruby on Rails 

- Development subject to changes and improvements 

## System Explanation


The system is made up of modules, each module responds to a model (mvc architecture), they are detailed below:

Operation Modules:

- Client Module: Contains the identification information of the Companies.
- Contact Module: Contains the contact information of each company.
- Products Module: Contains the information of the products offered to the market.
- Executive Module: Contains the contact information of the seller.
- Orders / Sales Module: Contains the information of the sales made to each client.
- Users Module: Contains information about user administration. 

Administration Modules:

- Users Module: Contains the information of the users of the system.

## System Operation

Professional products and services offered to the market must be uploaded, as well as the company's sales executives. Each sale made will require prior registration of the company and its contact. 

## Test System

To test the system, use the following URL and accounts:

URL: https://thesystemx.herokuapp.com/

- To use the system

Type: Administrator User
Note: access to all modules
email: dvaldes@systemx.cl
password: 123456

Type: Non administrator User
Note: limited access to modules
email: valeria@systemx.cl
password: "123456"

Type: Registered user
Note: Not authorized, Can only view 
email: isidora@systemx.cl
password: 123456

- To manage users 

Type: Administrator User
email: admin@systemx.cl
password: 123123


## Project Management

The administration of the project and the control of activities of the application, are being registered in: 

[Trello](https://trello.com/b/uY9LMbNt/systemx)

## Development Tools

```bash
rvm 1.29.12
ruby 2.5.3p105
Rails 5.2.6
```
## Gems

```bash

# Gem for User management
gem 'activeadmin' 

# Gem for Logins management
gem 'devise'

# Gem for Secure Password
gem 'bcrypt', '~> 3.1.7'

# Gem for Bootstrap
gem "bootstrap", "~> 4.3.1"

# Gem for Jquery
gem "jquery-rails", "~> 4.4"

# Gem to generate fake data
gem "faker", "~> 2.19"

# Gem for Graphs
gem "chartkick", "~> 3.4"

# Gem for Grouping required by Chartkick gem
gem "groupdate", "~> 5.2"

# Gem for Pagination
gem 'kaminari'

# Gem for Roles
gem 'cancancan'
```
