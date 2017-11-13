require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "7eaf81c8e2384e0f9b021058e3141882", "ed91711edce944549f3041499433f016", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end