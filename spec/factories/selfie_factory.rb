FactoryGirl.define do
  factory :selfie do
    image_file_name "Picture.png"
    image_content_type "image/png"
    image_file_size 62059
    image_updated_at DateTime.now
    quest
  end
end
