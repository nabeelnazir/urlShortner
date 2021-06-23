require "rails_helper"

RSpec.describe Url do
  it "is able to save short and long url if both the values provided" do
    url = Url.new(
      long_url: "https://www.food.ee/restaurants/vancouver/field-social-yaletown",
      short_url: "1234567"
    )
    expect(url.valid?).to be(true)
  end


  it "is not able to save if short url is not provided" do
    url = Url.new(
      long_url: "https://www.food.ee/restaurants/vancouver/field-social-yaletown"
    )
    expect(url.valid?).to be(false)
  end

  it "is not able to save if long url is not provided" do
    url = Url.new(
      short_url: "1234567"
    )
    expect(url.valid?).to be(false)
  end

  it "should not save the duplicate short_url" do
    url = Url.new(
      long_url: "https://www.food.ee/restaurants/vancouver/field-social-yaletown",
      short_url: "1234567"
    )
    url.save

    url2 = Url.new(
      long_url: "https://www.food.ee/restaurants/vancouver/field-social-yaletown",
      short_url: "1234567"
    )

    expect(url2.valid?).to be(false)
  end

  it "is invalid if the long url is not formatted properly" do
    url = Url.new(
      long_url: "blaze-gourmet-burgers",
      short_url: "1234567"
    )
    expect(url.valid?).to be(false)
  end

end