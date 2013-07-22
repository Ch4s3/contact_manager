def login_as(user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
      "provider" => 'twitter',
      "uid" => user.uid,
      "info" => {"name"=>user.name}
  }
  visit(login_path)
end
