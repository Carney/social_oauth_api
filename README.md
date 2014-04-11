# SocialOauthApi

用于第三方登录后获取用户信息

提供给前后端分离的框架使用

只接受前端sdk传回来的第三方 **access_token** 参数

支持微博和qq登录

## Installation

Add this line to your application's Gemfile:

    gem 'social_oauth_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install social_oauth_api

## Usage
```ruby
require 'social_oauth_api'

weibo_config = {
  client_id: 'xxxxxx',
  access_token: 'xxxxxxxxxxx',
}

qq_config = {
  client_id: 'xxxxx',
  access_token: 'xxxxxxxxxxx'
}

weibo = SocialOauthApi::Weibo::User.new(weibo_config)
p weibo.id          # => weibo uid
p weibo.name       # => weibo screen_name
p weibo.image_url  # => weibo profile_image_url
p weibo.user_info

qq = SocialOauthApi::Qq::User.new(qq_config)
p qq.id         # => qq open_id
p qq.name       # => qq nickname
p qq.name       # => qq figureurl
p qq.user_info
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/social_oauth_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
