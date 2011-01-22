require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Shortly" do
  
  #tests for client googl
  describe "Googl" do
    before(:all) do
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
    end
    
    it "should get a short url from googl(provided valid url)" do
      res = Shortly::Clients::Googl.shorten(@long_url)
      res.short_url.should_not be_empty
      res.short_url.should == "http://goo.gl/17pbM"
    end
    
    it "result should be an instance of OpenStruct" do
      res = Shortly::Clients::Googl.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should not be added to history(by default)" do
      res = Shortly::Clients::Googl.shorten(@long_url)
      res.added_to_history.should be_an_instance_of(FalseClass)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        Shortly::Clients::Googl.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should raise MethodNotAvailableError if method is not implemented for" do
      lambda do
        Shortly::Clients::Googl.expand(@long_url)
      end.should raise_error(Shortly::Errors::MethodNotAvailableError)
    end
  end
  
  #tests for client isgd
  describe "Isgd" do
    before(:all) do
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
    end
    
    it "should get a short url from Is.gd(provided valid url)" do
      res = Shortly::Clients::Isgd.shorten(@long_url)
      res.shorturl.should_not be_empty
      # res.shorturl.should == "http://is.gd/KasWXL"
    end
    
    it "result should be an instance of OpenStruct" do
      res = Shortly::Clients::Isgd.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        Shortly::Clients::Isgd.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should raise MethodNotAvailableError if method is not implemented for" do
      lambda do
        Shortly::Clients::Isgd.expand(@long_url)
      end.should raise_error(Shortly::Errors::MethodNotAvailableError)
    end
  end
  
  #tests for client bitly
  describe "Bitly" do
    
    before(:all) do
      Shortly::Clients::Bitly.login = "modulo9"
      Shortly::Clients::Bitly.apiKey = "R_0f17f32f11de7e3e953de49c6f255104"
      @long_url = "http://bagwanpankaj.com"
      @invalid_url = "bagwanpankaj.com"
    end
    
    it "should get a short url from googl(provided valid url)" do
      res = Shortly::Clients::Bitly.shorten(@long_url)
      res.url.should_not be_empty
      res.url.should == "http://bit.ly/dUdiIJ"
    end
    
    it "result should be an instance of OpenStruct" do
      res = Shortly::Clients::Bitly.shorten(@long_url)
      res.should be_an_instance_of(OpenStruct)
    end
    
    it "should throw an error on wrong uri format" do
      lambda do
        Shortly::Clients::Bitly.shorten(@invalid_url)
      end.should raise_error(Shortly::Errors::InvalidURIError)
    end
    
    it "should expand a given short url" do
      res = Shortly::Clients::Bitly.expand("http://bit.ly/dUdiIJ")
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
