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
    
    class Googl < Client
      
      self.register!
      class << self
        #apiKey = "<your apiKey>"
        attr_accessor :apiKey
      end
      
      base_uri 'https://www.googleapis.com'
      headers "Content-Type" => "application/json"
      
      #shorts provided url by making call to goo.gl api with given options.      
      def self.shorten(url, options = {})
        validate_uri!(url)
        response = post(relative_path_with_key(options), post_params({:longUrl => url}.to_json))
        OpenStruct.new(response.merge(:shortUrl => response["id"]))
      end
      
      def self.expand(url, options ={})
        validate_uri!(url)
        info(options.merge(:shortUrl => url))
      end
      
      def self.analytics(url, options ={})
        validate_uri!(url)
        info(options.merge(:shortUrl => url), true)
      end
      
      private
      
      def self.relative_path
        "/urlshortener/v1/url"
      end
      
      def self.relative_path_with_key(options)
        self.apiKey ? [relative_path, {:key => self.apiKey}.to_params].join("?") : relative_path
      end
      
      def self.info(options, full = false)
        options.merge!({:projection => 'FULL'}) if full
        options.merge!({:key => self.apiKey}) if !!self.apiKey
        response = get(relative_path, get_params(options))
        OpenStruct.new(response)
      end
      
    end
    
  end
  
end