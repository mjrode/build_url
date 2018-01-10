require 'pony'
require 'yaml'
require 'mail'
class Mailer
  def self.mail(url:, subject:)
    email = YAML::load(File.open('config.yml'))["email"]
    Pony.mail({
      :to => email,
      :subject => subject,
      :via => :smtp,
      :html_body            => url,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'michaelrode44',
        :password             => 'lhxryunelxdwjqir',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
    puts "\ngitEmail sent to #{email} with #{subject}: \n\n" 
  end
end
