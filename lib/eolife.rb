require_relative 'eolife/version'
require_relative 'eolife/search'
require_relative 'eolife/ping'
require_relative 'eolife/pages'
require_relative 'eolife/collections'
require_relative 'eolife/data_objects'
require_relative 'eolife/hierarchy_entries'
require_relative 'eolife/hierarchies'
require_relative 'eolife/provider_hierarchies'
require 'httparty'

module Eolife
  include HTTParty

  base_uri 'eol.org/api'

  def self.ping
    response = get('/ping/1.0.json')
    if response.code == 200
      Eolife::Ping.new(response['response']['message'])
    else
      bad_response(response)
    end
  end

  def self.search(query, query_options = {})
    response = get("/search/#{query}.json", query: query_options)
    if response.code == 200
      response['results'].map { |item| Eolife::Search.new(item) } # figure out pagination
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
    response = get("/collections/1.0/#{id}.json?", query: query_options)
    if response.code == 200
      Eolife::Collections.new(response)
    else
      bad_response(response)
    end
  end

  def self.data_objects(id, query_options = {})
    response = get("/data_objects/1.0/#{id}.json?", query: query_options)
    if response.code == 200
      Eolife::DataObjects.new(response)
    else
      bad_response(response)
    end
  end

  def self.hierarchy_entries(id, query_options = {})
    response = get("/hierarchy_entries/1.0/#{id}.json?", query: query_options)
    if response.code == 200
      Eolife::HierarchyEntries.new(response)
    else
      bad_response(response)
    end
  end

  def self.hierarchies(id, query_options = {})
    response = get("/hierarchies/1.0/#{id}.json?", query: query_options)
    if response.code == 200
      Eolife::Hierarchies.new(response)
    else
      bad_response(response)
    end
  end

  def self.provider_hierarchies
    response = get('/provider_hierarchies/1.0.json')
    if response.code == 200
      response.map { |item| Eolife::ProviderHierarchies.new(item) }
    else
      bad_response(response)
    end
  end

  def self.bad_response(response)
    raise ResponseError, response if response.class == HTTParty::Response
    raise StandardError, 'Unknown error'
  end
  
end
