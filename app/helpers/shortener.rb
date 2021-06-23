class Shortener

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def getShortURL
    code = ''
    unless Url.exists?(long_url: url)
      code = SecureRandom.uuid[0..6];
    end
    code
  end

  def generateShortUrl
    # If Long url exists do not create a duplicate of it.
    if(getShortURL == '')
      @found_url = Url.find_by(long_url: url)
      @found_url.errors[:base] << "Long URL Already Exists!"
      return @found_url
    end
    Url.create(long_url: url, short_url: getShortURL)
  end
end 