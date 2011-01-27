require 'rubygems'
require 'bench_press'
require 'shortly'

extend BenchPress

author 'Ghanshyam Rathod'
date '2011-01-26'

reps 10

measure "Shortly-URL(Goo.gl)" do
  googl = Shortly::Clients::Googl
  googl.shorten('http://justatest.com').shortUrl
end

measure "Shortly-URL(Is.gd)" do
  isgd = Shortly::Clients::Isgd
  isgd.shorten('http://justatest.com').shorturl  
end

measure "Shortly-URL(V.gd)" do
  vgd = Shortly::Clients::Vgd
  vgd.shorten('http://justatest.com').shorturl
end

measure "Shortly-URL(Tinyurl.com)" do
  tinyurl = Shortly::Clients::Tinyurl
  tinyurl.shorten('http://justatest.com').shorturl
end