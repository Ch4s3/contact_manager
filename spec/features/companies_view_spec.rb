require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the companies view', type: :feature do

  context 'when logged in' do
    let(:user) { Fabricate(:user) }

    it 'displays companies associated with the user' do
      company_1 = Fabricate(:company)
      company_1.user = user
      company_1.save
      login_as(user)
      visit(companies_path)
      expect(page).to have_text(company_1.to_s)
    end

    it 'does not display companies associated with other users' do
      company_1 = Fabricate(:company)
      user_2 = User.create(name: "Bob", provider: "twitter", uid: "1234" )
      company_2 = Company.new(:name => "Bob's Bikes")
      company_2.user_id = user_2.uid
      company_2.save
      login_as(user_2)
      visit(companies_path)
      expect(page).not_to have_text(company_1.to_s)
    end

  end

end