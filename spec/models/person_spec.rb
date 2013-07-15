require 'spec_helper'

describe Person do

  let (:person) do
    person = Person.new(first_name: 'Liz', last_name: 'White')
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'is valid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is valid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'has an array of phone numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an array of e-mail addresses' do
    expect(person.email_addresses).to eq([])
  end
end
