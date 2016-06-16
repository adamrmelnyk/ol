require 'bundler'
require 'csv'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

Bundler.require

get "/businesses" do
  content_type :json

  if params.has_key?('page')
    get_page params['page'].to_i
  else
    get_page 1
  end
end

get "/businesses/:id" do
  content_type :json
  get_business params[:id]
end

def get_business id
  {"businesses": id}.to_json
end

def get_page page
  {"page": page}.to_json
end
