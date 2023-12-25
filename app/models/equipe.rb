class Equipe < ApplicationRecord
  has_many :mecanicos
  attribute :descricao, :string
end
