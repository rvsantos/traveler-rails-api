class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  # check if routes specified a version or if is default
  def matches?(req)
    @default || req.headers['Accept']
                   .include?("application/vnd.traveler.v#{@version}")
  end
end
