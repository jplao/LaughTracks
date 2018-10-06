RSpec.describe 'a visitor visits the queried comedian page' do
  it 'should show a list of all comedians that match query' do
    louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
    special_1 = louis.specials.create(name: "Louis C.K. 2017",
                          run_time: 74,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")
    louis.specials.create(name: "Louis C.K.: Live at the Comedy Store",
                          run_time: 66,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BODJlMmIyNjEtZDQ0ZS00MGIyLWEyZmYtOTQyYTQyMWJkODhmXkEyXkFqcGdeQXVyMjQ0ODQ0MzQ@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
    louis.specials.create(name: "Louis C.K. Oh My God",
                          run_time: 58,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BMjQ4NjQwOTYzNl5BMl5BanBnXkFtZTcwNjU2NjczOQ@@._V1_.jpg")

    aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
    special_2 = aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                        run_time: 80,
                        thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

    visit '/comedians?age=51'

    expect(page).to_not have_content("Age: #{aziz.age}")
    expect(page).to_not have_content("City: #{aziz.city}")
    expect(page).to_not have_content("Total Specials: #{aziz.specials.count}")
    expect(page).to_not have_content(special_2.name)
    expect(page).to_not have_content("Run time: #{special_2.run_time}")

    expect(page).to have_content(louis.name)
    expect(page).to have_content("Age: #{louis.age}")
    expect(page).to have_content("City: #{louis.city}")
    expect(page).to have_content("Total Specials: #{louis.specials.count}")
    expect(page).to have_content(special_1.name)
    expect(page).to have_content("Run time: #{special_1.run_time}")
    expect(page).to have_xpath("//img[contains(@src,special_1.thumbnail)]")
  end


  describe 'a visitor looks at the statistics' do
    it 'shows the average age for all comedians that match query' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians?age=51'
      within('.header') do
        expect(page).to have_content(51)
      end
    end

    it 'shows the total for all specials of comedians that match query' do
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

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Dangerously Delicious",
                          run_time: 61,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BYzYzNzlhYTEtYTdkNS00NDdiLWE1N2MtM2ZlOTQzMjU5OTg5XkEyXkFqcGdeQXVyMTIxMDUyOTI@._V1_.jpg")
      aziz.specials.create(name: "Aziz Ansari: Intimate Moments for a Sensual Evening",
                          run_time: 56,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BMTQyMzEyMTI5MV5BMl5BanBnXkFtZTgwMzM0NDA2MDE@._V1_.jpg")

      visit '/comedians?age=51'
      within('.header') do
        expect(page).to have_content("Total TV Specials: 3")
      end
    end

    it 'shows the average run time for all specials of comedians that match query' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")
      louis.specials.create(name: "Louis C.K.: Live at the Comedy Store",
                            run_time: 66,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BODJlMmIyNjEtZDQ0ZS00MGIyLWEyZmYtOTQyYTQyMWJkODhmXkEyXkFqcGdeQXVyMjQ0ODQ0MzQ@._V1_SY1000_CR0,0,666,1000_AL_.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians?age=51'
      within('.header') do
        expect(page).to have_content("Average TV Special Run Time: 70")
      end
    end

    it 'shows a unique list of cities for comedians that match query' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians?age=51'

      within('.header') do
        expect(page).to have_content("Cities: Washington D.C")
        expect(page).to_not have_content("Columbia, SC")
      end
    end
  end
end
