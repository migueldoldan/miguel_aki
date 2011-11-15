class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def current_cart
    cart_id = session[:cart_id]
    if cart_id.nil?
        cart = Cart.create
      cart_id = cart.id
      session[:cart_id] = cart_id
    else
      cart = Cart.find(cart_id)
    end
    return cart
  end
end
