# Yoda Agency Challenge

## Environment

* Ruby 2.4.0
* Rails 5.0.3
* Rspec 3.6.0

## Configuration

### Clone the repo at local machine:
  * git clone https://github.com/piyush55/cndlunarlocator.git

### Setup

#### Install bundler and run `bundle install`:

```bash
gem install bundler && bundle
```
#### Database setup:

```bash
rename database.yml.example to database.yml
add your postgres db configuration in database.yml 
run rake db:create && rake db:migrate
```

### How to run the application

```bash
 rails s
```
### How to run the test suite

```bash
 rspec
