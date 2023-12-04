class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable
end
