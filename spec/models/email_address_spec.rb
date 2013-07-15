require 'spec_helper'

describe EmailAddress do
   let (:email_address) do
    email_address = EmailAddress.new(address: 'test@123.com', person_id: 1)
  end

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
    email_address.address = nil
    expect(email_address).not_to be_valid
  end

  it 'is invalid without a person id' do
    email_address.person_id = nil
    expect(email_address).not_to be_valid
  end

  it 'is associated with a person' do
    expect(email_address).to respond_to(:person)
  end

end
