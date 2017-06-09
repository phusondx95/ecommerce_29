module ProductLib

  def products_search search
    if search
      Product.where("title || description || price LIKE ?", "%#{search}%")
    else
      Product.valid_products
    end
  end

  def filter_products filter
    case filter
    when t("filter.all")
      Product.valid_products
    when t("filter.hot")
      Product.valid_products.most_sold
    when t("filter.most_viewed")
      Product.valid_products.most_viewed
    when t("filter.rating")
      Product.valid_products.rating
    when t("filter.oldest")
      Product.valid_products.order_oldest
    when t("filter.newest")
      Product.valid_products.order_newest
    when t("filter.alph")
      Product.valid_products.alphabet
    when t("filter.price_high_to_low")
      Product.valid_products.price_high_to_low
    when t("filter.price_low_to_high")
      Product.valid_products.price_low_to_high
    end
  end

  def impression_count product
    product.impressions.size
  end

  def unique_impression_count product
    product.impressions.group(:ip_address).size.keys.length
  end

  def rating product
    if !product.average("rating").nil?
      product.update_attribute :ratings, product.average("rating").avg
    end
    product.ratings
  end

  def sold_units_of_product order
    order.line_items.each do |item|
      sold_units = item.product.sold_units
      sold_units += item.quantity
      item.product.update_attribute :sold_units, sold_units
    end
  end
end
