class ShortLink < ApplicationRecord
  #URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  URL_REGEX = /\A(http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\Z/i

  after_create :generate_short_url
  before_create :sanitize

  validates_format_of :main_url, :with => URL_REGEX
  validates :main_url, :presence=>true, :uniqueness=>true

  def generate_short_url
    # generates short_url/slug for object using object id
    # expire_date of a object is created /renewed when user requests to create
    # new/existing short url
    # TODO: all short_links can be cleaned up based on expire date, so that
    # we can archive older short url request
    self.slug = id.to_s(36)
    self.expire_date = Date.today + 30.days
    self.save
  end

  def new_url?
    find_existing.nil?
  end

  def find_existing
    self.sanitize
    ShortLink.find_by(sanitize_url: self.sanitize_url)
  end

  def sanitize
    # sanitize user input url to avoid duplicate data in system
    if main_url.present?
      main_url.strip!
      url = self.main_url.downcase.gsub(/(https?\:\/\/)|www\./,'')
      self.sanitize_url = "http://" + url
    end
  end
end
