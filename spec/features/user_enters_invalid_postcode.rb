RSpec.describe 'Opening the page', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    fill_in 'search[post_code]', with: 'M27 6EW'
    click_on 'Search'
    expect(page).to have_content('We dont serve in your area')
  end
end