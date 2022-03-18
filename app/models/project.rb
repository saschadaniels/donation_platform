class Project < ApplicationRecord
  belongs_to :location
  has_many :items
end
