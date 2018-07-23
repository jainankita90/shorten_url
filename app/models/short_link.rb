class ShortLink < ApplicationRecord
  URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  after_create :generate_short_url
  before_create :sanitize

  validates_format_of :main_url, :with => URL_REGEX
  validates :main_url, :presence=>true, :uniqueness=>true

  def generate_short_url
    self.slug = id.to_s(36)
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
    if main_url.present?
      main_url.strip!
      url = self.main_url.downcase.gsub(/(https?\:\/\/)|www\./,'')
      self.sanitize_url = "http://" + url
    end
  end
end
