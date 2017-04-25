require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'recipe'
require_relative 'cookbook'
require_relative 'Letscookfrench'
set :bind, '0.0.0.0'

before do
  csv_file   = File.join(__dir__, 'recipes.csv')
  @cookbook   = Cookbook.new(csv_file)
end

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  erb :index
end

get '/list' do
  @recette = @cookbook.recipes
  erb :list
end


