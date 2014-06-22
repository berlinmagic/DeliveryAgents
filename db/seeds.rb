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
      langitude: "52.511661",
      lotitude: "13.456826"
    }
  },
  {
    js_date: "23/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Bornemann Str.",
      street_number: "16",
      zip: "13357",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.549774",
      lotitude: "13.372237"
    }
  },

  {
    js_date: "24/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Fehmarner Str. 14",
      street_number: "14",
      zip: "13353",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.539850",
      lotitude: "13.350480"
    }
  },

  {
    js_date: "25/06/2014",
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
    js_date: "26/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Hausotter Str.",
      street_number: "77",
      zip: "13409",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.568163",
      lotitude: "13.371027"
    }
  },
  {
    js_date: "27/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Livländische Str.",
      street_number: "2",
      zip: "10715",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.482611",
      lotitude: "13.325839"
    }
  },
  {
    js_date: "28/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Voltaire Str.",
      street_number: "5",
      zip: "10179",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.517118",
      lotitude: "13.414847"
    }
  },
  {
    js_date: "29/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Grunerstraße ",
      street_number: "20",
      zip: "10179",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.519980",
      lotitude: "13.414750"
    }
  },
  {
    js_date: "30/06/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Karl-Liebknecht-Str.",
      street_number: "13",
      zip: "10178",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.522250",
      lotitude: "13.407450"
    }
  },
  {
    js_date: "01/07/2014",
    duration: SHIFTS[ rand(3) ],
    job_type: "care",
    address_attributes: {
      street: "Otto-Braun-Straße ",
      street_number: "10",
      zip: "10178",
      city: "Berlin",
      state: "Berlin",
      langitude: "52.523369",
      lotitude: "13.417614"
    }
  }
]