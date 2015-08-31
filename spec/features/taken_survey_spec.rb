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
