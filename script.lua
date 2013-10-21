local aliload = require('aliload')

function main(__epd, headers, _GET, _COOKIE, _POST)
	local app = aliload.app:new(__epd, headers, _GET, _COOKIE, _POST)
	--app._GLOBALS['config'] = config
	--app:set_route('GET', '/test/memcache', require('test').memcache)	
	--app:set_route('GET', '/test', require('test').index)
	--app:set_route('GET', '/404', require('errorpage').code404)

	app:get("/", function()
	  response:addHeader("CUSTOM", "HEADER")
	  return "Hello, World"-- .. config.db.host
	end)

	app:get("/h/:name", function()
	  return "Hello, " --.. params.name;
	end)

	app:get("/age/:age", function(age)
	  return "You are " .. tostring(age) .. " years old."
	end)

	app:run()

end
