require_relative '../../app.rb'


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

  scenario 'expects players to fill in their name' do
    visit '/'
    fill_in('name', with: 'Nick')
    find_button('Submit').click
    test2
  end

  def test1
    expect(page).to have_content 'Testing infrastructure working!'
  end

  def test2
    expect(page).to have_content 'His name is Nick'
  end

end





# #  In spec/features, add a new Capybara feature test
# that expects players to fill in their names (in a form),
# submit that form, and see those names on-screen
