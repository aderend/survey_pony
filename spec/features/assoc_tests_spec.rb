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

describe Survey do

	it 'should belong to a creator' do
		should belong_to(:creator).class_name('User')
	end

	it 'should have many questions' do
		should have_many(:questions)
	end

	it 'should have many choices' do
		should have_many(:choices).through(:questions)
	end

	it 'should validate the presence of title' do
		should validate_presence_of(:title)
	end

	it 'should validate the presence of category' do
		should validate_presence_of(:category)
	end
end

describe Question do

	it 'should belong to a survey' do
		should belong_to(:survey)
	end

	it 'should have many choices' do
		should have_many(:choices)
	end

	it 'should validate the presence of body' do
		should validate_presence_of(:body)
	end
end


describe Choice do

	it 'should belong to a questions' do
		should belong_to(:question)
	end

	it 'should belong to a survey' do
		should belong_to(:survey).through(:questions)
	end

	it 'should have many selections' do
		should have_many(:selections)
	end

	it 'should validate the presence of body' do
		should validate_presence_of(:body)
	end
end

describe TakenSurvey do

	it 'should belong to a survey' do
		should belong_to(:survey)
	end

	it 'should belong to a taker' do
		should belong_to(:taker).class_name('User')
	end

	it 'should have many selections' do
		should have_many(:selections)
	end
end

describe Selection do

	it 'should belong to a choice' do
		should belong_to(:choice)
	end

	it 'should belong to a user' do
		should belong_to(:user)
	end

	it 'should belong to a taken survey' do
		should belong_to(:taken_survey)
	end
end