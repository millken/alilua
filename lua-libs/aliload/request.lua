local class = require 'aliload/30log'
local Request = class {}
Request.__name = "Request"


function Request:__init(epd, headers, get, cookie, post)
        self.method  	     = headers['method']
        self.uri             = headers['uri']
		self.params			 = {}
		self._get 			 = get or {}
		self._cookie 		 = cookie or {}
		self._post			 = post	or {}

end

function Request:cookie(name)
	return self._cookie[name] or nil
end

function Request:get(name, filter, default)
	if not self._get[name] then
		return default or nil
	end
	return (filter and filter(self._get[name])) or self._get[name] 
end

function Request:post(name, filter, default)
	if not self._post[name] then
		return default or nil
	end
	return (filter and filter(self._post[name])) or self._post[name] 
end

return Request
