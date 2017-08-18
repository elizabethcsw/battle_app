require_relative '../../app.rb'
require_relative 'web_helpers.rb'
require 'capybara-screenshot/rspec'
require 'launchy'

feature 'feature test' do
  scenario "check that homepage says Let's battle" do
    visit '/'
    test1
  end

  scenario 'expect 2 players to fill in their names' do
    sign_in_and_play
    test2
  end

  scenario 'view hit points of both players' do
    sign_in_and_play
    test3
  end

  scenario 'attack player 2' do
    sign_in_and_play
    find_button('Attack').click
    test4
  end

  scenario 'attack player 1' do
    sign_in_and_play
    find_link('Attack Nick!').click
    test5
    # save_and_open_page
  end

  def test1
    expect(page).to have_content "Let's battle!"
  end

  def test2
    expect(page).to have_content 'Nick:'
  end

  def test3
    expect(page).to have_content "Nick: 100HP\nAttack Nick!\nEli: 100HP\nAttack Eli!"
  end

  def test4
    expect(page).to have_content "Nick: 100HP\nAttack Nick!\nEli: 90HP\nAttack Eli!"
  end

  def test5
    expect(page).to have_content "Nick: 90HP\nAttack Nick!\nEli: 100HP\nAttack Eli!"
  end
end


# describe 'testing' do
#   it 'checks that homepage says Testing infrastructure working' do
#     visit '/'
#     expect(page).to have_content 'Testing infrastructure working!'
#   end
# end
