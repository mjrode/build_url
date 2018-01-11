require 'pony'
require 'yaml'
require 'mail'
class Mailer
  def self.mail(url:, subject:, config:)
    Pony.mail({
      :to => config['email'],
      :subject => subject,
      :via => :smtp,
      :html_body            => url,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => config['gmail_username'],
        :password             => config['password'],
        :authentication       => :plain,
        :domain               => "localhost.localdomain"
      }
    })
    puts "\n Email sent to #{config['email']} with #{subject}: \n\n"
  end
end
