RSpec.describe 'a visitor visits the comedian page' do
  it 'should show a list of all comedians' do
    comedian = Comedian.create(name: "Will Ferrell", age: 51, city: "Irvine, CA")
    visit '/comedians'

    within("#comedians") do
      expect(page).to have_content(comedian.name)
      expect(page).to have_content("Age: #{comedian.age}")
    end
  end

  describe 'a visitor looks at the statistics' do
    it 'shows the average age for all comedians' do

      Comedian.create(name: "Will Ferrell", age: 51, city: "Irvine, CA")
      Comedian.create(name: "Chris Kattan", age: 48, city: "Los Angeles, CA")
      Comedian.create(name: "Louis C.K", age: 51, city: "Washington D.C")

      expect(Comedian.average_age).to eq(50)
    end

    it 'shows the total for all specials' do

      Special.create(name: "Louis C.K. 2017", run_time: 74)
      Special.create(name: "Louis C.K.: Live at the Comedy Store", run_time: 66)
      Special.create(name: "Louis C.K. Oh My God", run_time: 58)

      expect(Comedian.total_specials).to eq(3)
    end

    it 'shows the average run time for all specials' do

      Special.create(name: "Louis C.K. 2017", run_time: 74)
      Special.create(name: "Louis C.K.: Live at the Comedy Store", run_time: 66)
      Special.create(name: "Louis C.K. Oh My God", run_time: 58)

      expect(Special.average_run_time).to eq(66)
    end
  end
end

RSpec.describe 'a visitor visits the new comedian page' do
  it 'should show a form' do
    visit 'comedians/new'

    fill_in "comedian[name]", with: "Will Ferrell"
    fill_in "comedian[age]", with: 51
    fill_in "comedian[city]", with: "Irvine, CA"

    click_button "Submit"

    expect(current_path).to eq("/comedians")
  end
end
