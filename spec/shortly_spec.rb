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
      res.shorturl.should == "http://is.gd/KasWXL"
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
  
end
