class Swapi
  include ApplicationHelper

  attr_accessor :errors, :results
  BASE_URL = "https://swapi.co/api/"
  def initialize(type)
    @url = "#{BASE_URL}#{type}/"
    @type = type
    @results = []
    @retry = 0
    @errors = {}
  end

  def fetch
    return false unless valid?
    response = api_request(@url)

    if !response
      @retry += 1
      fetch
    elsif response["next"] != nil
      @results += response["results"].each { |result| result["id"] = get_id(@type, result["url"]) }
      @url = response["next"]

      fetch
    else
      @results += response["results"].each { |result| result["id"] = get_id(@type, result["url"]) }
    end

    @results
  end

  def relationships(id, options = {})
    url = "#{@url}#{id}/"
    response = api_request(url)
    array = []
    response[options[:key]].each { |link| array << get_id(options[:attr], link) }

    array
  end

  def valid?
    if @retry >= 5
      @errors["retry"] = "to many failed retries"
    end

    return @errors.count > 0 ? false : true
  end

  private

  # def parse_data(results)
  #   data = []
  #   results.each do |result|
  #     result["id"] = get_id(@type, result["url"])
  #     hash = result.select { |k,v| allowed_keys.include?(k) }
  #     data = load_model.new(hash)
  #     data.save
  #   end
  # end

  # def load_model
  #   if @type == 'people'
  #     model = "characters".singularize.camelize
  #   else
  #     model = @type.singularize.camelize
  #   end
  #   eval(model)
  # end

  # def allowed_keys
  #   keys = []
  #   load_model.new.attributes.each { |k,v| keys << k }

  #   keys
  # end
end