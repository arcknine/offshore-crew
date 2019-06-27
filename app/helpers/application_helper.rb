module ApplicationHelper
  def api_request(url)
    # url += "#{options[:id]}/" unless options[:id].nil?
    # url += "?search=#{options[:keyword]}" unless options[:keyword].nil?

    resp = HTTParty.get url
    
    return false if resp.code != 200
    
    resp.parsed_response
  end

  def get_list(list, type)
    results = []
    list.each do |item|
      id  = item.match(/#{type}\/([0-9]+)\//)[1]
      results << api_request(type, id: id)
    end; nil

    results
  end

  def get_id(type, str)
    str.match(/#{type}\/([0-9]+)\//)[1]
  end

  def allowed_keys(model)
    model.new.attributes.keys
  end
end
