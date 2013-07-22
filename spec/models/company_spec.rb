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

  it 'builds associated companies' do
    company_1 = Fabricate(:company)
    company_2 = Fabricate(:company)
    [company_1, company_2].each do |company|
      expect(user.companies).not_to include(company)
      user.companies << company
      expect(user.companies).to include(company)
    end
  end

end
