Given(/^I am a guest$/) do
end

When(/^I fill the register form with valid data$/) do
  visit('/register')
  fill_in 'reader_email', with: 'reader01@mail.com'
  fill_in 'reader_password', with: 'pass'
  fill_in 'reader_password_confirmation', with: 'pass'
  click_button 'Register'
end

Then(/^I should be registered in application$/) do
  expect(Reader.where(email: 'reader01@mail.com').first).not_to be_nil
end

Then(/^I should be logged in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill the register form with invalid data$/) do
  visit('/register')
  fill_in 'reader_email', with: 'reader01@mail.com'
  fill_in 'reader_password', with: 'p'
  fill_in 'reader_password_confirmation', with: 'pass'
  click_button 'Register'
end

Then(/^I should see the register form again$/) do
  expect(page).to have_selector('form#new_reader')
end

Then(/^I should not be registered in application$/) do
  expect(Reader.where(email: 'reader01@mail.com').first).to be_nil
end
