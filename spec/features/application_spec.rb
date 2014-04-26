require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Sees cats that have been created' do
    visit '/'
    visit '/cats/new'
    fill_in 'name', with: 'Siamese'
    fill_in 'color', with: 'White'
    fill_in 'kittens', with: 4
    click_on 'Create Cat'
    expect(page).to have_content 'Siamese'
  end

  scenario "can update a cat" do
    visit '/cats/new'
    fill_in 'name', with: 'Siamese'
    fill_in 'color', with: 'White'
    fill_in 'kittens', with: 4
    click_on 'Create Cat'
    click_on 'Siamese'
    fill_in 'name', with: 'Lola'
    click_on 'Update Kitty'
    expect(page).to have_content('Lola')
    expect(page).to_not have_content('Siamese')
  end

  scenario "can destroy a kitty" do
    visit '/cats/new'
    fill_in 'name', with: 'Siamese'
    fill_in 'color', with: 'White'
    fill_in 'kittens', with: 4
    click_on 'Create Cat'
    click_on 'Siamese'
    click_on 'Destroy Kitty'
    expect(page).to_not have_content('Siamese')
  end
end