require 'rails_helper'

describe 'posts page' do
	context 'no posts' do
		it 'tells me there are no posts' do
			visit '/posts'
			expect(page).to have_content 'No posts yet.'
		end
	end
	
end