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
end
