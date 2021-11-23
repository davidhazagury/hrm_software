class Service::SubscriptionsController < ApplicationController
  def show
    skip_authorization
  end

  def new
    skip_authorization
    begin
      # Use Stripe's library to make requests...
      Stripe.api_key = 'sk_test_51JyvFKLDzVZpGFZEf1tEy0fAC4HhCs8YlPLG4fVyrr3yYuSd4mhkxUpWp5fA5CQr3Wr00ufmFL30dYX69CTFEjFV00GAP6JmbX'
      stripe = Stripe::Checkout::Session.create({
        success_url: employees_url(:payment=> 'succeeded'),
        cancel_url: employees_url(:payment=> 'cancelled'),
        line_items: [
          {price: 'price_1JyvQsLDzVZpGFZEC5BVTpPD', quantity: 1},
        ],
        mode: 'subscription',
      })
    rescue Stripe::CardError => e
      puts "Status is: #{e.http_status}"
      puts "Type is: #{e.error.type}"
      puts "Charge ID is: #{e.error.charge}"
      # The following fields are optional
      puts "Code is: #{e.error.code}" if e.error.code
      puts "Decline code is: #{e.error.decline_code}" if e.error.decline_code
      puts "Param is: #{e.error.param}" if e.error.param
      puts "Message is: #{e.error.message}" if e.error.message
    rescue Stripe::RateLimitError => e
      # Too many requests made to the API too quickly
    rescue Stripe::InvalidRequestError => e
      # Invalid parameters were supplied to Stripe's API
    rescue Stripe::AuthenticationError => e
      # Authentication with Stripe's API failed
      # (maybe you changed API keys recently)
    rescue Stripe::APIConnectionError => e
      # Network communication with Stripe failed
    rescue Stripe::StripeError => e
      # Display a very generic error to the user, and maybe send
      # yourself an email
    rescue => e
      # Something else happened, completely unrelated to Stripe
    end
    if stripe != nil && e == nil
      redirect_to "#{stripe.url}"
    else
      redirect_to employees_path, alert: t('general_alerts.alert')
    end
  end

  def destroy
  end
end
