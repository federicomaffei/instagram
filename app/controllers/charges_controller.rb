class ChargesController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
	end

	def create
  		# Amount in cents
  		@amount = 2000

  		customer = Stripe::Customer.create(:email => 'example@stripe.com', :card  => params[:stripeToken])
  		charge = Stripe::Charge.create(
  			:customer    => customer.id,
  			:amount      => @amount,
  			:description => 'Rails Stripe customer',
  			:currency    => 'usd'
  			)
  		Order.create(user: current_user, post: @post)
  	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to charges_path(@post)
  	end
  end