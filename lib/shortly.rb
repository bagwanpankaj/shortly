require 'uri'
require 'ostruct'
require 'httparty'
require 'shortly'
require 'shortly/helper'
require 'shortly/errors'
require 'shortly/client'
require 'shortly/clients/bitly'
require 'shortly/clients/googl'
require 'shortly/clients/isgd'
require 'shortly/clients/lggd'
require 'shortly/clients/tinyurl'

module Shortly
  
  def self.version
    File.read(File.join(File.dirname(__FILE__), '..', 'VERSION'))
  end
  
  def self.active_services
    Client.registered
  end
  
end