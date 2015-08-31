require_relative '../spec_helper'
describe User do
	it 'should have many selections' do
		should have_many(:selections)
	end

	it 'should have many taken_surveys' do
		should have_many(:taken_surveys).with_foreign_key('taker_id')
	end

	it 'should have many created surveys' do
		should have_many(:created_surveys).class_name('Survey').with_foreign_key('creator_id')
	end

	it 'should validate the presence of username' do
		should validate_presence_of(:username)
	end

	it 'should validate the presence of email' do
		should validate_presence_of(:username)
	end

	it 'should validate the presence of username' do
		should validate_presence_of(:password)
	end
end

