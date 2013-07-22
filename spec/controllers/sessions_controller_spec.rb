require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

class  FakeSessionsController < ApplicationController
  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end

describe 'the appliaction', type: :feature do
  context 'when logged in' do
    before(:each) do
      #binding.pry
      Rails.application.routes.draw do
        root to: 'site#index'
        get '/fake_login' => 'fake_sessions#create', as: :fake_login
        get '/login' => redirect('/auth/twitter'), as: :login
        delete "/logout" => "sessions#destroy", as: :logout
      end
      #binding.pry
      @user = User.create(name: 'Jane Doe')
      visit fake_login_path(:user_id => @user.id)
    end

    after(:each) do
      Rails.application.reload_routes!
    end

    it 'has a logout link' do
      expect(page).to have_link('Logout', href: logout_path)
    end

    it 'does not have a login link' do
      expect(page).not_to have_link('Login', href: login_path)
    end

  end

  describe SessionsController do

    describe "#create" do

      it "logs in a new user" do
        @request.env["omniauth.auth"] = {
          'provider' => 'twitter',
          'info' => {'name' => 'Alice Smith'},
          'uid' => 'abc123'
        }

        post :create
        user = User.find_by_uid_and_provider('abc123', 'twitter')
        expect(controller.current_user.id).to eq(user.id)
      end

      it "logs in an existing user" do
        @request.env["omniauth.auth"] = {
          'provider' => 'twitter',
          'info' => {'name' => 'Bob Oblob'},
          'uid' => 'xyz456'
        }
        user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Oblob')
        post :create
        expect(User.count).to eq(1)
        expect(controller.current_user.id).to eq(user.id)
      end

      it 'redirects to the companies page' do
        @request.env["omniauth.auth"] = {
          'provider' => 'twitter',
          'info' => {'name' => 'Charlie Allen'},
          'uid' => 'prq987'
        }
        user = User.create(provider: 'twitter', uid: 'prq987', name: 'Charlie Allen')
        post :create
        expect(response).to redirect_to(companies_path)
      end

    end

  end
end
