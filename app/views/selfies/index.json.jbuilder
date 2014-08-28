json.array!(@selfies) do |selfie|
  json.extract! selfie, :id
  json.url selfie_url(selfie, format: :json)
end
