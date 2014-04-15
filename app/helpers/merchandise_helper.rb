module MerchandiseHelper
  def sold(item)
    if item.sold
      "Sold"
    else 
      link_to "Buy", new_merchandise_purchase_path(item), class: "btn"
    end
  end
end
