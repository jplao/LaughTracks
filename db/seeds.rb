require './app/models/comedian'
require './app/models/special'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
louis.specials.create(name: "Louis C.K. 2017",
                      run_time: 74,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")
louis.specials.create(name: "Louis C.K.: Live at the Comedy Store",
                      run_time: 66,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BODJlMmIyNjEtZDQ0ZS00MGIyLWEyZmYtOTQyYTQyMWJkODhmXkEyXkFqcGdeQXVyMjQ0ODQ0MzQ@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
louis.specials.create(name: "Louis C.K. Oh My God",
                      run_time: 58,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMjQ4NjQwOTYzNl5BMl5BanBnXkFtZTcwNjU2NjczOQ@@._V1_.jpg")

dave = Comedian.create(name: "Dave Chappelle", age: 45, city: "Washington D.C")
dave.specials.create(name: "Dave Chapelle: Equanimity",
                    run_time: 60,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1__.jpg")
dave.specials.create(name: "Dave Chapelle: The Bird Revelation",
                    run_time: 49,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BNGYzOTE0YzEtMjc5NC00MTg2LTk2MDAtMzJlMjM1NTU1MjcwXkEyXkFqcGdeQXVyMTk2ODU0OTM@._V1__.jpg")
dave.specials.create(name: "Dave Chapelle: For What It's Worth",
                    run_time: 60,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                    run_time: 80,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")
aziz.specials.create(name: "Aziz Ansari: Dangerously Delicious",
                    run_time: 61,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BYzYzNzlhYTEtYTdkNS00NDdiLWE1N2MtM2ZlOTQzMjU5OTg5XkEyXkFqcGdeQXVyMTIxMDUyOTI@._V1_.jpg")
aziz.specials.create(name: "Aziz Ansari: Intimate Moments for a Sensual Evening",
                    run_time: 56,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BMTQyMzEyMTI5MV5BMl5BanBnXkFtZTgwMzM0NDA2MDE@._V1_.jpg")

david = Comedian.create(name: "David Cross", age: 54, city: "Atlanta, GA")
david.specials.create(name: "David Cross: Making America Great Again",
                      run_time: 74,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BZDc2YTVhYTEtZGM4Yi00N2U5LThmZTktMjQwNGY4OWM5NDQ3XkEyXkFqcGdeQXVyMjUzNTU5NjY@._V1_.jpg")
david.specials.create(name: "David Cross: Bigger & Blackerer",
                      run_time: 90,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMjA0NjM3ODgxN15BMl5BanBnXkFtZTgwNzE3NDA2MDE@._V1_.jpg")
david.specials.create(name: "David Cross: Let America Laugh",
                      run_time: 93,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMTY3Njc0Mzk3OV5BMl5BanBnXkFtZTcwNDU5MzQyMQ@@._V1_.jpg")

patton = Comedian.create(name: "Patton Oswalt", age: 49, city: "Portsmouth, VA")
patton.specials.create(name: "Patton Oswalt: Annihilation",
                      run_time: 66,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BZGE4NDVjZGQtNzc0Yi00YTE2LWFiN2EtYTNiY2ZiNjliYWQ1XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
patton.specials.create(name: "Patton Oswalt: Talking for Clapping",
                      run_time: 65,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BZmMyYzAzMzktOWM4MS00YmI2LThmM2MtNjBkODZkOWQxODNmXkEyXkFqcGdeQXVyNjYzMDA4MTI@._V1_.jpg")
patton.specials.create(name: "Patton Oswalt: Tragedy Plus Comedy Equals Time",
                      run_time: 59,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BODU2MDEyNGYtODE3ZC00YjUyLTk3ODctYTU2MzM5Y2M3NWM4XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

sarah = Comedian.create(name: "Sarah Silverman", age: 48, city: "Bedford, NH")
sarah.specials.create(name: "Sarah Silverman: A Speck of Dust",
                      run_time: 71,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMjYwYjhjM2EtYjgwYS00YjkyLTllMjQtZGM1ZmFkMTQ1YmFmXkEyXkFqcGdeQXVyMzUwMjc0NTU@._V1_.jpg")
sarah.specials.create(name: "Sarah Silverman: We Are Miracles",
                      run_time: 53,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BODU5MWI2YWEtNTQ3Ny00OWQ3LThkNTUtYzdiNDVjNDczM2NiXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

bill = Comedian.create(name: "Bill Burr", age: 50, city: "Canton, MA")
bill.specials.create(name: "Bill Burr: Walk Your Way Out",
                    run_time: 77,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BMGYwNDE4MDItNjQwYi00NWIwLWJmYTYtY2I5NDEyMGUxNWMwL2ltYWdlXkEyXkFqcGdeQXVyMjUwMTM3MTU@._V1_.jpg")
bill.specials.create(name: "Bill Burr: I'm Sorry You Feel That Way",
                    run_time: 80,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_.jpg")
bill.specials.create(name: "Bill Burr: Let It Go",
                    run_time: 65,
                    thumbnail: "https://m.media-amazon.com/images/M/MV5BMjA0ODUxODkwOV5BMl5BanBnXkFtZTgwNTMwNTA2MDE@._V1_.jpg")

chris = Comedian.create(name: "Chris Rock", age: 53, city: "Andrews, SC")
chris.specials.create(name: "Chris Rock: Tamborine",
                      run_time: 64,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMGQ5NWJmMDktMDMxNS00ZWQzLWEzNjgtZWU5NjE0ZmZjYjc0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
chris.specials.create(name: "Chris Rock: Kill the Messenger - London, New York, Johannesburg",
                      run_time: 79,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_.jpg")
chris.specials.create(name: "Chris Rock: Never Scared",
                      run_time: 80,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMTlhYzMzNzItNWMyYy00ZGRlLWI1N2UtOGI2YjIwOGEwYTViXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

sandra = Comedian.create(name: "Sandra Bernhard", age: 63, city: "Flint, MI")
sandra.specials.create(name: "Sandra Bernhard: I'm Still Here... Damn It!",
                      run_time: 90,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMTcyNjQ0MDE2MF5BMl5BanBnXkFtZTcwMjcxMDgyMQ@@._V1_.jpg")
sandra.specials.create(name: "Women of the Night III",
                      run_time: 60,
                      thumbnail: "https://images-na.ssl-images-amazon.com/images/I/51GRXFBGYWL.jpg")

maria = Comedian.create(name: "Maria Bamford", age: 48, city: "Port Hueneme, California")
maria.specials.create(name: "Maria Bamford: Old Baby",
                      run_time: 64,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BNDZjYzVjNTAtOThkYS00ODhjLWI0ODYtNDIxODVhY2MxZjJmXkEyXkFqcGdeQXVyMzcwMjcwNQ@@._V1__.jpg")
maria.specials.create(name: "Maria Bamford: The Special Special Special!",
                      run_time: 49,
                      thumbnail: "https://m.media-amazon.com/images/M/MV5BMjM0MjEyMjM0OF5BMl5BanBnXkFtZTcwMDQ3NzQxOQ@@._V1_.jpg")

kevin_h = Comedian.create(name: "Kevin Hart", age: 39, city: "Philadelphia, PA")
kevin_h.specials.create(name: "Plastic Cup Boyz",
                        run_time: 82,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BMTgxMzY0ODE4OV5BMl5BanBnXkFtZTgwNjYyNDAyODE@._V1_.jpg")
kevin_h.specials.create(name: "Kevin Hart: I'm a Grown Little Man",
                        run_time: 73,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BMjI4MTYwNTUzMF5BMl5BanBnXkFtZTcwODk1Mjk3Mw@@._V1_.jpg")
kevin_h.specials.create(name: "Kevin Hart: Seriously Funny",
                        run_time: 72,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BMTcxNTI2OTA4Ml5BMl5BanBnXkFtZTcwMDA1MjE5NA@@._V1_.jpg")

kevin_s = Comedian.create(name: "Kevin Smith", age: 48, city: "Red Bank, NJ")
kevin_s.specials.create(name: "Kevin Smith: Silent But Deadly",
                        run_time: 57,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BNDIwZjJiOWItMDZiYy00ZjZlLThhNTEtZWU3MTBmYTMzMzU5XkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_.jpg")
kevin_s.specials.create(name: "Kevin Smith: Burn in Hell",
                        run_time: 89,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BMjI1NTk0NTA0M15BMl5BanBnXkFtZTgwNjUyNjA2MDE@._V1_.jpg")
kevin_s.specials.create(name: "Kevin Smith: Too Fat for 40!",
                        run_time: 120,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BMTQ2NjE2ODU0MV5BMl5BanBnXkFtZTgwMDk5NDA2MDE@._V1_.jpg")
