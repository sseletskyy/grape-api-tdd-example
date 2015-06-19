module GrapeHelper
  def success(data = nil, flag = true)
    response = {success: flag}
    response[:data] = data unless data.nil?
    response
  end

  def error(*args)
    options = args.extract_options!
    error!(options, options[:status_code] || 400)
  end

  def api_not_found
    error({status_code: 404, error_code: 4001, details: 'Object not found'})
  end
end