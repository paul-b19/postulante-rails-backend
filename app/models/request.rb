class Request < ApplicationRecord
  belongs_to :collection
  has_many :attribs
  has_many :bodies

end
