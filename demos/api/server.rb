require 'rubygems'
require 'sinatra'
require 'geocoder/us/database'
require 'json'

set :bind, 'localhost'
set :port, 8080
set :environment, :production
set :logging, true
@@db = Geocoder::US::Database.new(ARGV[0] || "/home/sderle/geocoder/california.db")

get '/geocode.json' do
  if params[:q]
    (@@db.geocode params[:q]).to_json
  else
    status 400
    "parameter 'q' is missing"
  end
end

post "/geocode.json" do
  begin
    JSON.parse(request.body.read).map {|q| @@db.geocode q}.to_json
  rescue JSON::ParserError
    status 400
    "request body must be a list of strings encoded in JSON"
  end
end

get '/' do
  unless params[:q].nil?
    @records = @@db.geocode params[:q]
  end
  erb :index
end
