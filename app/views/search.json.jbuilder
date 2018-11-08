json.items do
  json.array!(@users) do |user|
    json.name user.first_name
  end
end
