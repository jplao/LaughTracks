class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    erb :"comedians/index"
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  post '/comedians' do
    comedian = Comedian.create(params[:comedian])
    redirect "/comedians"
  end
end
