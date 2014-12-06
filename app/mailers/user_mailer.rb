class UserMailer < ActionMailer::Base
  default from: "service@globaljobscope.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  # def confirm
  #   @greeting = "Hi, thanks for your confirmation!"

  #   mail to: "to@example.org"
  # end

  def new_comment(user, comment)
    @user = user
    @comment = comment

    mail(:to => user.email, :subject => "New Comment")
  end
end
