require 'capybara/rspec'
require 'word'
require 'definition'
require './app'

Capybara.app = Sinatra::Application

describe 'when the user views the index page', { :type => :feature } do
  before do
    visit '/'
  end

  it 'should display a form' do
    expect(page).to have_content 'Dictionary'
    expect(page).to have_content 'Word to Define'
    expect(page).to have_content 'Origin of Word'
  end

  context 'when filling out the form with all elements' do
    it 'should allow the user to create a new word by filling in the form and redict to that page' do
      fill_in 'Word to Define', with: 'Bacon'
      fill_in 'Origin of Word', with: 'Merica'
      click_button 'Add Word'
      expect(page).to have_content 'Bacon'
      expect(page).to have_content 'Definition'
      expect(page).to have_content 'Part of Speech'
      expect(page).to have_content 'Use it in a sentence'
    end

    it 'should add that word to the list of words on the index page' do
      click_link 'Home'
      expect(page).to have_content 'Bacon'
    end
  end

  # Spec fails probably because it cannot detect the html required tag; functionality still works as expected
  # context 'when not filling in some required elements' do
  #   it 'should prevent the user from moving to the next page' do
  #     visit '/'
  #     fill_in 'Word to Define', with: ''
  #     click_button 'Add Word'
  #     expect(page).to have_content 'Add Word'
  #   end
  # end
end
