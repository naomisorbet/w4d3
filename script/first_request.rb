require 'addressable/uri'
require 'rest-client'


url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/4.json'
).to_s

post_body = {
    'user[name]' => 'Elmo',
    'user[email]' => 'redandfurry@monsters.com'
  }

p RestClient.put(url, post_body)