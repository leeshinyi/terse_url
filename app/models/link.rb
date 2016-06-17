class Link < ActiveRecord::Base

  validates :address, presence: true, uniqueness:true
  validates :slug, uniqueness: true

  before_create :generate_slug

  def shorten_url
    ENV['BASE_URL'] + self.slug
  end

  private

    def generate_slug  
      self.slug = loop do
        random_slug = SecureRandom.urlsafe_base64(8)
        break random_slug unless self.class.where(slug: random_slug).exists?
      end
    end

end
