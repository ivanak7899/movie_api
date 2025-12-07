puts "Clearing existing data..."

Review.delete_all
Casting.delete_all
Movie.delete_all
Person.delete_all
User.delete_all

puts "Creating users..."

admin = User.create!(
  username: "admin",
  email:    "admin@example.com",
  password: "admin_pass",
  password_confirmation: "admin_pass",
  role:     "admin"
)

moderator = User.create!(
  username: "moderator",
  email:    "moderator@example.com",
  password: "mod_pass",
  password_confirmation: "mod_pass",
  role:     "moderator"
)

user1 = User.create!(
  username: "john",
  email:    "john@example.com",
  password: "john_pass",
  password_confirmation: "john_pass",
  role:     "user"
)

user2 = User.create!(
  username: "jane",
  email:    "jane@example.com",
  password: "jane_pass",
  password_confirmation: "jane_pass",
  role:     "user"
)

puts "Users created: #{User.count}"

puts "Creating people (directors & actors)..."

# Directors
kubrick        = Person.create!(name: "Stanley Kubrick")
scorsese       = Person.create!(name: "Martin Scorsese")
wes_anderson   = Person.create!(name: "Wes Anderson")
greta_gerwig   = Person.create!(name: "Greta Gerwig")
tarantino      = Person.create!(name: "Quentin Tarantino")
david_lynch    = Person.create!(name: "David Lynch")
almodovar      = Person.create!(name: "Pedro Almodóvar")
sofia_coppola  = Person.create!(name: "Sofia Coppola")

# Actors

# Kubrick movies
keir_dullea      = Person.create!(name: "Keir Dullea")
gary_lockwood    = Person.create!(name: "Gary Lockwood")
douglas_rain     = Person.create!(name: "Douglas Rain")

jack_nicholson   = Person.create!(name: "Jack Nicholson")
shelley_duvall   = Person.create!(name: "Shelley Duvall")
danny_lloyd      = Person.create!(name: "Danny Lloyd")

malcolm_mcdowell = Person.create!(name: "Malcolm McDowell")
patrick_magee    = Person.create!(name: "Patrick Magee")
adrienne_corri   = Person.create!(name: "Adrienne Corri")

# Scorsese movies
robert_de_niro   = Person.create!(name: "Robert De Niro")
jodie_foster     = Person.create!(name: "Jodie Foster")
harvey_keitel    = Person.create!(name: "Harvey Keitel")

ray_liotta       = Person.create!(name: "Ray Liotta")
joe_pesci        = Person.create!(name: "Joe Pesci")

leonardo_dicaprio = Person.create!(name: "Leonardo DiCaprio")
jonah_hill        = Person.create!(name: "Jonah Hill")
margot_robbie     = Person.create!(name: "Margot Robbie")

# Wes Anderson movies
ralph_fiennes    = Person.create!(name: "Ralph Fiennes")
tony_revolori    = Person.create!(name: "Tony Revolori")
saoirse_ronan    = Person.create!(name: "Saoirse Ronan")

gene_hackman     = Person.create!(name: "Gene Hackman")
anjelica_huston  = Person.create!(name: "Anjelica Huston")
gwyneth_paltrow  = Person.create!(name: "Gwyneth Paltrow")

jared_gilman     = Person.create!(name: "Jared Gilman")
kara_hayward     = Person.create!(name: "Kara Hayward")
bruce_willis     = Person.create!(name: "Bruce Willis")

# Greta Gerwig movies
laurie_metcalf    = Person.create!(name: "Laurie Metcalf")
timothee_chalamet = Person.create!(name: "Timothée Chalamet")

emma_watson       = Person.create!(name: "Emma Watson")
florence_pugh     = Person.create!(name: "Florence Pugh")

ryan_gosling      = Person.create!(name: "Ryan Gosling")
america_ferrera   = Person.create!(name: "America Ferrera")

# Tarantino movies
john_travolta     = Person.create!(name: "John Travolta")
samuel_l_jackson  = Person.create!(name: "Samuel L. Jackson")
uma_thurman       = Person.create!(name: "Uma Thurman")

