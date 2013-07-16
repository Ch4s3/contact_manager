require 'spec_helper'

describe EmailAddress do
<<<<<<< HEAD
   let (:email_address) do
    email_address = EmailAddress.new(address: 'test@123.com', person_id: 1)
  end
=======
  let(:email_address) {EmailAddress.new(address: "jon@test.com", person_id: 1) }
>>>>>>> implement-email-addresses

  it 'is valid' do
    expect(email_address).to be_valid
  end

<<<<<<< HEAD
  it 'is invalid without an address' do
=======
  it 'is invalid without and address' do
>>>>>>> implement-email-addresses
    email_address.address = nil
    expect(email_address).not_to be_valid
  end

<<<<<<< HEAD
  it 'is invalid without a person id' do
=======
  it 'is invalid without a person_id' do
>>>>>>> implement-email-addresses
    email_address.person_id = nil
    expect(email_address).not_to be_valid
  end

<<<<<<< HEAD
  it 'is associated with a person' do
    expect(email_address).to respond_to(:person)
  end

=======
>>>>>>> implement-email-addresses
end
