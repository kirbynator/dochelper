class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
  belongs_to :user
end
