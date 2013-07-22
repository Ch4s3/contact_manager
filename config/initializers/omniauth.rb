Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "Zx1Jlix0GDAZnTI85APLA" , "XYi93s5s0NVarFMMKBpNSFmH82NIeT134UOuyroFRwI"
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure }