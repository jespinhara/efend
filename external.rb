require 'sinatra'
require 'ipaddress'
include ERB::Util

get '/' do
  erb :index_page
end

get '/cipher' do
  erb :request_page
end

post '/cipher' do
  if IPAddress.valid? "#{params[:target_ip]}"
    @command_line = "./sslthing #{params[:target_ip]}:#{params[:target_port]} -v"
    @output = IO.popen(@command_line).read
    erb :result_page
  else
    $stderr.puts ("Invalid IP #{params[:target_ip]}")
  end
end

get '/trace' do
  erb :request_page_trace
end

post '/trace' do
  if IPAddress.valid? "#{params[:target_ip]}"
    @command_line = "/usr/bin/curl -i -X TRACE -H #{params[:target_param]} -k http://#{params[:target_ip]}"
    @output_trace = IO.popen(@command_line).read
    erb :result_page_trace
  else
    $stderr.puts ("Invalid IP #{params[:target_ip]}")
  end
end

__END__

@@ layout
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>External Pentest Frontend</title>
</head>
<body>
  <h1>External Pentest Verifications</h1>
  <%= yield %>
</body>
</html>

@@ request_page
<form method="post">
  <fieldset>
    <legend>External Cipher Verification</legend>
    <label for="target_ip">Target IP:</label>
    <input type="text" name="target_ip" id="target_ip"/><br/>
    <label for="target_port">Target Port:</label>
    <input type="text" name="target_port" id="target_port"/><br/>
    <input type="submit" value="Execute"/>
  </fieldset>
</form>
<br/>
<a href="/">Back to Home</a>

@@ result_page
<h3>Command line: <%= html_escape @command_line %></h3>
<textarea cols="80" rows="30">
  <%= html_escape @output %>
</textarea>
<br/>
<a href="/">Back to Home</a>

@@ request_page_trace
<form method="post">
  <fieldset>
    <legend>Trace Verification</legend>
    <label for="target_ip">Target IP:</label>
    <input type="text" name="target_ip" id="target_ip"/><br/>
    <label for="target_param">Trace Parameter:</label>
    <input type="text" name="target_param" id="target_param"/><br/>
    <input type="submit" value="Execute"/>
  </fieldset>
</form>
<br/>
<a href="/">Back to Home</a>

@@ result_page_trace
<h3>Command line: <%= html_escape @command_line %></h3>
<textarea cols="80" rows="30">
  <%= html_escape @output_trace %>
</textarea>
<br/>
<a href="/">Back to Home</a>

@@ index_page
<a href="/cipher">Check Weak Ciphers</a><br/>
<a href="/trace">Check Trace</a><br/>