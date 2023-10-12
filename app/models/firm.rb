class Firm < ApplicationRecord
    has_many :persons
    belongs_to :user
end
