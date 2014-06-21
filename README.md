# Winning App of Battlehack 2014 in Berlin :)




```ruby

rails g model user name first_name last_name email user_type 

rails g model authentication uid email provider link user:references

rails g model product name description:text price:decimal 

rails g model cart user:references amount:decimal state

rails g line_item product:references count:integer cart:references

rails g model address 


```