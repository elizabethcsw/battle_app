require_relative '../../app.rb'

def sign_in_and_play
    visit '/'
    fill_in('name1', with: 'Nick')
    fill_in('name2', with: 'Eli')
    find_button('Submit').click
end
