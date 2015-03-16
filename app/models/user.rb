class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :middle_name, type: String
  field :nick_name, type: String
  field :admin, type: Boolean

  def id
    _id.to_s
  end

  def full_name
    [first_name, middle_name, last_name].compact.map(&:humanize).join(' ')
  end
end
