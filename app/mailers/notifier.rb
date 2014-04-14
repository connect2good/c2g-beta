class Notifier < ActionMailer::Base
  default from: "connect2good.mailer@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.offer_received.subject
  #

  def offer_received(offer)

    data = File.read("#{Rails.root}/app/assets/images/c2g-homepage.png")
    attachments.inline['logo.png'] = data

    @offer = offer

    if offer.name != "anonymous"
      @text = "named " + @offer.name
    else
      @text = "who wishes to remain anonymous"
    end

    mail( to: "#{@offer.organization.email}",
          subject: "Connect 2 Good Donation Offer")
  end

  def offer_sent(offer)

    data = File.read("#{Rails.root}/app/assets/images/c2g-homepage.png")
    attachments.inline['logo.png'] = data

    @offer = offer

    mail( to: "#{@offer.email}",
          subject: "Connect 2 Good Offer!")
  end

  def contact_seller(inquiry)

    data = File.read("#{Rails.root}/app/assets/images/c2g-homepage.png")

    @inquiry = inquiry

    mail( to: "#{Merchandise.find(@inquiry.merchandise_id).seller.email}",
          subject: "Connect 2 Good Marketplace: Question from a Potential Buyer")
  end

  def buyer_confirmation(purchase)

    @purchase = purchase

    mail( to: "#{Individual.find(@purchase.buyer_id).email}",
          subject: "Connect 2 Good Marketplace: Your Purchase Confirmation")

  end

  def seller_confirmation(purchase)

    @purchase = purchase

    mail( to: "#{Merchandise.find(@purchase.merchandise_id).seller.email}",
          subject: "Connect 2 Good Marketplace: Your Item on Connect 2 Good has been sold")
  end
end
