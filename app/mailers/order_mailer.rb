class OrderMailer < ApplicationMailer

  def received order
    @order = order

    mail to: order.email, subject: t("mail.received")
  end

  def shipped order
    @order = order

    mail to: order.email, subject: t("mail.shipped")
  end

  def canceled order
    @order = order

    mail to: order.email, subject: t("mail.canceled")
  end
end
