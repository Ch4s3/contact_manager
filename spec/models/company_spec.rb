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

end
