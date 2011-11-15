require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "total_amount == sum of the smarts prices" do
    htc = Smart.create(:name => 'htc1', :price => 10,
                        :description => "." * 20, :image_url => "htc.jpg")

    atrix = Smart.create(:name => 'atrix1', :price => 15,
                        :description => "." * 20, :image_url => "atrix.jpg")

    #Creamos carrito vacio
    cart = Cart.create

    #agregamos lineas al carrito
    cart.line_items << LineItem.create(:smart => htc, :cart => cart)
    cart.line_items << LineItem.create(:smart => atrix, :cart => cart)


    assert_equal(25, cart.total_amount)

  end
end
