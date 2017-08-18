require_relative '../../app.rb'
require_relative 'web_helpers.rb'
require 'capybara-screenshot/rspec'
require 'launchy'

# describe 'testing' do
#   it 'checks that homepage says Testing infrastructure working' do
#     visit '/'
#     expect(page).to have_content 'Testing infrastructure working!'
#   end
# end

feature 'Attack' do
  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    click_link 'Attack Nick!'
    test1
  end

  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    # find_button('Attack Player 1').click
    click_button 'Attack!'
    test2
    # save_and_open_pages
  end

  def test1
    expect(page).to have_content "Nick: 90HP\nAttack Nick!\nEli: 100HP\nAttack Eli!"
  end

  def test2
    expect(page).to have_content "Nick: 100HP\nAttack Nick!\nEli: 90HP\nAttack Eli!"
  end
end
