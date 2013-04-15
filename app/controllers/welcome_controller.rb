class WelcomeController < Spree::StoreController
  # before_filter :find_model
  respond_to :html
  layout 'application'

  def index
  end

  def about_us
    @title = 'About us'
  end

  def coffee_education
    @title = 'Coffee Education'
  end
end