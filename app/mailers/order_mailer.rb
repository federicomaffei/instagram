class OrderMailer < ActionMailer::Base
	default from: "no_reply@pizzagram.com"

	def confirmation(order)
		@order = order
		mail(to: order.user.email, subject: "You just ordered a print of #{order.post.title}.")
	end

end
