class PaymentsController < ApplicationController
	Stripe.api_key = "sk_test_T15BKpGFKfYAMORxT0q6qVsm"

	def create

		@product = Product.find(params[:product_id])
		@user = current_user	
		token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => 345, # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => "Example charge...."
    )

    if charge.paid
    	Order.create(product_id: @product, user_id: @user, total: 345 )
    end
  rescue Stripe::CardError => e
    # The card has been declined

    redirect_to product_path(@product)
  end
		
	end

end
