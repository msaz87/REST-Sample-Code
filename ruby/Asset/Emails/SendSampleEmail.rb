require 'rest-client'
require 'json'

host = "CHANGE ME"
client_id = "CHANGE ME"
client_secret = "CHANGE ME"

def get_token(host, client_id, client_secret)
  url = "#{host}/identity/oauth/token?grant_type=client_credentials&client_id=#{client_id}&client_secret=#{client_secret}"
  response = RestClient.get url
  json = JSON.parse(response)
  return json["access_token"]
end

id = 1211 #id of email to send
params = {
  :access_token => get_token(host, client_id, client_secret),
  :emailAddress => "text@example.com", #email address to send to
  :textOnly => false, #option to send email as text only
  :leadId => 1 #id of lead to impersonate
}

response = RestClient.post "#{host}/rest/asset/v1/email/#{id}/sendSample.json", params

puts response