local class = require 'aliload/30log'
local Request = class {}
Request.__name = "Request"


function Request:__init(epd, headers, get, cookie, post)
        self.method  	     = headers['method']
        self.uri             = headers['uri']
		self.params			 = {}

end

return Request
