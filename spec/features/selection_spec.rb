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

