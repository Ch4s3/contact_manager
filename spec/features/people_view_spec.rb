require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the people view', type: :feature do

  context 'when logged in' do
    let(:user) { Fabricate(:user) }

    it 'displays people associated with the user' do
      person_1 = Fabricate(:person)
      person_1.user = user
      person_1.save
      login_as(user)
      visit(people_path)
      expect(page).to have_text(person_1.to_s)
    end

    it 'does not display people associated with other users' do
      person_1 = Fabricate(:person)
      user_2 = User.create(name: "Bob", provider: "twitter", uid: "1234" )
      person_2 = Person.new(:first_name => 'Jon', :last_name => 'Jones')
      person_2.user_id = user_2.uid
      person_2.save
      login_as(user_2)
      visit(people_path)
      expect(page).not_to have_text(person_1.to_s)
    end
  end

end
