class Link < ApplicationRecord
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :url, presence: true, length: { minimum: 15 }

  def generate_short_url
    rand(36**8).to_s(36)
  end
end
