require 'rails_helper'

RSpec.describe Agency, type: :model do

  context :search do
  
    before :each do
      agency = FactoryGirl.create(:agency)
      new_agency = FactoryGirl.create(:agency, name: 'new agency')
      FactoryGirl.create(:tag, agency: new_agency)
    end
    
    it 'should search agency by name' do
      params = { name: 'new agency', tag: ''}
      result = Agency.search params
      expect(result.length).to eq 1 
      expect(result.first.name).to eq 'new agency' 
    end

    it 'should return blank array if name not match' do
      params = {name: 'new agency1', tag: '' }
      result = Agency.search params
      expect(result.length).to eq 0
    end

    it 'should search by tag' do
      params = {name: '', tag: 'Tag1' }
      result = Agency.search params
      expect(result.length).to eq 1
      expect(result.first.tag_list).to eq 'Tag1'
    end

    it 'should return all agencies' do
      result = Agency.search 
      expect(result.length).to eq 2
    end
  end

  context :tag_list do
      before :each do
        @agency = FactoryGirl.create(:agency)
      end
    
    it 'should retrun tag list with comma separated' do
      4.times {|i| FactoryGirl.create(:tag, name: "Tag#{i+1}" ,agency: @agency) }
      expect(@agency.tag_list).to eq 'Tag1,Tag2,Tag3,Tag4'
    end
  end
    
end
