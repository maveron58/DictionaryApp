require "spec_helper"

feature "Word search" do
  scenario "User searches for aaa and doesn't find it" do
    visit "/en/search"

    fill_in 'word', :with => 'aaa'
    click_on "submit"

    page.should have_selector('p', :text => 'No results.')
  end

  scenario "User searches for aaa and finds it" do
    lan1 = Language.create(:name => 'pl', :from => true)
    lan2 = Language.create(:name =>'en', :to => true)
    Word.create(:word => 'aaa', :definition => 'definicjadefinicja', :from => lan1, :to => lan2)

    visit "/en/search"

    fill_in 'word', :with => 'aaa'
    click_on "submit"

    page.should have_selector('h3', :text => 'Aaa')
    page.should have_selector('li', :text => 'definicjadefinicja')

    Word.destroy_all
    Language.destroy_all
  end
end