lucy_liu          = Person.create!(name: "Lucy Liu")
david_carradine   = Person.create!(name: "David Carradine")

brad_pitt         = Person.create!(name: "Brad Pitt")
christoph_waltz   = Person.create!(name: "Christoph Waltz")
melanie_laurent   = Person.create!(name: "Mélanie Laurent")

# David Lynch movies
naomi_watts         = Person.create!(name: "Naomi Watts")
laura_harring       = Person.create!(name: "Laura Harring")
justin_theroux      = Person.create!(name: "Justin Theroux")

kyle_maclachlan     = Person.create!(name: "Kyle MacLachlan")
isabella_rossellini = Person.create!(name: "Isabella Rossellini")
dennis_hopper       = Person.create!(name: "Dennis Hopper")

sheryl_lee          = Person.create!(name: "Sheryl Lee")
ray_wise            = Person.create!(name: "Ray Wise")

# Almodóvar movies
antonio_banderas   = Person.create!(name: "Antonio Banderas")
elena_anaya        = Person.create!(name: "Elena Anaya")
marisa_paredes     = Person.create!(name: "Marisa Paredes")

javier_camara      = Person.create!(name: "Javier Cámara")
dario_grandinetti  = Person.create!(name: "Darío Grandinetti")
rosario_flores     = Person.create!(name: "Rosario Flores")

penelope_cruz      = Person.create!(name: "Penélope Cruz")
asier_etxeandia    = Person.create!(name: "Asier Etxeandia")

# Sofia Coppola movies
bill_murray        = Person.create!(name: "Bill Murray")
scarlett_johansson = Person.create!(name: "Scarlett Johansson")
giovanni_ribisi    = Person.create!(name: "Giovanni Ribisi")

kirsten_dunst      = Person.create!(name: "Kirsten Dunst")
josh_hartnett      = Person.create!(name: "Josh Hartnett")
james_woods        = Person.create!(name: "James Woods")

cailee_spaeny      = Person.create!(name: "Cailee Spaeny")
jacob_elordi       = Person.create!(name: "Jacob Elordi")
ari_cohen          = Person.create!(name: "Ari Cohen")

puts "People created: #{Person.count}"

puts "Creating movies..."

# Stanley Kubrick
movie_2001 = Movie.create!(
  title:        "2001: A Space Odyssey",
  description:  "A groundbreaking sci-fi film about evolution, technology, and a mysterious monolith.",
  release_year: 1968,
  director:     kubrick
)

movie_shining = Movie.create!(
  title:        "The Shining",
  description:  "A psychological horror film about a family isolated in a remote mountain hotel.",
  release_year: 1980,
  director:     kubrick
)

movie_clockwork = Movie.create!(
  title:        "A Clockwork Orange",
  description:  "A dystopian story about ultraviolence, free will, and social control.",
  release_year: 1971,
  director:     kubrick
)

# Martin Scorsese
movie_taxi_driver = Movie.create!(
  title:        "Taxi Driver",
  description:  "A mentally unstable taxi driver slowly descends into violence in New York City.",
  release_year: 1976,
  director:     scorsese
)

movie_goodfellas = Movie.create!(
  title:        "Goodfellas",
  description:  "The rise and fall of a mob associate over several decades.",
  release_year: 1990,
  director:     scorsese
)

movie_wolf_wall_street = Movie.create!(
  title:        "The Wolf of Wall Street",
  description:  "The outrageous rise and fall of stockbroker Jordan Belfort.",
  release_year: 2013,
  director:     scorsese
)

# Wes Anderson
movie_grand_budapest = Movie.create!(
  title:        "The Grand Budapest Hotel",
  description:  "The adventures of a legendary concierge and his devoted lobby boy.",
  release_year: 2014,
  director:     wes_anderson
)

movie_royal_tenenbaums = Movie.create!(
  title:        "The Royal Tenenbaums",
  description:  "An eccentric family of former child prodigies reunites in their adult failures.",
  release_year: 2001,
  director:     wes_anderson
)

movie_moonrise_kingdom = Movie.create!(
  title:        "Moonrise Kingdom",
  description:  "Two young lovers run away together, throwing their small island into chaos.",
  release_year: 2012,
  director:     wes_anderson
)

