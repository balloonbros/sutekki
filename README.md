# Sutekki

[![wercker status](https://app.wercker.com/status/19f939fdce34758be860c4ddb244e951/m "wercker status")](https://app.wercker.com/project/bykey/19f939fdce34758be860c4ddb244e951)

## Install

```
$ git clone git@github.com:balloonbros/sutekki.git
$ cd sutekki
$ bundle install
```

### Database creation

```
$ bin/rake db:migrate
```

### Run server

```
$ bin/rails server
```

### Configuration

Add your application configuration to your `.env` file in the root of your project:

```
SITE_URL="http://localhost:3000"
SLACK_WEBHOOK_URL=""
```

### How to run the test suite

```
$ bundle exec rspec spec/
```

### Deploy to Heroku

```
$ git push heroku master
$ heroku run rake db:migrate --app HEROKU_APP_NAME
```
