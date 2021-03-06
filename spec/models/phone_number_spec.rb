require 'spec_helper'

describe PhoneNumber do

  let(:phone_number) { PhoneNumber.new(number: "4103365555", contact_id: 1, contact_type: 'Person') }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it 'is invalid with more than 11 numbers' do
    number = PhoneNumber.new(number: "123-456-555-6666", contact_id: 1, contact_type: 'Person')
    expect(number).to_not be_valid
  end

  it 'is invalid with fewer than 7 numbers' do
    number = PhoneNumber.new(number: "5-6666", contact_id: 1, contact_type: 'Person')
    expect(number).to_not be_valid
  end

  it 'must have a reference to a contact' do
    phone_number.contact_id = nil
    expect(phone_number).not_to be_valid
  end

  it 'must have a Contact type' do
    phone_number.contact_type = nil
    expect(phone_number).not_to be_valid
  end

  it 'is associated with a contact' do
    expect(phone_number).to respond_to(:contact)
  end

end