# Greta Gerwig
movie_lady_bird = Movie.create!(
  title:        "Lady Bird",
  description:  "A stubborn teenage girl navigates love, school, and her complicated relationship with her mother.",
  release_year: 2017,
  director:     greta_gerwig
)

movie_little_women = Movie.create!(
  title:        "Little Women",
  description:  "A fresh adaptation of the classic story about the March sisters and their dreams.",
  release_year: 2019,
  director:     greta_gerwig
)

movie_barbie = Movie.create!(
  title:        "Barbie",
  description:  "A meta-comedy about Barbieland, identity, and expectations placed on women and men.",
  release_year: 2023,
  director:     greta_gerwig
)

# Quentin Tarantino
movie_pulp_fiction = Movie.create!(
  title:        "Pulp Fiction",
  description:  "Intertwined stories of hitmen, a boxer, and a mysterious briefcase in Los Angeles.",
  release_year: 1994,
  director:     tarantino
)

movie_kill_bill = Movie.create!(
  title:        "Kill Bill: Vol. 1",
  description:  "A former assassin seeks bloody revenge on her former boss and colleagues.",
  release_year: 2003,
  director:     tarantino
)

movie_inglourious = Movie.create!(
  title:        "Inglourious Basterds",
  description:  "An alternate WWII tale about a group of Nazi-hunting soldiers and a vengeful cinema owner.",
  release_year: 2009,
  director:     tarantino
)

# David Lynch
movie_mulholland = Movie.create!(
  title:        "Mulholland Drive",
  description:  "A dreamlike mystery about identity, Hollywood illusions, and fractured realities.",
  release_year: 2001,
  director:     david_lynch
)

movie_blue_velvet = Movie.create!(
  title:        "Blue Velvet",
  description:  "A dark journey into the violent underbelly of a seemingly peaceful small town.",
  release_year: 1986,
  director:     david_lynch
)

movie_twin_peaks_fwwm = Movie.create!(
  title:        "Twin Peaks: Fire Walk with Me",
  description:  "A prequel exploring the final days of Laura Palmer before her tragic death.",
  release_year: 1992,
  director:     david_lynch
)

# Pedro Almodóvar
movie_skin_i_live_in = Movie.create!(
  title:        "The Skin I Live In",
  description:  "A brilliant but disturbed surgeon develops a new kind of synthetic skin.",
  release_year: 2011,
  director:     almodovar
)

movie_talk_to_her = Movie.create!(
  title:        "Talk to Her",
  description:  "Two men form an unusual bond while caring for women who are in comas.",
  release_year: 2002,
  director:     almodovar
)

movie_pain_and_glory = Movie.create!(
  title:        "Pain and Glory",
  description:  "An aging filmmaker reflects on his past, his art, and the people who shaped his life.",
  release_year: 2019,
  director:     almodovar
)

# Sofia Coppola
movie_lost_in_translation = Movie.create!(
  title:        "Lost in Translation",
  description:  "Two strangers in Tokyo develop a brief but deeply meaningful connection.",
  release_year: 2003,
  director:     sofia_coppola
)

movie_virgin_suicides = Movie.create!(
  title:        "The Virgin Suicides",
  description:  "A group of boys becomes obsessed with five mysterious sisters in suburban America.",
  release_year: 1999,
  director:     sofia_coppola
)

movie_priscilla = Movie.create!(
  title:        "Priscilla",
  description:  "The story of Priscilla Presley and her complex relationship with Elvis.",
  release_year: 2023,
  director:     sofia_coppola
)

puts "Movies created: #{Movie.count}"

puts "Creating castings..."

# Kubrick castings
Casting.create!(movie: movie_2001, person: keir_dullea,   role_name: "Dr. Dave Bowman")
Casting.create!(movie: movie_2001, person: gary_lockwood, role_name: "Dr. Frank Poole")
Casting.create!(movie: movie_2001, person: douglas_rain,  role_name: "HAL 9000 (voice)")

