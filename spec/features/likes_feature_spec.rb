require 'rails_helper'

describe 'liking posts' do
	before do
		user = User.create email: 'customer@yo.com', password: '12345678', password_confirmation: '12345678'
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

end