RSpec.describe 'a visitor visits the new comedian page' do
  it 'should show a form' do
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


    visit 'comedians/new'

    fill_in "comedian[name]", with: "Will Ferrell"
    fill_in "comedian[age]", with: 51
    fill_in "comedian[city]", with: "Irvine, CA"

    click_button "Create Comedian"

    expect(current_path).to eq("/comedians")
  end
end
