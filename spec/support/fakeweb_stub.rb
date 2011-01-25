module FakewebStub
  
  def mock_request_for(url, options = {})

    method  = options[:method] || :get
    fixture = options[:fixture] || "Fakeweb request body"
    content_type =  options[:content_type] || "application/json"
    body    = begin
      File.read(File.expand_path(File.dirname(__FILE__)) + "/../fixtures/#{fixture}.json")
    rescue Errno::ENOENT
      raise "Could not find fixture file named '#{fixture}'!"
    end
    
    FakeWeb.register_uri(method, url, :body => body, :status => ["200", "OK"], :content_type => content_type)
  end
end