class Rental < ApplicationRecord
    belongs_to :customer
    belongs_to :movie
    validates :movie_id, presence: true
    validates :customer_id, presence: true
    validates :due_date, presence: true
end

