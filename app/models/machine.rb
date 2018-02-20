class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snacks
  has_many :snacks, through: :machine_snacks
end
