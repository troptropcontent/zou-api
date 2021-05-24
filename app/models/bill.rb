class Bill < ApplicationRecord
	has_many :bill_lines, dependent: :destroy
	has_many :payments
end
