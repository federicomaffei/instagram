class ChargesController < ApplicationController
  before_action :authenticate_user!

	def new
		@post = Post.find_by_title(params[:post_id].gsub("_", " "))
	end

	def create
  		# Amount in cents
  		@amount = 2000
  		customer = Stripe::Customer.create(:email => 'example@stripe.com', :card  => params[:stripeToken])
  		charge = Stripe::Charge.create(
  			:customer    => customer.id,
  			:amount      => @amount,
  			:description => 'Print of #{@post.title}',
  			:currency    => 'usd'
  			)
  		Order.create(user: current_user, post: @post)

      flash[:notice] = 'Thanks for the payment.'
      redirect_to posts_path

  	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to charges_path(@post)
  	end
  end 