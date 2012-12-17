class IkeController < BaseController
  get '/' do
    erb :'ike/request'
  end

  post '/' do
    if IPAddress.valid? "#{params[:target_ip]}"
      @command_line = "/usr/local/bin/ike-scan #{params[:target_param]} --pskcrack=#{params[:target_ip]}.psk #{params[:target_port]}"
      @output_ike = IO.popen(@command_line).read
      erb :'ike/response'
    else
      $stderr.puts ("Invalid IP #{params[:target_ip]}")
    end
  end
end

