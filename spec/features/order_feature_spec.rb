require 'rails_helper'

describe 'orders page' do
	let(:post) {Post.new title: 'Test picture'}
	let(:admin) {Admin.new email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678'}
	let(:user) {User.new email: 'customer@yo.com', password: '12345678', password_confirmation: '12345678'}

	context 'logged as an admin' do

		before do
			login_as admin, scope: :admin
		end

		context 'there are no orders' do
			it 'displays a message' do
				visit ('/orders')
				expect(page).to have_content 'No orders received yet.'
			end
		end

		context 'there are orders' do
			before do
				christmas = Date.new(2013,12,25)
				Order.create id: 1, post: post, user: user, created_at: christmas
				visit '/orders'
			end

			it 'displays the product' do
				expect(page).to have_link 'Test picture'
			end

			it 'displays customer email' do
				expect(page).to have_content 'customer@yo.com'
			end

			it 'displays order number' do
				expect(page).to have_content '2512130001'
			end
		end

	end
end