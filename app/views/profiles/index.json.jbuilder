json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :paperclip_image_id, :firstname, :lastname, :apt
  json.url profile_url(profile, format: :json)
end
