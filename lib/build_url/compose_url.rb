require 'yaml'
require 'pry'

class ComposeUrl
  def self.build_url(build_details)
    base_url = YAML::load(File.open('config.yml'))["base_url"]
    split_details = build_details.split(" ")[-2..-1]
    bucket = split_details.first.split("=").last.gsub(",","")
    version = split_details.last.split("=").last
    "#{base_url}#{bucket}/#{version}"
  end
end
