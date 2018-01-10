#!/usr/bin/env ruby
require 'mail'
require 'yaml'
require_relative "../lib/build_url/compose"
require_relative "../lib/build_url/mailer"

def run
  email = YAML::load(File.open('config.yml'))["email"]
  return unless valid_email?(email)
  prompt_user
  params = build_params(gets.chomp)
  Mailer.mail(params)
end

def valid_email?(email)
  valid_email = true

  if email == "change_me"
    puts "Please enter your email in `build_url/config.yml`"
    valid_email = false
  elsif !email.include?("@gmail")
    puts "You need to enter a gmail email address."
    valid_email = false
  end
  valid_email
end

def prompt_user
  puts "\nPlease enter the second to last line of the build\n\n"
  puts "Example: `13:23:47 Publish artifacts to S3 Bucket bucket=mlzAndroid, file=084-5.3.1665-preproduction.apk`"
end

def build_params(build_details)
  url = Compose.build_url(build_details)
  subject = Compose.build_subject(build_details)
  params = {url: url, subject: subject}
end

run
