class Link < ApplicationRecord
  validates_presence_of :url
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_uniqueness_of :short_url
  validates_length_of :url, within: 10..255, on: :create
  validates_length_of :short_url, within: 10..255, on: :create
end
