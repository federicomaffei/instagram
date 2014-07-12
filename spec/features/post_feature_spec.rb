require 'rails_helper'

describe 'posts index page' do
	context 'no posts' do
		it 'tells me there are no posts' do
			visit '/posts'
			expect(page).to have_content 'No posts yet.'
		end
	end

	context 'links' do
		before do
			user = User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'
			login_as user
		end
		it 'contains a link to the new post path' do
			visit '/posts'
			click_link 'New Post'
			expect(current_path).to eq '/posts/new'
		end
	end

	context 'shows a post' do

		before do
			user = User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'
			user.posts.create(title: 'Post1', description: 'Cool post.')
		end

		it 'shows the post by name' do
			visit '/posts'
			expect(page).to have_content 'Cool post.'
		end
	end
end

describe 'posts creation' do

	context 'when logged out' do

		it 'is not possible to post' do
			visit '/posts'
			click_link 'New Post'
			expect(page).to have_content 'Sign in'
			expect(page).not_to have_field 'Title'
		end
	end


	context 'when logged in' do

		before do
			user = User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'
			login_as user
		end

		it 'allows the creation of a post' do
			visit 'posts/new'
			fill_in 'Title', with: 'Post1'
			fill_in 'Description', with: 'Cool post.'
			click_button 'Post it!'
			expect(current_path).to eq '/posts'
			expect(page).to have_content 'Cool post.'
		end

		it 'user can add a photo to posts' do
			visit 'posts/new'
			fill_in 'Title', with: 'Post1'
			fill_in 'Description', with: 'Cool post.'
			fill_in 'Address', with: '25 City Road, London'
			attach_file 'Image', Rails.root.join('spec/images/pizza.jpg')
			click_button 'Post it!'
			expect(current_path).to eq '/posts'
			expect(page).to have_content 'Posted by: prova@prova.net'
			expect(page).to have_css 'img.uploaded-pic'

		end
	end
end

