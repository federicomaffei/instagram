class Order < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	after_create :send_confirmation_email

	def number
		date_created = created_at.strftime('%d%m%y')
		date_created + '%04d' % id
	end

	def send_confirmation_email
		OrderMailer.confirmation(self).deliver
	end
end
