require 'spec_helper'

describe Company do
   let(:company) { Company.new(name: "Bob Oblob's Law Blog") }

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    company.name = nil
    expect(company).not_to be_valid
  end

  it 'responds with its created phone numbers' do
    company.phone_numbers.build(number: '555-6666')
    expect(company.phone_numbers.map(&:number)).to eq(['555-6666'])
  end

  it 'responds with its created e-mail addresses' do
    company.email_addresses.build(address: '1@23.com')
    expect(company.email_addresses.map(&:address)).to eq(['1@23.com'])
  end
end
