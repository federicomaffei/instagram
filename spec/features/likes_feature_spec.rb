require 'rails_helper'

describe 'liking posts' do
	let(:user) {create(:user)}
	before do 
		user.posts.create title: 'Test picture', description: 'Test description'
	end

	it 'initially has 0 likes' do
		visit('/posts')
		expect(page).to have_link '❤ 0'
	end

	it 'clicking on button increases likes by 1', js: true do
		visit('/posts')
		click_link '❤ 0'
		expect(page).to have_link '❤ 1'
	end

	it 'can only be liked once by the user', js: true do
		visit '/posts'
		click_link '❤ 0'
		sleep 2
		click_link '❤ 1'
		sleep 2
		expect(page).to have_link '❤ 1'
	end

end