# encoding: utf-8
# 
#   CareAgents - DataBase - Seeds
#

## Savely reset Database
puts 'Drop all tables'
ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.drop_table t }
Rake::Task["db:migrate"].invoke

puts '... Migration done ...'


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

AGENTS = [
  {
    first_name: "John",
    last_name: "Lunn",
    image_url: "http://wip.org/media/lunn_john_abosch.jpg",
    email: "jl@careagents.de",
    password: "paypal"
  },
  {
    first_name: "Christiano",
    last_name: "Betta",
    image_url: "http://c1.staticflickr.com/3/2188/2335873600_cc65700a8c_b.jpg",
    email: "cb@careagents.de",
    password: "paypal"
  },
  {
    first_name: "Didier",
    last_name: "Vermieren",
    image_url: "http://webmission.be/wp-content/uploads/2012/03/Didier_Vermeiren.jpg",
    email: "dv@careagents.de",
    password: "paypal"
  },
  {
    first_name: "Sascha",
    last_name: "Karstädt",
    image_url: "http://youisnow.com/wp-content/uploads/sascha_druck-150x150.jpg",
    email: "sk@careagents.de",
    password: "paypal"
  },
  {
    first_name: "Sabine",
    last_name: "Geidner",
    image_url: "http://lh5.googleusercontent.com/-nJFTj5Pc-Qs/AAAAAAAAAAI/AAAAAAAAC28/fbNeWMw_U1A/photo.jpg",
    email: "sg@careagents.de",
    password: "paypal"
  }
  
]




AGENTS.each do |agent|
  puts "Adding User '#{agent[:last_name]}, #{agent[:first_name]}"
  usr = User.create( agent.merge({ password_confirmation: agent[:password], user_type: "agent" }) )
  if agent[:image_url].present?
    usr.image_url = agent[:image_url]
  end
  usr.save
  puts "Adding User '#{usr.image_name} .. #{agent[:image_url]}"
end
