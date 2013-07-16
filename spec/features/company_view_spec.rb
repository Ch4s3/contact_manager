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
  end

end