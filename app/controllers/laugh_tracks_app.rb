class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
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
