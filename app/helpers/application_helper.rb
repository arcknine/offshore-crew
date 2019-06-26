module ApplicationHelper
  def api_request(type, options = {})
    url = "https://swapi.co/api/#{type}/"
    url += "#{options[:id]}/" unless options[:id].nil?
    url += "?search=#{options[:keyword]}" unless options[:keyword].nil?

    resp = HTTParty.get url
    
    return false if resp.code != 200
    
    resp.parsed_response
  end
end
