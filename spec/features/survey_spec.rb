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

end

