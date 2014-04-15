module MerchandiseHelper
  def sold(item)
    if item.sold
      "Sold"
    else 
      content_tag(:p, class: "buyer_options") do
        link_to("Contact Seller", new_merchandise_inquiry_path(item), class: "btn") + " " + link_to("Buy", new_merchandise_purchase_path(item), class: "btn")
      end
    end
  end
end
