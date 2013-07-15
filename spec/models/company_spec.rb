require 'spec_helper'

describe Company do
  let (:company) do
    company = Company.new(name: "bob's bikes")
  end

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is invalid w/o a name' do
    company.name = nil
    expect(company).not_to be_valid
  end

  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end

  it "responds with its phone nums after they're created" do
    phone_number = company.phone_numbers.build(number: "321-9999")
    expect(phone_number.number).to eq('321-9999')
  end

end
