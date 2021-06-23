class Url < ApplicationRecord
  validates_presence_of :short_url, :long_url
  validates_uniqueness_of :short_url
  validate :long_url_format
  
  def long_url_format
    uri = URI.parse(long_url || "")
    if uri.host.nil?
      errors.add(:long_url, "Invalid URL format")
    end
  end 

  def shortened_url
    #"https://tinyurl-foodee.herokuapp.com/#{short_url}"
    "https://localhost:3000/#{short_url}"
  end
  
end


