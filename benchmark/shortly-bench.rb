# require 'rubygems'
require 'fakeweb'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'spec', 'support'))
require 'fakeweb_stub'
require 'bench_press'
require 'shortly'
include FakewebStub
FakeWeb.allow_net_connect = false

extend BenchPress

author 'Ghanshyam Rathod'
date '2011-01-26'

reps 1000

measure "Shortly-URL(Goo.gl)" do
  googl = Shortly::Clients::Googl
  uri = googl.base_uri + googl.send(:relative_path)
  mock_request_for(uri, :method => :post, :fixture => "googl_shorten")
  
  googl.shorten('http://bagwanpankaj.com').shortUrl
end

measure "Shortly-URL(Is.gd)" do
  isgd = Shortly::Clients::Isgd
  uri = isgd.base_uri
  mock_request_for(uri + "/create.php?url=#{CGI.escape('http://bagwanpankaj.com')}&format=json",
    :fixture => "isgd_shorten")
  
  isgd.shorten('http://bagwanpankaj.com').shorturl  
end

measure "Shortly-URL(V.gd)" do
  vgd = Shortly::Clients::Vgd
  uri = vgd.base_uri
  mock_request_for(uri + "/create.php?url=#{CGI.escape('http://bagwanpankaj.com')}&format=json", 
   :fixture => "vgd_shorten")
  
  vgd.shorten('http://bagwanpankaj.com').shorturl
end

measure "Shortly-URL(Tinyurl.com)" do
  uri = Shortly::Clients::Tinyurl.base_uri
  mock_request_for(uri + "/api-create.php", :method => :post,
   :fixture => "tinyurl_shorten", :content_type => "text/plain")
   
  tinyurl = Shortly::Clients::Tinyurl
  tinyurl.shorten('http://bagwanpankaj.com').shorturl
end