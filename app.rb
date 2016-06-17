require 'bundler'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './business'
require './environments'
require 'will_paginate'
require 'will_paginate/active_record'
require 'sinatra/link_header'

Bundler.require

BUSINESSES_PER_PAGE = 50

get "/businesses" do
  content_type :json

  page = params.fetch('page', 1)
  per_page = params.fetch('per_page', BUSINESSES_PER_PAGE)

  get_page(page, per_page)
end

get "/businesses/:id" do
  content_type :json

  params[:id].to_i.to_s == params[:id] ? get_business(params[:id]) : render_404_page
end

def get_business id
  b = Business.find(id.to_i)
  status 200
  b.to_json
rescue ActiveRecord::RecordNotFound
  status 404
  {"error": "No businesses with id: #{id} found"}.to_json
end

def get_page(page, per_page)
  businesses = Business.paginate(:page => page, :per_page => per_page)
  next_page = "/businesses?page=#{page.next}"
  status 200
  link next_page, :rel => :next
  businesses.to_json
rescue RangeError
  render_404_page
end

def render_404_page
  status 404
  {"error": "The page you requested does not exist"}.to_json
end
