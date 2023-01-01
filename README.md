# README

## [URL Shortener](https://radiant-gorge-16116.herokuapp.com/)

### Requirements

* Ruby version: 3.1.2
* Rails version: 7.0.4
* Yarn version: 1.22.19
* Node version: 16.4.0

### Test

```ruby
rails db:create
rails db:migrate

rails assets:precompile

rails test
```

### Development

```ruby
rails db:create
rails db:migrate

foreman start -f Procfile.dev
```
