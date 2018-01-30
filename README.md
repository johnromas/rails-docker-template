## Docker Rails Template

1. Change `myapp` in `Dockerfile` and `docker-compose` to your app name
2. `docker-compose run web rails new . --force --database=postgresql`
3. `docker-compose build`
4. Replace `database.yml` with the following (change `myapp` here as well)
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```
5. `docker-compose up`
6. `docker-compose run web rake db:create`
7. `http://localhost:3000` to see the app
8. `docker-compose down` to stop

Notes

- `docker-compose up -d` to run in detached mode
- `docker-compose run rails g model Something`
- `docker-compose run rails db:migrate`

- `docker-compose up --build` when changing config/dependencies
- `rm tmp/pids/server.pid` if server is running when trying to start


