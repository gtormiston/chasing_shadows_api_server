require 'rails_helper'

Capybara.default_driver = :selenium
Capybara.server_port = 3000

feature 'home page' do
  scenario 'visiting home page' do
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    expect(page).to have_content 'Chasing Shadows'
  end

  scenario 'log in page' do
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    click_link 'login_link'
    expect(page).to have_field('username')
    expect(page).not_to have_field('email')
  end

  scenario 'successful log in' do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123")
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    click_link 'login_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'Submit'
    expect(page).to have_content 'Lorem ipsum'
  end

  # scenario 'go to map page' do
  #   visit 'http://localhost:8000/ios/www/index.html?env=dev'
  #   click_link 'login_link'
  #   fill_in 'username', with: 'enzoo'
  #   fill_in 'password', with: 'password'
  #   click_on 'Submit'
  #   click_on 'gameplay_link'
  #   expect(page).to have_css('div.playerMarker')
  # end

  # scenario 'successful sign up' do
  #   visit 'http://localhost:8000/ios/www/index.html?env=dev'
  #   fill_in 'username', with: 'enzoo'
  #   fill_in 'password', with: 'password'
  #
  # end


end
