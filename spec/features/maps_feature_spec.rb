require 'rails_helper'

class Capybara::Session
	def has_map?
		has_css?('div.gm-style')
	end
end


describe 'maps' do

	context 'posts with address' do

		before do
			user = User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'
			user.posts.create(title: 'Post1', description: 'Cool post.', address: '25 City Road, London')
		end

		it 'shows a map', js: true do
			visit '/posts'
			click_link 'Map'
			expect(page).to have_content 'Geocoding of post'
			expect(page).to have_map
		end

	end	


end