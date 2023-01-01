class Link < ApplicationRecord
  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, :too_long => "too long", :too_short => "too short"
  validates_length_of :slug, within: 3..255, on: :create, :too_long => "too long", :too_short => "too short"
  before_validation :generate_slug

  def generate_slug
    unless self.slug.present?
      self.slug = SecureRandom.uuid[0..5] 
    end
  end

  def shortened_url
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end

  def self.shorten(url, slug = '')
    link = Link.where(url: url, slug: slug).first
    
    # add two random characters when slug is taken
    if link
      Link.shorten(url, "#{slug + SecureRandom.uuid[0..2]}")
    end
      
    link = Link.new(url: url, slug: slug)
    link.valid?

    return link if link.errors.messages.present?
    
    return link.shortened_url if link.save
  end
end
