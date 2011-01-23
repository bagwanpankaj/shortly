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

    class Lggd < Client

      self.register!

      class << self
        attr_accessor :apiKey
      end

      base_uri 'lg.gd'

      #shorts provided url by making call to is.gd api with given options.      
      def self.shorten(url, options = {})
        validate_uri!(url)
        options = {:apiKey => self.apiKey, :format => :json, :longUrl => url}.merge(options)
        validate!(options)
        response = get("/shorten", get_params(options))
        OpenStruct.new(response['results'][url])
      end
      
      private
      
      def self.validate!(options)
        raise NotAuthorizedError.new("Credentials required(apiKey)") unless 
          options.authenticable?(:apiKey)
      end

    end
  end
end