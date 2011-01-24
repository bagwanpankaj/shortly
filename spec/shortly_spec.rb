require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Shortly" do
  
  #tests for client googl
  describe "Googl" do
    before(:all) do
      @long_url = "http://bagwanpankaj.com/"
      @invalid_url = "bagwanpankaj.com"
      @short_url = "http://goo.gl/17pbM"
      @googl = Shortly::Clients::Googl
    end
    
    it "should get a short url from googl(provided valid url)" do
      res = @googl.shorten(@long_url)
      res.shortUrl.should_not be_empty
      res.shortUrl.should == @short_url
    end
    
    it "result of shorten should be an instance of OpenStruct" do
      res = @googl.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should get a long url back for given valid short url" do
      res = @googl.expand(@short_url)
      res.longUrl.should_not be_empty
      res.longUrl.should == @long_url
    end
    
    it "result of expand should be an instance of OpenStruct" do
      res = @googl.expand(@short_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should give analytics for given short url" do
      res = @googl.analytics(@short_url)
      res.analytics.should_not be_empty
      res.analytics.should be_an_instance_of(Hash)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        @googl.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
  end
  
  #tests for client isgd
  describe "Isgd" do
    before(:all) do
      @isgd = Shortly::Clients::Isgd
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
    end
    
    it "should get a short url from Is.gd(provided valid url)" do
      res = @isgd.shorten(@long_url)
      res.shorturl.should_not be_empty
      res.shorturl.should == @isgd.shorten(@long_url).shorturl
    end
    
    it "result should be an instance of OpenStruct" do
      res = @isgd.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        @isgd.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should raise MethodNotAvailableError if method is not implemented for" do
      lambda do
        @isgd.expand(@long_url)
      end.should raise_error(Shortly::Errors::MethodNotAvailableError)
    end
  end
  
  #tests for client vgd
   describe "Vgd" do
     before(:all) do
       @vgd = Shortly::Clients::Vgd
       @long_url = "http://bagwanpankaj.com"
       @invalid_url = "bagwanpankaj.com"
     end

     it "should get a short url from Is.gd(provided valid url)" do
       res = @vgd.shorten(@long_url)
       res.shorturl.should_not be_empty
       res.shorturl.should == @vgd.shorten(@long_url).shorturl
     end

     it "result should be an instance of OpenStruct" do
       res = @vgd.shorten(@long_url)
       res.should be_an_instance_of(OpenStruct)
     end

     it "should throw an error on wrong uri format" do
       lambda do
         @vgd.shorten(@invalid_url)
       end.should raise_error(Shortly::Errors::InvalidURIError)
     end

     it "should raise MethodNotAvailableError if method is not implemented for" do
       lambda do
         @vgd.expand(@long_url)
       end.should raise_error(Shortly::Errors::MethodNotAvailableError)
     end
   end
  
  #tests for client bitly
  describe "Bitly" do
    
    before(:all) do
      @bitly = Shortly::Clients::Bitly
      @bitly.login = "modulo9"
      @bitly.apiKey = "R_0f17f32f11de7e3e953de49c6f255104"
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
      @short_url = "http://bit.ly/dUdiIJ"
    end
    
    it "should get a short url from googl(provided valid url)" do
      res = @bitly.shorten(@long_url)
      res.url.should_not be_empty
      res.url.should == @short_url
    end
    
    it "result should be an instance of OpenStruct" do
      res = @bitly.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        @bitly.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should expand a given short url" do
      res = @bitly.expand("http://bit.ly/dUdiIJ")
      res.long_url.should == @long_url
    end
    
  end
  
  #tests for client jmp
  describe "Jmp" do
    
    before(:all) do
      @jmp = Shortly::Clients::Jmp
      @jmp.login = "modulo9"
      @jmp.apiKey = "R_0f17f32f11de7e3e953de49c6f255104"
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
      @short_url = "http://j.mp/dUdiIJ"
    end
    
    it "should get a short url from googl(provided valid url)" do
      res = @jmp.shorten(@long_url)
      res.url.should_not be_empty
      res.url.should == @short_url
    end
    
    it "result should be an instance of OpenStruct" do
      res = @jmp.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        @jmp.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should expand a given short url" do
      res = @jmp.expand("http://bit.ly/dUdiIJ")
      res.long_url.should == @long_url
    end
    
  end
  
  #tests for client tinyurl
  describe "TinyUrl" do
    before(:all) do
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
    end
    
    it "should get a short url from TinyUrl(provided valid url)" do
      res = Shortly::Clients::Tinyurl.shorten(@long_url)
      res.shorturl.should_not be_empty
      res.shorturl.should == "http://tinyurl.com/6jt3pjr"
    end
    
    it "result should be an instance of OpenStruct" do
      res = Shortly::Clients::Tinyurl.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        Shortly::Clients::Tinyurl.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should raise MethodNotAvailableError if method is not implemented for" do
      lambda do
        Shortly::Clients::Tinyurl.expand(@long_url)
      end.should raise_error(Shortly::Errors::MethodNotAvailableError)
    end
  end
  
  #tests for client lg.gd
  describe "Lggd" do
    
    before(:all) do
      Shortly::Clients::Lggd.apiKey = "87171b48ff5487f8817021667298e059081d7cc0"
      @long_url = "http://google.com"
      @invalid_url = "bagwanpankaj.com"
      @short_url = "http://demo.shortswitch.com/1"
    end
    
    it "should get a short url from lg.gd(provided valid url)" do
      res = Shortly::Clients::Lggd.shorten(@long_url)
      res.shortUrl.should_not be_empty
      res.shortUrl.should == @short_url
    end
    
    it "result should be an instance of OpenStruct" do
      res = Shortly::Clients::Lggd.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        Shortly::Clients::Lggd.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
  end
  
  describe "Client" do
    
    before(:all) do
      @valid_uri = "http://bagwanpankaj.com"
      @invalid_uri = "someinveliduri" 
    end
    
    it "should include HTTParty" do
      Shortly::Client.included_modules.should include HTTParty
    end
    
    it "should include Shortly::Errors" do
      Shortly::Client.included_modules.should include Shortly::Errors
    end
    
    it "should include Shortly::Helper" do
      Shortly::Client.included_modules.should include Shortly::Helper
    end
    
    it "should respond to resitered class variable" do
      Shortly::Client.class_variables.should include "@@registered"
    end
    
    it "should respond to register/valid_uri? and registered methods" do
      Shortly::Client.should respond_to :register!
      Shortly::Client.should respond_to :registered
      Shortly::Client.should respond_to :valid_uri?
    end
    
    it "should test a uri is valid or not" do
      Shortly::Client.valid_uri?(@valid_uri).should be true
      Shortly::Client.valid_uri?(@invalid_uri).should_not be true
    end
    
  end
  
  describe "Misc" do
    
    describe "Errors" do
      
      it "should have various error classes implemented" do
        Shortly::Errors::ShortlyError.superclass.name.should == "StandardError"
        Shortly::Errors::ShortlyArgumentError.superclass.name.should == "ArgumentError"
        Shortly::Errors::InvalidURIError.superclass.name.should == "Shortly::Errors::ShortlyError"
        Shortly::Errors::NotAuthorizedError.superclass.name.should == "Shortly::Errors::ShortlyArgumentError"
        Shortly::Errors::MethodNotAvailableError.superclass.name.should == "Shortly::Errors::ShortlyError"
      end
      
    end
    
    describe "Shortly" do
      it "should return current version of gem" do
        Shortly.version.should == File.read(File.join(File.dirname(__FILE__), '..', 'VERSION'))
      end
      
      it "should return all registered services" do
        Shortly.active_services.should == Shortly::Client.registered
      end
      
    end
  end
  
end
