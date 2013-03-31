class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :tag
  field :check_in_at, type: Time
  field :check_out_at, type: Time

  field :image_uid
  image_accessor :image  

end