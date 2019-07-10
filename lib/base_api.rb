require 'httparty'
# Initialize the class
#
# @param host [String] localhost
# @param https [Boolean] https connection
# @return [BaseApi] new instance of base api class
module BaseAPI
  include HTTParty

  def initialize(host = 'localhost', https = false)
    @host = host
    http_party = self.class
    http_party.base_uri https ? "https//#{@host}" : "http://#{@host}"
    http_party.default_options.update(verify: false)
  end
end
