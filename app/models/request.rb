class Request < ApplicationRecord
  belongs_to :collection
  has_many :attributes
  has_many :bodies

end
