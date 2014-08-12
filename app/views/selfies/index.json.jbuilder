json.array!(@selfies) do |selfy|
  json.extract! selfy, :id
  json.url selfy_url(selfy, format: :json)
end
