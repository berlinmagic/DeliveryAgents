# Winning App of Battlehack 2014 in Berlin :)




```ruby

rails g model user name first_name last_name email user_type 



rails g model address street street_number zip city zip country longitude:float latitude:float user:references


rails g model job wordload description:text date:datetime duration:integer state client:references agent:references

rails g model application job:references agent:references state

```