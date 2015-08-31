require_relative '../spec_helper'
describe Choice do

	it 'should belong to a questions' do
		should belong_to(:question)
	end

	xit 'should belong to a survey' do
		should belong_to(:survey).through(:questions)
	end

	it 'should have many selections' do
		should have_many(:selections)
	end

	it 'should validate the presence of body' do
		should validate_presence_of(:body)
	end
end

