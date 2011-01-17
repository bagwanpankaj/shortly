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
  
  class Client
    
    include HTTParty
    include Shortly::Errors
    include Shortly::Helper
    
    base_uri ''
    
    @@registered = []
    
    def self.method_missing(method_sym, *params)
      raise MethodNotAvailableError.new("Sorry, #{method_sym} method is not implemented/available for this service.")
    end
    
    protected
    
    def self.register!
      @@registered = [] unless @@registered
      @@registered << self.name.to_sym
    end
    
    def self.registered
      @@registered
    end
    
    def self.valid_uri?(url)
      !!(url =~ URI::regexp)
    end
    
  end
end