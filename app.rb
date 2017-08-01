require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end 

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do

end	

post '/visit' do
	require 'pony'

 	Pony.mail({
	:from => params[:name],
	    :to => ('sizoff.val@yandex.ru', @inform)

    
   end

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]
	@inform = params[:inform]
	# хеш
	hh = { 	:username => 'Введите имя',
			:phone => 'Введите телефон',
			:datetime => 'Введите дату и время' }

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	inform ="OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

	erb inform
end
