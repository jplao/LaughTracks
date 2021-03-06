RSpec.describe 'a visitor visits the comedian page' do
  it 'should show a list of all comedians' do
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

    visit '/comedians'

    expect(page).to have_content(aziz.name)
    expect(page).to have_content(special_2.name)

    within("#comedians#{louis.id}") do
      expect(page).to have_content(louis.name)
      expect(page).to have_content("Age: #{louis.age}")
      expect(page).to have_content("City: #{louis.city}")
      expect(page).to have_content("Total Specials: #{louis.specials.count}")
      expect(page).to have_content(special_1.name)
      expect(page).to have_content("Run time: #{special_1.run_time}")
      expect(page).to have_xpath("//img[contains(@src,special_1.thumbnail)]")

      expect(page).to_not have_content("Age: #{aziz.age}")
      expect(page).to_not have_content("City: #{aziz.city}")
      expect(page).to_not have_content("Total Specials: #{aziz.specials.count}")
      expect(page).to_not have_content(special_2.name)
      expect(page).to_not have_content("Run time: #{special_2.run_time}")
    end
  end

  describe 'a visitor looks at the statistics' do
    it 'shows the average age for all comedians' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")

      dave = Comedian.create(name: "Dave Chappelle", age: 45, city: "Washington D.C")
      dave.specials.create(name: "Dave Chapelle: Equanimity",
                          run_time: 60,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1__.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians'
      within('.header') do
        expect(page).to have_content("Average Age: 43.33")
      end
    end

    it 'shows the total for all specials' do
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
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")
      aziz.specials.create(name: "Aziz Ansari: Dangerously Delicious",
                          run_time: 61,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BYzYzNzlhYTEtYTdkNS00NDdiLWE1N2MtM2ZlOTQzMjU5OTg5XkEyXkFqcGdeQXVyMTIxMDUyOTI@._V1_.jpg")
      aziz.specials.create(name: "Aziz Ansari: Intimate Moments for a Sensual Evening",
                          run_time: 56,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BMTQyMzEyMTI5MV5BMl5BanBnXkFtZTgwMzM0NDA2MDE@._V1_.jpg")

      visit '/comedians'
      within('.header') do
        expect(page).to have_content("Total TV Specials: 6")
      end
    end

    it 'shows the average run time for all specials' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")

      dave = Comedian.create(name: "Dave Chappelle", age: 45, city: "Washington D.C")
      dave.specials.create(name: "Dave Chapelle: Equanimity",
                          run_time: 60,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1__.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians'
      within('.header') do
        expect(page).to have_content("Average TV Special Run Time: 71.33")
      end
    end

    it 'shows a unique list of cities for each comedian on the page' do
      louis = Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")
      louis.specials.create(name: "Louis C.K. 2017",
                            run_time: 74,
                            thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_.jpg")

      dave = Comedian.create(name: "Dave Chappelle", age: 45, city: "Washington D.C")
      dave.specials.create(name: "Dave Chapelle: Equanimity",
                          run_time: 60,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1__.jpg")

      aziz = Comedian.create(name: "Aziz Ansari", age: 34, city: "Columbia, SC")
      aziz.specials.create(name: "Aziz Ansari: Buried Alive",
                          run_time: 80,
                          thumbnail: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_.jpg")

      visit '/comedians'

      within('.header') do
        expect(page).to have_content("Cities: Washington D.C Columbia, SC")
      end
    end
  end
end
