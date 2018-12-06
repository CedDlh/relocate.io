puts "Cleaning database..."

# User.destroy_all

puts "users cleaned. Creating new..."

# User.create(first_name: "Admin", last_name: "Minister", city: "Berlin", plz: nil,
            # languages: nil, specialties: nil,
            # buddy: false, email: "a@a.at", password: "12345678")


User.create(first_name: "Lucas", last_name: "Petti", city: "Berlin", plz: 10969,
            languages: "Spanish, English", specialties: "Anmeldung, Bank Account", description: "My name is Lucas. I am based in Berlin and renovate and rentout out flats.
            I'm made and raised in Brazil and moved to Berlin 10 years ago. So I know how difficult it is to settle in aBerlin.  I decided to help fellow immigrants on my spare time.
            I can help you dealing with most of your administratives tasks and we can also have chat about music thats my big passion.",
            buddy: true, email: "l@hotmail.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543579776/575480_dbbb7c9bc7be4a73b2d18f14c3a29bd1_mv2.jpg'))

User.create(first_name: "Cedric", last_name: "Delahaye", city: "Berlin", plz:  10969,
            languages: "French, Catalan", specialties: "Bank Account",
            buddy: true, email: "c@mail.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582061/Screen_Shot_2018-11-30_at_13.46.32.png'))

User.create(first_name: "Ole", last_name: "Legend", city: "Berlin", plz:  10969,
            languages: "English, Polish", specialties: "Anmeldung",
            buddy: true, email: "o@od.com", password: "relocate", description: "My name is Ole. I am currently living in Berlin and work for Deutsch Bank as an analyst.
            Coming from a polish family, I know how difficult in can be to settle in a new place so I decided to help fellow immigrants on my spare time.
            I can help you dealing with most of your administratives tasks and we can also talk about football while waiting for your appointment.",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582190/ZEN-Portraits-146-1-min.jpg'))

User.create(first_name: "Karl", last_name: "Kalla", city: "Berlin", plz: 10405,
            languages: "English, German", specialties: "Tax advice", discription: "My name is Karl . I am based in Berlin and  working as a tour guide. I’m from Berlin and love the variety of cultures in the city . I know how difficult it is to settle in Berlin so I decided to help fellow immigrants on my spare time.
            I can help you dealing with most of your administratives tasks and we can also have chat about sightseeing."
            buddy: true, email: "k@od.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582042/Screen_Shot_2018-11-30_at_13.46.10.png'))


puts "Buddies and admin user created. Admin mail: a@a.at, password: 12345678"
