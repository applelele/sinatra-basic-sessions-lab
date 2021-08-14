require_relative 'config/environment'

class App < Sinatra::Base

    configure do
        enable :sessions # turns sessions on
        set :session_secret, 'secret' # an encryption key that  will be used to create a session_id.
    end

    get '/' do
        erb :index # display the form to enter an item
    end

    post '/checkout' do
        @item = params[:item] # set an instance variable to assign param data from the form (index)
        session[:item] = @item # add the param data from the form to the session hash
        @session = session # store the session hash in an instance variable that you can access in the views

        erb :checkout
    end
end