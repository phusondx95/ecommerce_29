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
end