Casting.create!(movie: movie_shining, person: jack_nicholson, role_name: "Jack Torrance")
Casting.create!(movie: movie_shining, person: shelley_duvall, role_name: "Wendy Torrance")
Casting.create!(movie: movie_shining, person: danny_lloyd,    role_name: "Danny Torrance")

Casting.create!(movie: movie_clockwork, person: malcolm_mcdowell, role_name: "Alex DeLarge")
Casting.create!(movie: movie_clockwork, person: patrick_magee,    role_name: "Mr. Alexander")
Casting.create!(movie: movie_clockwork, person: adrienne_corri,   role_name: "Mrs. Alexander")

# Scorsese castings
Casting.create!(movie: movie_taxi_driver, person: robert_de_niro, role_name: "Travis Bickle")
Casting.create!(movie: movie_taxi_driver, person: jodie_foster,   role_name: "Iris")
Casting.create!(movie: movie_taxi_driver, person: harvey_keitel,  role_name: "Sport")

Casting.create!(movie: movie_goodfellas, person: ray_liotta,      role_name: "Henry Hill")
Casting.create!(movie: movie_goodfellas, person: robert_de_niro,  role_name: "Jimmy Conway")
Casting.create!(movie: movie_goodfellas, person: joe_pesci,       role_name: "Tommy DeVito")

Casting.create!(movie: movie_wolf_wall_street, person: leonardo_dicaprio, role_name: "Jordan Belfort")
Casting.create!(movie: movie_wolf_wall_street, person: jonah_hill,        role_name: "Donnie Azoff")
Casting.create!(movie: movie_wolf_wall_street, person: margot_robbie,     role_name: "Naomi Lapaglia")

# Wes Anderson castings
Casting.create!(movie: movie_grand_budapest, person: ralph_fiennes, role_name: "M. Gustave")
Casting.create!(movie: movie_grand_budapest, person: tony_revolori, role_name: "Zero")
Casting.create!(movie: movie_grand_budapest, person: saoirse_ronan, role_name: "Agatha")

Casting.create!(movie: movie_royal_tenenbaums, person: gene_hackman,    role_name: "Royal Tenenbaum")
Casting.create!(movie: movie_royal_tenenbaums, person: anjelica_huston, role_name: "Etheline Tenenbaum")
Casting.create!(movie: movie_royal_tenenbaums, person: gwyneth_paltrow, role_name: "Margot Tenenbaum")

Casting.create!(movie: movie_moonrise_kingdom, person: jared_gilman, role_name: "Sam Shakusky")
Casting.create!(movie: movie_moonrise_kingdom, person: kara_hayward, role_name: "Suzy Bishop")
Casting.create!(movie: movie_moonrise_kingdom, person: bruce_willis, role_name: "Captain Sharp")

# Greta Gerwig castings
Casting.create!(movie: movie_lady_bird, person: saoirse_ronan,     role_name: "Christine 'Lady Bird' McPherson")
Casting.create!(movie: movie_lady_bird, person: laurie_metcalf,    role_name: "Marion McPherson")
Casting.create!(movie: movie_lady_bird, person: timothee_chalamet, role_name: "Kyle Scheible")

Casting.create!(movie: movie_little_women, person: saoirse_ronan,  role_name: "Jo March")
Casting.create!(movie: movie_little_women, person: emma_watson,    role_name: "Meg March")
Casting.create!(movie: movie_little_women, person: florence_pugh,  role_name: "Amy March")

Casting.create!(movie: movie_barbie, person: margot_robbie,   role_name: "Barbie")
Casting.create!(movie: movie_barbie, person: ryan_gosling,    role_name: "Ken")
Casting.create!(movie: movie_barbie, person: america_ferrera, role_name: "Gloria")

# Quentin Tarantino castings
Casting.create!(movie: movie_pulp_fiction, person: john_travolta,    role_name: "Vincent Vega")
Casting.create!(movie: movie_pulp_fiction, person: samuel_l_jackson, role_name: "Jules Winnfield")
Casting.create!(movie: movie_pulp_fiction, person: uma_thurman,      role_name: "Mia Wallace")

