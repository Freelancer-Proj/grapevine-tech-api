# README

- How to run local Grapevine Admin
    - Require: Ruby, Rails, Postgres (https://gorails.com/setup/osx/10.15-catalina)
    - Run terminal:
        - rails db:create 
        - rails db:migrate
        - rails c
        - AdminUser.create!(:email =>"admin@expample.vn", :password =>"12345678", :password_confirmation =>"12345678") (run to create first user to login)
        - Control C to stop rails c and next run: rails s


- How to deploy Grapevine Admin
    - Unzip file project grapevine-tech-api
    - Run terminal
        - bundle exec cap staging deploy (run to deploy code master to server)
        - bundle exec cap staging unicorn:restart (run to restart unicorn)
