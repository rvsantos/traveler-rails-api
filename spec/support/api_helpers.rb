module ApiHelpers
  def json
    @json ||= JSON.parse(response.body, symbolize_names: true)
  end

  def create_category_api(category)
    post '/api/v1/category', params: { category: { name: category.name } }
  end

  def valid_headers
    {
      'Content-Type' => Mime[:json].to_s,
      'Accept' => 'application/vnd.traveler.v1'
    }
  end
end
