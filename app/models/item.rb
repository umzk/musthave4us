class Item < ActiveRecord::Base
  validates :title, :description,  presence: true
end
