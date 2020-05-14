# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def welcome_email
    admin = Struct.new(:email, :name).new('name@example.com', 'Test admin')
    AdminMailer.welcome_email(admin)
  end
end
