#!/bin/bash

# Add a new user to the partners table

# This is designed to be run as one-off ECS task with the command:
#
# /web/utils/adduser.sh,email@address.com,MySecretPassword
#
# Output should be something like:
#
# #<Partner id: 732, email: "email@address.com", created_at: "2019-08-07 17:52:42", updated_at: "2019-08-07 17:52:42">

email="$1"
pass="$2"

echo 'Partner.create!({:email => "'$email'", :password => "'$pass'", :password_confirmation => "'$pass'" }) unless Partner.find_by(email: "'$email'")' | /web/bin/rails c
