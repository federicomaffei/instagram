class Order < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	def number
		date_created = created_at.strftime('%d%m%y')
		date_created + '%04d' % id
	end

end