Casting.create!(movie: movie_kill_bill, person: uma_thurman,     role_name: "The Bride")
Casting.create!(movie: movie_kill_bill, person: lucy_liu,        role_name: "O-Ren Ishii")
Casting.create!(movie: movie_kill_bill, person: david_carradine, role_name: "Bill")

Casting.create!(movie: movie_inglourious, person: brad_pitt,       role_name: "Lt. Aldo Raine")
Casting.create!(movie: movie_inglourious, person: christoph_waltz, role_name: "Col. Hans Landa")
Casting.create!(movie: movie_inglourious, person: melanie_laurent, role_name: "Shosanna Dreyfus")

# David Lynch castings
Casting.create!(movie: movie_mulholland, person: naomi_watts,    role_name: "Betty Elms / Diane Selwyn")
Casting.create!(movie: movie_mulholland, person: laura_harring,  role_name: "Rita / Camilla Rhodes")
Casting.create!(movie: movie_mulholland, person: justin_theroux, role_name: "Adam Kesher")

Casting.create!(movie: movie_blue_velvet, person: kyle_maclachlan,     role_name: "Jeffrey Beaumont")
Casting.create!(movie: movie_blue_velvet, person: isabella_rossellini, role_name: "Dorothy Vallens")
Casting.create!(movie: movie_blue_velvet, person: dennis_hopper,       role_name: "Frank Booth")

Casting.create!(movie: movie_twin_peaks_fwwm, person: sheryl_lee,      role_name: "Laura Palmer")
Casting.create!(movie: movie_twin_peaks_fwwm, person: ray_wise,        role_name: "Leland Palmer")
Casting.create!(movie: movie_twin_peaks_fwwm, person: kyle_maclachlan, role_name: "Dale Cooper")

# Pedro Almodóvar castings
Casting.create!(movie: movie_skin_i_live_in, person: antonio_banderas, role_name: "Dr. Robert Ledgard")
Casting.create!(movie: movie_skin_i_live_in, person: elena_anaya,      role_name: "Vera Cruz")
Casting.create!(movie: movie_skin_i_live_in, person: marisa_paredes,   role_name: "Marilia")

Casting.create!(movie: movie_talk_to_her, person: javier_camara,     role_name: "Benigno Martín")
Casting.create!(movie: movie_talk_to_her, person: dario_grandinetti, role_name: "Marco Zuluaga")
Casting.create!(movie: movie_talk_to_her, person: rosario_flores,    role_name: "Lydia González")

Casting.create!(movie: movie_pain_and_glory, person: antonio_banderas, role_name: "Salvador Mallo")
Casting.create!(movie: movie_pain_and_glory, person: penelope_cruz,    role_name: "Jacinta")
Casting.create!(movie: movie_pain_and_glory, person: asier_etxeandia,  role_name: "Alberto Crespo")

# Sofia Coppola castings
Casting.create!(movie: movie_lost_in_translation, person: bill_murray,        role_name: "Bob Harris")
Casting.create!(movie: movie_lost_in_translation, person: scarlett_johansson, role_name: "Charlotte")
Casting.create!(movie: movie_lost_in_translation, person: giovanni_ribisi,    role_name: "John")

Casting.create!(movie: movie_virgin_suicides, person: kirsten_dunst, role_name: "Lux Lisbon")
Casting.create!(movie: movie_virgin_suicides, person: josh_hartnett, role_name: "Trip Fontaine")
Casting.create!(movie: movie_virgin_suicides, person: james_woods,   role_name: "Mr. Lisbon")

Casting.create!(movie: movie_priscilla, person: cailee_spaeny, role_name: "Priscilla Presley")
Casting.create!(movie: movie_priscilla, person: jacob_elordi,  role_name: "Elvis Presley")
Casting.create!(movie: movie_priscilla, person: ari_cohen,     role_name: "Priscilla's father")

puts "Castings created: #{Casting.count}"

puts "Creating reviews..."

# Kubrick reviews
Review.create!(
  movie:  movie_2001,
  user:   user1,
  rating: 10,
  comment: "One of the most important and hypnotic sci-fi films ever made."
)

Review.create!(
  movie:  movie_shining,
  user:   user2,
  rating: 9,
  comment: "Perfect atmosphere and a slow descent into madness."
)

