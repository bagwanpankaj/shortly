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
    
    class Bitly < Client
      
      self.register!
      
      class << self
        #apiKey = "<your apiKey>"
        #login = "<your login>"
        attr_accessor :login, :apiKey
      end

      base_uri 'api.bit.ly'
      
      #shorts provided url by making call to bitly api with given options.      
      def self.shorten(url, options = {})
        raise InvalidURIError.new("provided URI is invalid.") unless valid_uri?(url)
        options = {:login => self.login, :apiKey => self.apiKey, :longUrl => url, :format => "json"}.merge(options) 
        response = get("/v3/shorten", {:query => options})
        OpenStruct.new(response["data"])
      end
      
      #expands provided url by making call to bitly api with given options.      
      def self.expand(short_url, options ={})
        raise InvalidURIError.new("provided URI is invalid.") unless valid_uri?(short_url)
        options = {:login => self.login, :apiKey => self.apiKey, :shortUrl => short_url, :format => "json"}.merge(options) 
        response = get("/v3/expand", {:query => options})
        OpenStruct.new(response["data"]["expand"].first)
      end
      
      #validates given login(as x_login) and apiKey (as x_api_key)
      #options = {:x_login => xlogin, :x_api_key => x_api_key, :apiKey => apiKey, :login => login, :format => "json"}
      def self.validate(options = {})
        response = get("/v3/validate", {:query => options})
        OpenStruct.new(response["data"])
      end
          
    end
    
  end
end