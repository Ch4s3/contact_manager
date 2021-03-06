require 'spec_helper'

describe CompaniesController do

  let(:user) { Fabricate(:user) }

  def valid_attributes
    { "name" => "MyString", "user_id" => user.id }
  end

  def valid_session
    {user_id: user.id}
  end

  describe "GET index" do
    it "assigns all companies as @companies" do
      user = User.create
      company = Company.create! valid_attributes.merge(user_id: user.id)
      get :index, {}, {:user_id => user.id}
      assigns(:companies).should eq([company])
    end
  end

  describe "GET show" do
    it "assigns the requested company as @company" do
      company = Company.create! valid_attributes
      get :show, {:id => company.to_param}, valid_session
      assigns(:company).should eq(company)
    end
  end

  describe "GET new" do
    it "assigns a new company as @company" do
      get :new, {}, valid_session
      assigns(:company).should be_a_new(Company)
    end
  end

  describe "GET edit" do
    it "assigns the requested company as @company" do
      company = Company.create! valid_attributes
      get :edit, {:id => company.to_param}, valid_session
      assigns(:company).should eq(company)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, {:company => valid_attributes}, valid_session
        }.to change(Company, :count).by(1)
      end

      it "assigns a newly created company as @company" do
        post :create, {:company => valid_attributes}, valid_session
        assigns(:company).should be_a(Company)
        assigns(:company).should be_persisted
      end

      it "redirects to the created company" do
        post :create, {:company => valid_attributes}, valid_session
        response.should redirect_to(Company.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved company as @company" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        post :create, {:company => { "name" => "invalid value" }}, valid_session
        assigns(:company).should be_a_new(Company)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        post :create, {:company => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested company" do
        company = Company.create! valid_attributes
        Company.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => company.to_param, :company => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested company as @company" do
        company = Company.create! valid_attributes
        put :update, {:id => company.to_param, :company => valid_attributes}, valid_session
        assigns(:company).should eq(company)
      end

      it "redirects to the company" do
        company = Company.create! valid_attributes
        put :update, {:id => company.to_param, :company => valid_attributes}, valid_session
        response.should redirect_to(company)
      end
    end

    describe "with invalid params" do
      it "assigns the company as @company" do
        company = Company.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => { "name" => "invalid value" }}, valid_session
        assigns(:company).should eq(company)
      end

      it "re-renders the 'edit' template" do
        company = Company.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete :destroy, {:id => company.to_param}, valid_session
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = Company.create! valid_attributes
      delete :destroy, {:id => company.to_param}, valid_session
      response.should redirect_to(companies_url)
    end
  end

end
