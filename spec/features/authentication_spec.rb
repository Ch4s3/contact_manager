require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

  describe 'theapplication', type: :feature do

    context 'when logged out' do
      before(:each) do
        visit root_path
      end

    it 'has a login link' do
      expect(page).to have_link('Login', href: login_path)
    end
  end

end