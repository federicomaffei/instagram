require 'rails_helper'

describe 'users registration/login' do

	context 'sign up' do

		it 'can sign up' do
			visit '/users/sign_up'
			fill_in 'Email', with: 'prova@prova.net'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'signed up successfully'

		end
	end

	context 'sign in' do

	before do
		user = User.create email: 'prova@prova.net', password: '12345678', password_confirmation: '12345678'
	end

	it 'can sign in' do
		visit '/users/sign_in'
		fill_in 'Email', with: 'prova@prova.net'
		fill_in 'Password', with: '12345678'
		click_button 'Sign in'
		expect(page).to have_content 'Signed in successfully.'
	end

end

end