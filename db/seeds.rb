# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

State.create([
  {name: 'NY'}, #1
  {name: 'CA'}, #2
  {name: 'MA'}, #3
  {name: 'NH'}  #4
  ])

City.create([
  {name: 'Indonesia', state_id: 1},
  {name: 'Singapore', state_id: 2},
  {name: 'Vietnam', state_id: 3},
  {name: 'The Phillipines', state_id: 4}
  ])

Country.create([
  {name: 'Indonesia', state_id: 1},
  {name: 'Singapore', state_id: 2},
  {name: 'Vietnam', state_id: 3},
  {name: 'Phillipines', state_id: 4}
  ])


Category.create([
  {name: 'Electronics'},
  {name: 'Fashion'},
  {name: 'Other'}
  ])

Merchant.create([
  {name: "Curry-Ya",
    website: "http://nycurry-ya.com",
    phone: "(212) 995-2877",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Totto Ramen",
    website: "http://tottoramen.com",
    phone: "(212) 582-0052",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Minca",
    website: "http://newyorkramen.com",
    phone: "(212) 505-8001",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Sakagura",
    website: "",
    phone: "",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Village Yokocho",
    website: "",
    phone: "",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Cocoron",
    website: "",
    phone: "",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Kyo Ya",
    website: "",
    phone: "",
    country_id: 1,
    category_ids: [3]
  },
  {name: "Ootoya",
    website: "",
    phone: "",
    country_id: 1,
    category_ids: [3]
  }
])

User.create({username: 'ant', password: '123123', email: 'liangtfm@gmail.com', biography: "Hello!", age: 26, gender: "M", location: "NYC", admin: true}, 
  {username: 'guest', password: '123123', email: 'guest@example.com', biography: "Hello, I'm a guest!"})


100.times do
  Merchant.create({
    name: Faker::Company.name,
    website: "http://"+Faker::Internet.domain_name,
    phone: Faker::PhoneNumber.phone_number,
    country_id: rand(1..4),
    category_ids: rand(1..2)
  })
end

100.times do
  User.create({
    username: Faker::Internet.user_name + rand(1..1000).to_s,
    password: '123123',
    email: Faker::Internet.user_name + rand(1..1000).to_s + Faker::Internet.email,
    biography: Faker::Lorem.paragraph,
    age: rand(18..50),
    gender: ["M","F"].sample,
    location: ["Indonesia", "Singapore", "Vietnam", "Phillipines"].sample
  })
end


100.times do
  Review.create({
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs.join(" "),
    rating: rand(1..5),
    user_id: rand(2..51),
    merchant_id: rand(1..111)
  })
end