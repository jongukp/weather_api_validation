require 'httparty'
# Initialize the class
#
# @param host [String] localhost
# @param port [String] port
# @param https [Boolean] https connection
# @return [UserApi] new instance of user class
module BaseAPI
  include HTTParty

  def initialize(host = 'localhost', https = false)
    @host = host
    http_party = self.class
    http_party.base_uri https ? "https//#{@host}" : "http://#{@host}"
    http_party.default_options.update(verify: false)
  end
end
