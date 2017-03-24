class Bud < ApplicationRecord
  belongs_to :session
  has_many :locations
end
