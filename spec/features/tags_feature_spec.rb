require 'rails_helper'

describe 'tagging posts' do

	context 'post is entered' do

		let!(:user) {User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'}

		before do
			
			login_as user
		end

		it 'tags can be added' do
			visit 'posts/new'
			fill_in 'Title', with: 'Post1'
			fill_in 'Description', with: 'Cool post.'
			attach_file 'Image', Rails.root.join('spec/images/pizza.jpg')
			fill_in 'Tags', with: '#yum, #mhhhh'
			click_button 'Post it!'
			expect(page).to have_link '#yum'
			expect(page).to have_link '#mhhhh'

		end

	end

	context 'existing posts' do

		let!(:user) {User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'}

		before do
			login_as user
			user.posts.create(title: 'Post1', tag_names: 'tag1')
			user.posts.create(title: 'Post2', tag_names: 'tag2')
			visit '/posts'
		end


		it 'should filter posts by selected tag' do
			click_link 'tag1'
			expect(page).to have_css 'h1', 'posts associated with tag1'
			expect(page).to have_content 'Post1'
			expect(page).not_to have_content 'Post2'
		end

		it 'uses the tag name in the url' do
			click_link 'tag1'
			expect(current_path).to eq '/tags/tag1'
		end

	end

end