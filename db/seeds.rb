puts "Cleaning database..."

User.destroy_all

puts "users cleaned. Creating new..."

User.create(first_name: "Admin", last_name: "Minister", city: "Berlin", plz: nil,
            languages: nil, specialties: nil,
            buddy: false, email: "a@a.at", password: "12345678")

User.create(first_name: "Lucas", last_name: "Petti", city: "Berlin", plz: 12159,
            languages: ["German", "English"], specialties: "Anmeldung",
            buddy: true, email: "luc_petti@hotmail.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543579776/575480_dbbb7c9bc7be4a73b2d18f14c3a29bd1_mv2.jpg'))

User.create(first_name: "Cedric", last_name: "D", city: "Berlin", plz: 10785,
            languages: ["French", "Catalan"], specialties: "Bank Account",
            buddy: true, email: "ced@mail.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582061/Screen_Shot_2018-11-30_at_13.46.32.png'))

User.create(first_name: "Ole", last_name: "OD", city: "Berlin", plz: 12159,
            languages: ["English", "German"], specialties: "Anmeldung",
            buddy: true, email: "od@od.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582190/ZEN-Portraits-146-1-min.jpg'))

User.create(first_name: "Karl", last_name: "Kalla", city: "Berlin", plz: 10785,
            languages: ["English", "German"], specialties: "Anmeldung",
            buddy: true, email: "kalla@od.com", password: "relocate",
            photo: open('https://res.cloudinary.com/da516w7pk/image/upload/v1543582042/Screen_Shot_2018-11-30_at_13.46.10.png'))

puts "Buddies and admin user created. Admin mail: a@a.at, password: 12345678"
