class BillLine < ApplicationRecord
  belongs_to :dish
  belongs_to :bill
end
