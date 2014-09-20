class User < ActiveRecord::Base
  has_one :favorite
end
