if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_k3CC3d3LyfThhxtFW9y5fELH',
    :secret_key => 'sk_test_T15BKpGFKfYAMORxT0q6qVsm'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
