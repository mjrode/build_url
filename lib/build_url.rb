#!/usr/bin/env ruby
require 'mail'
require_relative "../lib/build_url/compose"
require_relative "../lib/build_url/mailer"
require 'yaml'

def run
email = YAML::load(File.open('config.yml'))["email"]
check_email?(email)
prompt_user
params = build_params(gets.chomp)
Mailer.mail(params)
end

def check_email?(email)
  return puts "Please enter your email in `build_url/config.yml`" if email == "change-me"
  return puts "You need to enter a gmail email address." unless email.include?("@gmail")
end

def prompt_user
  puts "Please enter the second to last line of the build"
  puts "Example: `13:23:47 Publish artifacts to S3 Bucket bucket=mlzAndroid, file=084-5.3.1665-preproduction.apk`"
end

def build_params(build_details)
  url = Compose.build_url(build_details)
  subject = Compose.build_subject(build_details)
  params = {url: url, subject: subject}
end

run
