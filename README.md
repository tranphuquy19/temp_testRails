# README

## Demo here: https://youtu.be/InPNwIIf4TE


## Installation guilde

```shell
curl -L https://get.rvm.io | bash -s stable --ruby
source /home/$USER/.rvm/scripts/rvm # activate ruby enviroment
rvm install ruby-2.6.1 # install ruby version 2.6.1 <- this project uses ruby v2.6.1
gem install rails
git clone https://github.com/tranphuquy19/Rails_Test_Online.git
cd Rails_Test_Online
bundle install
rails db:create
rails db:migrate
rails seeder:all # seed the data <- run `rails -h` to get all commands
rails test_online:setAdminByEmail[tranphuquy19@gmail.com] # choose the user wiith email tranphuquy19@gmail.com as the admin account
rails server # start server
```