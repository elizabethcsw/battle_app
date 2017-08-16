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
    test2
  end

  def test1
    expect(page).to have_content 'Testing infrastructure working!'
  end

end

  scenario 'expects players to fill in their name' do
    fill_in('Fist name', with: 'David')
    find_button('Submit').click
    test2
  end

def test2
  expect()

# #  In spec/features, add a new Capybara feature test
# that expects players to fill in their names (in a form),
# submit that form, and see those names on-screen


end


end
