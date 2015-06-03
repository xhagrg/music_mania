class Song
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :extension, type: String
  field :play_count, type: Integer
end
