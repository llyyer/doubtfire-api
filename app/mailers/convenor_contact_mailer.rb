class ConvenorContactMailer < ActionMailer::Base
  def request_project_membership(user, convenor, unit, first_name, last_name)
    institution_email_domain = Doubtfire::Application.config.institution[:domain]
    admin_emails = User.admins.map(&:email)
    user_email = "#{user.username}@#{institution_email_domain}"
    mail to: admin_emails,
         from: user_email,
         subject: "[Doubtfire] Please add #{user.username} to #{unit.name}",
         body: "The following user wishes to be added to #{unit.name} on " \
               "Doubtfire:\n\nUsername: #{user.username}\nEmail: #{user_email}\n" \
               "Name: #{user.name}"
  end
end
