require 'stripe'

class StripeController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create]

def create

  total_in_cents = (params[:total].to_f * 100).to_i

Stripe.api_key='sk_test_51PYXLtRoF1R8UIs1KwyBCgtpXlPwqXyLbs6RBMHg2ApFiILbgt8qjVZqMhaI2KEj4N1PvJQWSXYWB0r0CvDQbybU00bMpPy6OJ'

  session=Stripe::Checkout::Session.create( { line_items: [{
    price_data: {
      currency: 'cad',
      product_data: {
        name: 'Airfare',
      },
      unit_amount: total_in_cents,
    },
    quantity: 1,
  }],

  ui_mode:'embedded',

  mode: 'payment',
  # These placeholder URLs will be replaced in a following step.
  return_url: 'http://localhost:5173/', 
})

puts session

  render json: { id:session.client_secret } 

end

end