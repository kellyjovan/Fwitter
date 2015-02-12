require './config/environment'
require './app/models/tweet'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/tweet' do
    @tweets = Tweet.all_messages
    erb :tweet
  end

  post '/tweets' do
    new_tweet = Tweet.new(params[:user], params[:message])
    redirect '/tweet'
  end

end