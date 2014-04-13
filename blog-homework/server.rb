require 'sinatra'



get '/' do 
  "main page"

  erb :index, layout: :index
end

  
get '/singleblog' do
  "singleblog"
  erb :singleblog
end

get '/editpost' do
  "editpost"
  erb :editpage
end

get '/addnewpost' do
  "addnewpost"

  erb :addpage
end
