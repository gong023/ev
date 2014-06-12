Rails.application.config.middleware.use OmniAuth::Builder do
  if ! ENV['RAILS_ENV'].blank? && ENV['RAILS_ENV'] == 'production'
    provider :twitter, 'HOsdFThXCsI7EjVC6gRzgWDgd', 'fLOy5pLsIIzE40A7lS59N0fM7L7laJtmSXiJYW2ky4MN1AoJlE'
    provider :evernote, 'gogooooon', '29765c2ea14af3af'
    provider :hatena, '0/xho8PM2xdqdg==', 'AnK35xT6qTdue1S3sEVrVRgfQ9w='
    provider :github, 'f65420cf29ac413072df', '16fdc7632d3964208d960b5d60d3d8b26b73d467'
    provider :moves, 'BOHH3zU4vsUskeOpzW_402vn39a0hyzM', 'u5N8q_i75Q8xM7R5wVxfqEKpDF7YAOLvRzDewaXc_29J4GIJfZpyoXGYvazUw0Df'
  else
    provider :twitter, 'HOsdFThXCsI7EjVC6gRzgWDgd', 'fLOy5pLsIIzE40A7lS59N0fM7L7laJtmSXiJYW2ky4MN1AoJlE'
    provider :evernote, 'gogooooon', '29765c2ea14af3af'
    provider :hatena, '0/xho8PM2xdqdg==', 'AnK35xT6qTdue1S3sEVrVRgfQ9w='
    provider :github, 'f65420cf29ac413072df', '16fdc7632d3964208d960b5d60d3d8b26b73d467'
    provider :moves, 'BOHH3zU4vsUskeOpzW_402vn39a0hyzM', 'u5N8q_i75Q8xM7R5wVxfqEKpDF7YAOLvRzDewaXc_29J4GIJfZpyoXGYvazUw0Df'
#    面倒くさくなった
#    provider :twitter, 'FSNYrrAMMPScdfzOo5Ge5g', 'VRsbctmYjMVCJTX4HDPPZxNUlWXuIC6fOCeE5VjySbs'
#    provider :evernote, 'gogooooon', '29765c2ea14af3af',
#      client_options: { site: 'https://sandbox.evernote.com' }
#    provider :hatena, '+44PD+AIVzFE7A==', '1BJTt8WoOa64yy9eyC7ANkX45gI='
#    provider :github, 'f65420cf29ac413072df', '16fdc7632d3964208d960b5d60d3d8b26b73d467'
#    provider :moves, 'BOHH3zU4vsUskeOpzW_402vn39a0hyzM', 'u5N8q_i75Q8xM7R5wVxfqEKpDF7YAOLvRzDewaXc_29J4GIJfZpyoXGYvazUw0Df'
  end
end
