json.array! @links do |link|
  json.extract! link, :id, :url, :short_url, :clicked
end
