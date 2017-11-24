require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "7eaf81c8e2384e0f9b021058e3141882", "580dd6fcb0e747b8b6e4d38f9e0f782b", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end