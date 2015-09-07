json.id user.id
json.full_name user.full_name
json.songs do
  json.array! songs do |song|
    json.id song.id.to_s
    json.name song.name
    json.url song.url
    json.extension song.extension
  end
end if songs.present?
