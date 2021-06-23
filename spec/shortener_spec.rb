require "rails_helper"

RSpec.describe Shortener do
  it "generates a 7 character code to for a given URL" do
    url = 'https://www.food.ee/restaurants/vancouver/field-social-yaletown'
    shortener = Shortener.new(url)
    expect(shortener.getShortURL.length).to eq(7)
  end


  it "returns long url if provided short url" do
    url = 'https://www.food.ee/restaurants/vancouver/field-social-yaletown'
    shortener = Shortener.new(url)
    result = shortener.generateShortUrl
    expect(result.valid?).to be(true)
  end
end
