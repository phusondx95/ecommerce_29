module CartOrder

  def add_product product, cart
    current_item  = cart.line_items.find_by product_id: product.id
    if current_item
      current_item.quantity += 1
    else
      current_item = cart.line_items.build product_id: product.id
    end
    current_item
  end

  def total_price item
    item.price * item.quantity
  end

  private

  def set_cart
    @cart = Cart.find_by id: session[:cart_id]
    return if @cart
    @cart = Cart.create user_id: current_user.id
    session[:cart_id] = @cart.id
  end

  def check_cart_status
    if @cart.line_items.empty?
      flash[:danger] = t "carts.empty"
      redirect_to products_path
    end
  end
end
