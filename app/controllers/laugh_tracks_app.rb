class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedians.all
    erb :"comedians/index"
  end
end
