json.array!(@selfies) do |selfie|
  json.extract! selfie, :id
  json.url quest_selfie_url(@quest, selfie, format: :json)
end
