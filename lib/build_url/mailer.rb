require 'pony'
require 'yaml'
class Mailer
  def self.mail(generated_url)
    email = YAML::load(File.open('config.yml'))["email"]
    Pony.mail({
      :to => email,
      :via => :smtp,
      :html_body            => generated_url,
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
  end
end
