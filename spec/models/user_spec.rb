require 'spec_helper'

describe User do

  let(:user) { Fabricate(:user)}

  context 'when user has associated people' do
    before do
      @person_1 = Fabricate(:person)
      @person_2 = Fabricate(:person)
      user.people << @person_1
      user.people << @person_2
    end

    it 'has associated people' do
      expect(user.people.size).to eq(2)
    end

    it 'builds associated people' do
      person_3 = Fabricate(:person)
      expect(user.people).to include(@person_1, @person_2)
      expect(user.people).not_to include(@person_3)
    end
  end

  context 'when user has associated companies' do
    before do
      @company_1 = Fabricate(:company)
      @company_2 = Fabricate(:company)
      user.companies << @company_1
      user.companies << @company_2
    end

      it 'has associated companies' do
        expect(user.companies.size).to eq(2)
      end

      it 'builds associated companies' do
        company_3 = Fabricate(:company)
        expect(user.companies).to include(@company_1, @company_2)
        expect(user.companies).not_to include(@company_3)
      end

  end

end
