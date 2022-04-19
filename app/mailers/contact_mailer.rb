class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @picture = contact

    mail to: @picture.email, subject: "お問い合わせの確認メール"
  end
end
