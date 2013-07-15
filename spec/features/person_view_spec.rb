require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "555-2325")
    person.phone_numbers.create(number: "555-2324")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: 'Person'))
  end

  it 'has links to edit phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit', href: edit_phone_number_path(phone))
    end
  end

  it 'edits a phone number' do
    phone = person.phone_numbers.first
    old_number = phone.number

    first(:link, 'edit').click
    page.fill_in('Number', with: '555-9999')
    page.click_button('Update Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('555-9999')
    expect(page).to_not have_content(old_number)
  end


  it 'adds a new phone numer' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-8888')
  end

end

describe 'display email addresses' do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.email_addresses.create(address: "jon@test.com")
    person.email_addresses.create(address: "jon.j@spec.com")
    visit person_path(person)
  end

  it 'edits an email address' do
    email_address = person.email_addresses.first
    old_email = email_address.address

    first(:link, 'edit').click
    page.fill_in('Address', with: 'foo@test.com')
    page.click_button('Update Email address')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('foo@test.com')
    expect(page).to_not have_content(old_email)
  end

  it 'shows the email addresses' do
    person.email_addresses.each do |email_address|
      expect(page).to have_content(email_address.address)
    end
  end

end