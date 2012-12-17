class CipherController < BaseController
  get '/' do
		erb :'cipher/request'
	end

	post '/' do
		if IPAddress.valid? "#{params[:target_ip]}"
			@command_line = "/usr/bin/sslthing #{params[:target_ip]}:#{params[:target_port]} -v"
    		@output = IO.popen(@command_line).read

        h = Host.new
        h.name = params[:target_ip]
        h.created_at = Time.now
        h.result = @output
        h.save

    		erb :'cipher/response'
  		else
    		$stderr.puts ("Invalid IP #{params[:target_ip]}")
		end
	end
end

