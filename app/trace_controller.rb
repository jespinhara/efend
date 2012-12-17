class TraceController < BaseController
	get '/' do
		erb :'trace/request'
	end

	post '/' do
		if IPAddress.valid? "#{params[:target_ip]}"
			@command_line = "/usr/bin/curl -i -X TRACE -H #{params[:target_param]} -k http://#{params[:target_ip]}"
    		@output_trace = IO.popen(@command_line).read
    		erb :'trace/response'
  		else
    		$stderr.puts ("Invalid IP #{params[:target_ip]}")
  		end
	end
end

