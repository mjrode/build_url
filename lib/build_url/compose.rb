require 'yaml'
require 'pry'

class Compose
  def self.build_url(build_details, config)
    base_url = config["base_url"]
    split_details = build_details.split(" ")[-2..-1]
    bucket = split_details.first.split("=").last.gsub(",","")
    version = split_details.last.split("=").last
    "#{base_url}#{bucket}/#{version}"
  end

  def self.build_subject(build_details)
    external_url = build_details.split(" ").last.split('-').first.split('=').last
    platform = build_details.include?("iPhone") ? "iPhone" : "Android"
    "#{platform} build for #{external_url}"
  end
end
