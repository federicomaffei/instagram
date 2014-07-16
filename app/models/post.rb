class Post < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "100x100>" }, :default_url => 'https://dl.dropboxusercontent.com/u/9315601/missing.png', storage: :s3,
	:s3_credentials => {
		bucket: 'pizzagram',
		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
	}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_and_belongs_to_many :tags
	has_many :likes

	def tag_names
		# tags.map(&:name).join(', ')
	end

	def tag_names=(tag_list)
		tag_list.split(',').each do |tag|
			tags << Tag.find_or_create_by(name: tag)
		end
	end

	def to_param
		title.gsub(" ", "_")
	end

end