Review.create!(
  movie:  movie_clockwork,
  user:   moderator,
  rating: 9,
  comment: "Brutal, stylish and still disturbingly relevant."
)

# Scorsese reviews
Review.create!(
  movie:  movie_taxi_driver,
  user:   user2,
  rating: 9,
  comment: "De Niro is terrifyingly good, and New York feels like a nightmare."
)

Review.create!(
  movie:  movie_goodfellas,
  user:   admin,
  rating: 10,
  comment: "The best mafia movie ever made – the pacing is flawless."
)

Review.create!(
  movie:  movie_wolf_wall_street,
  user:   user1,
  rating: 9,
  comment: "Wild, hilarious and exhausting in the best possible way."
)

# Wes Anderson reviews
Review.create!(
  movie:  movie_grand_budapest,
  user:   user1,
  rating: 10,
  comment: "A perfect mix of comedy, melancholy, and Anderson’s meticulous visuals."
)

Review.create!(
  movie:  movie_royal_tenenbaums,
  user:   user2,
  rating: 8,
  comment: "Strange, charming, and surprisingly emotional."
)

Review.create!(
  movie:  movie_moonrise_kingdom,
  user:   moderator,
  rating: 8,
  comment: "A sweet and whimsical story about first love."
)

# Greta Gerwig reviews
Review.create!(
  movie:  movie_lady_bird,
  user:   user1,
  rating: 9,
  comment: "Honest, funny and painfully accurate about mothers and daughters."
)

Review.create!(
  movie:  movie_little_women,
  user:   user2,
  rating: 9,
  comment: "Warm, energetic and full of heart – a great adaptation."
)

Review.create!(
  movie:  movie_barbie,
  user:   admin,
  rating: 8,
  comment: "Much smarter and bolder than the title suggests."
)

# Tarantino reviews
Review.create!(
  movie:  movie_pulp_fiction,
  user:   moderator,
  rating: 10,
  comment: "Dialogue, structure, soundtrack – pure cinema classic."
)

Review.create!(
  movie:  movie_kill_bill,
  user:   user2,
  rating: 9,
  comment: "Stylized violence and genre mashups done to perfection."
)

Review.create!(
  movie:  movie_inglourious,
  user:   user1,
  rating: 9,
  comment: "The opening and the cinema sequence are masterpieces on their own."
)

# David Lynch reviews
Review.create!(
  movie:  movie_mulholland,
  user:   user1,
  rating: 10,
  comment: "A mind-bending puzzle that rewards every rewatch."
)

Review.create!(
  movie:  movie_blue_velvet,
  user:   moderator,
  rating: 8,
  comment: "Dark, disturbing and strangely captivating."
)

Review.create!(
  movie:  movie_twin_peaks_fwwm,
  user:   user2,
  rating: 8,
  comment: "Haunting and heartbreaking if you know the series."
)

# Pedro Almodóvar reviews
Review.create!(
  movie:  movie_skin_i_live_in,
  user:   user2,
  rating: 9,
  comment: "Creepy, elegant and emotionally twisted in the best Almodóvar way."
)

Review.create!(
  movie:  movie_talk_to_her,
  user:   user1,
  rating: 9,
  comment: "Deeply empathetic, strange and unforgettable."
)

Review.create!(
  movie:  movie_pain_and_glory,
  user:   admin,
  rating: 9,
  comment: "A beautiful reflection on aging, memory and cinema itself."
)

# Sofia Coppola reviews
Review.create!(
  movie:  movie_lost_in_translation,
  user:   user2,
  rating: 9,
  comment: "Quiet, intimate and perfectly captures the feeling of being lost."
)

Review.create!(
  movie:  movie_virgin_suicides,
  user:   moderator,
  rating: 8,
  comment: "Hypnotic, melancholic and visually gorgeous."
)

Review.create!(
  movie:  movie_priscilla,
  user:   user1,
  rating: 8,
  comment: "A delicate and focused look at Priscilla’s side of the Elvis myth."
)

puts "Reviews created: #{Review.count}"

puts "Seeding done"
