require 'rails_helper'

RSpec.describe Post, :type => :model do

	let(:post) {Post.create}

	describe '#tag_names=' do
		context 'no tags' do
			it 'does nothing' do
				expect {post.tag_names = ''}.not_to raise_error
			end
		end

		context 'one tag that does not exist' do
			it 'adds tag to the post' do
				post.tag_names = '#yolo'
				expect(post.tags.length).to eq 1
			end
		end

		context 'two tags that does not exist' do
			it 'adds tag to the post' do
				post.tag_names = '#yolo, #swag'
				expect(post.tags.length).to eq 2
			end
		end
	end

	describe 'tag already exists' do
		let!(:existing_tag) {Tag.create(name: '#yolo')}

		it 'reuses the existing tag' do
			post.tag_names = '#yolo'
			expect(post.tags).to include existing_tag
			expect(Tag.count).to eq 1
		end
	end



end