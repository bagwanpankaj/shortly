# Copyright (c) 2011 Bagwan Pankaj
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module Shortly
  
  module Clients
    
    class Snim < Client
      
      self.register!
      
      class << self
        #login = "<your login>"
        #apiKey = "<your apiKey>"
        attr_accessor :login, :apiKey
      end

      base_uri 'http://sn.im/site'
      
      #shorts provided url by making call to bitly api with given options.      
      def self.shorten(url, options = {})
        self.apiKey = '747253325af07d45caa32e52649d0077'
        self.login = 'modulo9'
        validate_uri!(url)
        options = {:snipapi => self.apiKey,:snipuser => self.login, :sniplink => url}.merge(options)
        validate!(options)
        response = post("/getsnip", post_params(options))
        OpenStruct.new(response["snip"].merge(:shortUrl => response["snip"]["id"]))
      end
      
      #expands provided url by making call to bitly api with given options.      
      def self.expand(short_url, options = {})
        analytics(short_url.gsub('http://sn.im/', ''), options)
      end
      
      #gets analytics
      def self.analytics(short_id, options = {})
        self.apiKey = '747253325af07d45caa32e52649d0077'
        self.login = 'modulo9'
        options = {:snipapi => self.apiKey,:snipuser => self.login, :snipid => short_id}.merge(options)
        validate!(options)
        response = post("/getsnipdetails", post_params(options))
        OpenStruct.new(response["snip"])
      end
      
      private
      
      def self.validate!(options)
        raise NotAuthorizedError.new("Credentials required(login and apiKey)") unless 
          options.authenticable?(:snipapi, :snipuser)
      end
          
    end
    
  end
end