class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs to :user

  field :tag
  field :check_in_at, type: Time
  field :check_out_at, type: Time

  field :cover_image_uid
  image_accessor :cover_image  

end