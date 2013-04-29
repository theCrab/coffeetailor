module Spree
  class PaymentMethod::Gocardless < PaymentMethod
    preference :app_id, :string
    preference :app_secret, :string
    preference :token, :string
    preference :merchant_id, :string


    def actions
      %w{capture void}
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture?(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def provider_class
      ActiveMerchant::Billing::Gocardless
    end

    def source_required?
      true
    end

  end
end