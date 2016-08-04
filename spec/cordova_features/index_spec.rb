require 'rails_helper'

Capybara.default_driver = :selenium
Capybara.server_port = 3000

feature 'home page' do


  scenario 'log in page' do
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    click_button 'sign_in_link'
    expect(page).to have_field('username')
    expect(page).not_to have_field('email')
  end

  scenario 'successful log in' do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123")
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    click_button 'sign_in_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'LOGIN'
    expect(page).to have_content 'THE STORY SO FAR'
  end

  # scenario 'unsuccessful log in' do
  #   visit 'http://localhost:8000/ios/www/index.html?env=dev'
  #   click_link 'login_link'
  #   fill_in 'username', with: 'enzoo1'
  #   fill_in 'password', with: '123123'
  #   click_on 'Submit'
  #   expect(page).not_to have_content 'Lorem ipsum'
  # end

  scenario 'Sign up' do
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    fill_in 'password', with: '123123'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password_confirmation', with: '123123'
    fill_in 'email', with: "123@email.com"
    click_on 'SIGN UP'
    expect(page).to have_content 'THE STORY SO FAR'
  end

  scenario 'go to map page' do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123")
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    click_button 'sign_in_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'LOGIN'
    click_on 'START PLAYING'
    expect(page).to have_css('div.playerMarker')
  end

  it 'a monster appear close to user location', :js => true do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123", lat: 51, lng: -0.01)
    Enemy.create(name: "Donald", size: 1, lng: -0.01, lat: 51, active: true)
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    simulate_location 51, -0.01
    click_button 'sign_in_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'LOGIN'
    click_on 'START PLAYING'
    expect(page).to have_css('div.playerMarker')
    expect(page).to have_css('div.monster-marker')

  end

  it 'can attack a monster', :js => true do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123", lat: 51, lng: -0.01)
    @enemy = Enemy.create(name: "Donald", size: 1, lng: -0.01, lat: 51, active: true)
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    simulate_location 51, -0.01
    click_button 'sign_in_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'LOGIN'
    click_on 'START PLAYING'
    expect(page).to have_css('div.playerMarker')
    expect(page).to have_css('div.monster-marker')
    sleep 1
    find("div#monster_#{@enemy.id}").click
    sleep 10
    expect(page).to have_button 'attack'
  end

  it 'kills a monster', :js => true do
    User.create(email: "123@email.com", name: "enzoo1", password: "123123", password_confirmation: "123123", lat: 51, lng: -0.01)
    @enemy = Enemy.create(name: "Donald", size: 1, lng: -0.01, lat: 51, active: true)
    visit 'http://localhost:8000/ios/www/index.html?env=dev'
    simulate_location 51, -0.01
    click_button 'sign_in_link'
    fill_in 'username', with: 'enzoo1'
    fill_in 'password', with: '123123'
    click_on 'LOGIN'
    click_on 'START PLAYING'
    expect(page).to have_css('div.playerMarker')
    expect(page).to have_css('div.monster-marker')
    sleep 1
    find("div#monster_#{@enemy.id}").click
    expect(page).to have_button 'attack'
    click_on 'attack'
    sleep 2
    expect(page).not_to have_button 'attack'

  end
  # scenario 'successful sign up' do
  #   visit 'http://localhost:8000/ios/www/index.html?env=dev'
  #   fill_in 'username', with: 'enzoo'
  #   fill_in 'password', with: 'password'
  #
  # end


end



def simulate_location(lat, lng)

  page.driver.browser.execute_script <<-JS
    window.navigator.geolocation.getCurrentPosition = function(success, failure){
      var position = {coords : { latitude: #{lat}, longitude: #{lng} }};
      success(position);
    }

    window.navigator.geolocation.watchPosition = function(success, failure, options) {
      var position = {coords : { latitude: #{lat}, longitude: #{lng} }};
      success(position);

    }

  JS
end
