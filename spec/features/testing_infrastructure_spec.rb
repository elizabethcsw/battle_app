require_relative '../../app.rb'
require 'capybara-screenshot/rspec'
require 'launchy'


# describe 'testing' do
#   it 'checks that homepage says Testing infrastructure working' do
#     visit '/'
#     expect(page).to have_content 'Testing infrastructure working!'
#   end
# end

feature 'feature test' do

  scenario 'checks that homepage says Testing infrastructure working' do
    visit '/'
    test1
  end

  scenario 'expects 2 players to fill in their names' do
    visit '/'
    fill_in('name1', with: 'Nick')
    fill_in('name2', with: 'Eli')
    find_button('Submit').click
    test2
    save_and_open_page
  end

  def test1
    expect(page).to have_content 'Testing infrastructure working!'
  end

  def test2
    expect(page).to have_content "Player 1 is Nick\nPlayer 2 is Eli"
  end

end





# #  In spec/features, add a new Capybara feature test
# that expects players to fill in their names (in a form),
# submit that form, and see those names on-screen
