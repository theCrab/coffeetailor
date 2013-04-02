class WelcomeController < Spree::StoreController
  # before_filter :find_model
  respond_to :html
  layout 'application'
  
  def index
  end

end