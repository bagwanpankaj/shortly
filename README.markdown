# Shortly

A Ruby wrapper for various url shortener services

## Installation

create a dependency in your Gemfile
@gem 'shortly'@  then run
@bundle install@
and shortly will be up and running. or @gem install shortly@

## Uses

Currently Shortly supports three services (Bit.ly, Goo.gl, is.gd, tinyurl) Please do cross check by running Shortly.active_services. All supported methods have been provided for all services, so you can expect at least one method(shorten) will be available for every service.

*Bit.ly*

    bitly = Shortly::Clients::Bitly
    bitly.shorten('http://justatest.com', {:apiKey => 'R_your_api_key', :login => 'your_login'})

Optionally you can set apiKey and login beforehand (it would be more DRY i think if you only gonna use bitly services).

    bitly = Shortly::Clients::Bitly
    bitly.apiKey  = 'your_api_key'
    bitly.login   = 'your_login'
    bitly.shorten('http://justatest.com').url
    bitly.expand('http://bit.ly/imshort').long_url

*Goo.gl*

    googl = Shortly::Clients::Googl
    googl.shorten('http://justatest.com').shortUrl
    googl.expand('http://goo.gl/shrt').longUrl
    googl.analytics('http://goo.gl/shrt').analytics

*ShortSwitch* (Credit 'Steve Price (steveprice67)'. See Credits section)

    shortswitch = Shortly::Clients::ShortSwitch
    shortswitch.apiKey = '<api-key>'
    shortswitch.shorten('http://justatest.com').shortUrl

*Is.gd*

    isgd = Shortly::Clients::Isgd
    isgd.shorten('http://justatest.com').shorturl

*V.gd*

    vgd = Shortly::Clients::Vgd
    vgd.shorten('http://justatest.com').shorturl

*Tinyurl.com*

    tinyurl = Shortly::Clients::Tinyurl
    tinyurl.shorten('http://justatest.com').shorturl

*Sn.im*

    snim = Shortly::Clients::Snim
    snim.apiKey = "<apiKey>"
    snim.login = "<login>"
    snim.shorten(long_url).shortUrl
    snim.expand(url_id/shorturl).url

#### Command Line Utility

Shortly also provides command line utility. See some uses below.

    shortly 'http://shortme.com/'

By default it uses Googl to short urls but you can specify which service to use. Type @shortly -h@ for more info

    shortly 'http://shortme.com/' -s bitly -l '<your-login>' -p '<your-apiKey>' -m method-to-use

here are options and there possible values:

| *Options* | *What value do they take* |
| -s or --service | Service to use(e.g. bitly, isgd(default googl)) |
| -m or --method | Method to use(e.g. expand or shorten or analytics(default shorten)) |
| -l or --login | Login credential(required for bitly) |
| -p or --apiKey | API Key credentials (for bitly and googl(optional) only) |

##### Some more examples:

* Google analytics

    shortly 'http://averylong.url/that/can/frustate?you=many&times=true' -p my_api_key -m analytics

spits formatted json at CLI

* Bitly

    shortly 'http://bit.ly/shrt -s bitly -p my_api_key -l my_login -m expand

## Credits

* [Steve Price(steveprice67)](https://github.com/steveprice67) (For implementing Lggd service support)

## More Info

For detailed info visit my blog [http://BagwanPankaj.com](http://bagwanpankaj.com)

For more info write me at bagwanpankaj[at]gmail.com or me[at]bagwanpankaj.com

Copyright (c) 2010 Bagwan Pankaj: http://bagwanpankaj.com, released under the MIT license

## TODO's

* Better documentation
* Example series

## Contributing to shortly
 
* Fork, code, and then send me a pull request.

## Copyright

Copyright (c) 2010 [Bagwan Pankaj]. See LICENSE.txt for further details.