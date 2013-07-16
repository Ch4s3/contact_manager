require 'spec_helper'

describe Person do

  let (:person) do
    person = Person.new(first_name: 'Liz', last_name: 'White')
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-6666')
    expect(person.phone_numbers.map(&:number)).to eq(['555-6666'])
  end

  it 'responds with its created e-mail addresses' do
    person.email_addresses.build(address: '1@23.com')
    expect(person.email_addresses.map(&:address)).to eq(['1@23.com'])
  end

end
