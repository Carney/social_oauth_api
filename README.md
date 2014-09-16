# SocialOauthApi

用于第三方登录后获取用户信息

提供给前后端分离的框架使用

只接受前端sdk传回来的第三方 **access_token** 参数及其它必须参数

支持第三方列表如下:

- 新浪微博
- QQ号登录
- 微信号登录

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
  provider_type: 'sinaweibo',
  access_token:  'xxxxxxxxx'
}

qq_config = {
  provider_type: 'qqdenglu',
  access_token:  'xxxxxxxx',
  client_id:     'xxxxxxxx'  # => 如果只需要user_id, 不需要用户信息可以不传 client_id 参数
}

weixin_config = {
  provider_type: 'weixin',
  access_token:  'xxxxxxxxx',
  openid:        'xxxxxxxx'
}

weibo = SocialOauthApi::User.new(weibo_config)
p weibo.id         # => weibo uid
p weibo.name       # => weibo screen_name
p weibo.image_url  # => weibo profile_image_url
p weibo.user_info

qq = SocialOauthApi::User.new(qq_config)
p qq.id         # => qq openid
p qq.name       # => qq nickname
p qq.image_url  # => qq figureurl
p qq.user_info

weixin = SocialOauthApi::User.new(weixin_config)
p weixin.id         # => weixin openid
p weixin.name       # => weixin nickname
p weixin.image_url  # => weixin headimgurl
p weixin.user_info
```

## Contributing

1. Fork it ( https://github.com/awesome-api/social_oauth_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
