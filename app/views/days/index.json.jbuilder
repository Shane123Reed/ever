json.array!(@days) do |day|
  json.extract! day, :id, :question1, :question2, :question3, :image
  json.url day_url(day, format: :json)
end
