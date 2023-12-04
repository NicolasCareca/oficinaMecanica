json.extract! peca, :id, :nome, :quantidade, :preco, :created_at, :updated_at
json.url peca_url(peca, format: :json)
