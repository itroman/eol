require_relative 'eolife/version'
require_relative 'eolife/search'
require_relative 'eolife/ping'
require_relative 'eolife/pages'
require_relative 'eolife/collections'
require_relative 'eolife/data_objects'
require 'httparty'

module Eolife
  include HTTParty

  base_uri 'eol.org/api'

  def self.ping
    response = get('/ping/1.0.json')
    if response.code == 200
      Eolife::Ping.new(response["response"]["message"])
    else
      bad_response(response)
    end
  end

  def self.search(query, query_options = {})
    response = get("/search/#{query}.json", query: query_options)
    if response.code == 200
      response['results'].map { |item| Eolife::Search.new(item) }
    else
      bad_response(response)
    end
  end

  def self.pages(id, query_options = {})
    response = get("/pages/1.0.json?batch=false&id=#{id}", query: query_options)
    if response.code == 200
      Eolife::Pages.new(response)
    else
      bad_response(response)
    end
  end
  
  def self.collections(id, query_options = {})
    response = get("/collections/1.0/#{id}.json?", :query => query_options)
    if response.code == 200
      Eolife::Collections.new(response)
    else
      bad_response(response)
    end
  end

  def self.data_objects(id, query_options = {})
    response = get("/data_objects/1.0/#{id}.json?", :query => query_options)
    if response.code == 200
      Eolife::DataObjects.new(response)
    else
      bad_response(response)
    end
  end

  def self.bad_response(response)
    raise ResponseError, response if response.class == HTTParty::Response
    raise StandardError, 'Unknown error'
  end
  
end


# s = Eolife.search("tolumnia")
# puts s
# s.sort_by! { |x| x.id } # sorts so smallest id integer is first
# s.map { |x| puts x.id }
# puts s[0].id
# listing of all ids, in above ordering
# s.each { |x| puts x.link} #listing of all links, in above ordering
