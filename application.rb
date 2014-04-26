require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: { list_of_cats: DB[:cats].to_a } # locals are available in the route we defined
  end

  get '/cats/new' do
    erb :new
  end

  post '/cats' do
    p params
    DB[:cats].insert(:name => params[:name], :color => params[:color], :kittens => params[:kittens])
    redirect '/'
  end
end