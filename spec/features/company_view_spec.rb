require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do

  let(:company) { Company.create(name: "Bob Oblob's Law Blog") }

  describe 'phone numbers' do

    before(:each) do
      company.phone_numbers.create(number: "555-2325")
      company.phone_numbers.create(number: "555-2324")
      visit company_path(company)
    end

    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: "Company"))
    end

    it 'has links to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9999')
      page.click_button('Update Phone number')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9999')
      expect(page).to_not have_content(old_number)
    end


    it 'adds a new phone numer' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(company_path(company.id))
      expect(page).to have_content('555-8888')
    end

  end

  describe 'e-mail addresses' do
    let(:company) { Company.create(name: "Bob Oblob's Law Blog") }

    before(:each) do
      company.email_addresses.create(address: "test1@test.com", contact_id: company.id)
      person.email_addresses.create(address: "foo@bar.com", contact_id: company.id)
      visit company_path(company)
    end

    it 'shows email addresses' do
      company.email_addresses.each do |email_address|
        expect(page).to have_selector('li', text: email_address.address)
      end
    end

    it' has an add email address link' do
      expect(page).to have_link('Add e-mail address', href: new_email_address_path(person_id: person.id))
    end

    it 'adds a new email address' do
      page.click_link('Add e-mail address')
      page.fill_in('Address', with: 'foo@bar.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('foo@bar.com')
    end

  end
end