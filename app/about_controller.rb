class AboutController < BaseController
  get '/' do
    erb :'static_pages/about'
  end

end