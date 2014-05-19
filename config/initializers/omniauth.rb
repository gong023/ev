Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'FSNYrrAMMPScdfzOo5Ge5g', 'VRsbctmYjMVCJTX4HDPPZxNUlWXuIC6fOCeE5VjySbs'

  provider :evernote, 'gogooooon', '29765c2ea14af3af',
           client_options: { site: 'https://sandbox.evernote.com' }

  provider :hatena, '+44PD+AIVzFE7A==', '1BJTt8WoOa64yy9eyC7ANkX45gI='

  provider :github, 'f65420cf29ac413072df', '16fdc7632d3964208d960b5d60d3d8b26b73d467'
end