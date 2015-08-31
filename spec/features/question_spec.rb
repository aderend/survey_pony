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

