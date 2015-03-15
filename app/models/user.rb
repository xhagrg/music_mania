class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :middle_name, type: String
  field :admin, type: Boolean

  def full_name
    [first_name, middle_name, last_name].compact.map(&:humanize).join(' ')
  end
end
