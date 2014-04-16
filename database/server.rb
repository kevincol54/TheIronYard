require 'sinatra'
require 'mysql'
require 'shotgun'
require 'tux'
require 'data_mapper'
require 'dm-mysql-adapter'

DataMapper.setup(
  :default,
  'mysql://root@localhost/blog'  
)

class Post
  include DataMapper::Resource

  property :id, Serial
  property :blog_title, String
  property :blog_content, Text
end

DataMapper.finalize.auto_upgrade!

get '/' do 
  @blog = Post.all
  erb :root, layout: :index
end
 


get '/addpage' do
  
  erb :addpage, layout: :index
end

post '/addpage' do
  puts params
  @blog = Post.create params[:post]
  redirect '/'
end

get '/editpost/:id' do
  @post = Post.get params[:id]
  erb :editpage, layout: :index
end

put '/editpost/:id' do
  @post = Post.get params[:id]
  @post.update params[:post]
  redirect to('/')
end

delete '/deletepost/:id' do
  puts params
  @post = Post.get params[:id]
  @post.destroy
  redirect '/'
end
 


