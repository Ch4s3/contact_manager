require 'spec_helper'

describe EmailAddressesController do

  def valid_attributes
    { "address" => "MyString", "contact_id" => 1, "contact_type"=> "Person" }
  end


  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new email_address as @email_address" do
      get :new, {}, valid_session
      assigns(:email_address).should be_a_new(EmailAddress)
    end
  end

  describe "GET edit" do
    it "assigns the requested email_address as @email_address" do
      email_address = EmailAddress.create! valid_attributes
      get :edit, {:id => email_address.to_param}, valid_session
      assigns(:email_address).should eq(email_address)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      let (:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
      let(:valid_attributes) { {address: 'bob@test.com', contact_id: bob.id, contact_type: 'Person'} }

      it "creates a new EmailAddress" do
        expect {
          post :create, {:email_address => valid_attributes}, valid_session
        }.to change(EmailAddress, :count).by(1)
      end

      it "assigns a newly created email_address as @email_address" do
        post :create, {:email_address => valid_attributes}, valid_session
        assigns(:email_address).should be_a(EmailAddress)
        assigns(:email_address).should be_persisted
      end

      it "redirects to the person" do
        post :create, {:email_address => valid_attributes}, valid_session
        response.should redirect_to(person_path(bob))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email_address as @email_address" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "address" => "invalid value" }}, valid_session
        assigns(:email_address).should be_a_new(EmailAddress)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        post :create, {:email_address => { "address" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:bob) { Person.create(first_name: 'Bob', last_name: 'Jones') }
      let(:valid_attributes) { {address: 'bob@bob.co', contact_id: bob.id, contact_type: 'Person'} }


      it "updates the requested email_address" do
        email_address = EmailAddress.create! valid_attributes
        # Assuming there are no other email_addresses in the database, this
        # specifies that the EmailAddress created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EmailAddress.any_instance.should_receive(:update).with({ "address" => "MyString" })
        put :update, {:id => email_address.to_param, :email_address => { "address" => "MyString" }}, valid_session
      end

      it "assigns the requested email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "redirects to the person" do
        email_address = EmailAddress.create! valid_attributes
        put :update, {:id => email_address.to_param, :email_address => valid_attributes}, valid_session
        expect(response).to redirect_to(person_path(bob))

      end
    end

    describe "with invalid params" do
      it "assigns the email_address as @email_address" do
        email_address = EmailAddress.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "address" => "invalid value" }}, valid_session
        assigns(:email_address).should eq(email_address)
      end

      it "re-renders the 'edit' template" do
        email_address = EmailAddress.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailAddress.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_address.to_param, :email_address => { "address" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let (:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
    let(:valid_attributes) { {address: 'alice@test.com', contact_id: alice.id, contact_type: 'Person'} }
    let(:valid_attributes) { {address: '15_kittens82@hotmail.com', contact_id: alice.id, contact_type: 'Person' } }

    it "destroys the requested email_address" do
      email_address = EmailAddress.create! valid_attributes
      expect {
        delete :destroy, {:id => email_address.to_param}, valid_session
      }.to change(EmailAddress, :count).by(-1)
    end

    it "redirects to the email_addresses list" do
      email_address = EmailAddress.create! valid_attributes
      delete :destroy, {:id => email_address.to_param}, valid_session
      expect(response).to redirect_to(person_path(alice))
    end
  end

end
