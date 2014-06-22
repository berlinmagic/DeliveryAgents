# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SHIFTS = [2,4,8]


JOBS = [
  {
    js_date: "22/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Grünberger Str.",
      street_number: "60",
      zip: "10245",
      city: "Berlin",
      state: "Berlin",
      langitude: "",
      lotitude: ""
    }
  },
  {
    # ...
  }
]