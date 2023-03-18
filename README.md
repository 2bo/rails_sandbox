# Rails Sandbox

This Repository is Sandbox of Ruby on Rails to study, research and trial.

## Setup local

```bash
$ docker-compose build
```

```bash
$ docker-compose run --rm web bin/rails db:migrate
```

```bash
$ docker-compose up -d
```

## Run Spec

```bash
$ docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

