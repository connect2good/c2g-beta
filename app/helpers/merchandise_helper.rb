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

  def delete_item_button(item)
    if item.individual_id == current_individual.id
      content_tag(:p, class: "seller_options") do
        link_to 'Delete Merchandise', @merchandise, :method => :delete, :data => { :confirm => 'Are you sure?' }, class: "btn"
    end
  end
end
