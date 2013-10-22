local aliload = require('aliload')

local cjson = require('cjson')
md5 = function(s) return crypto.evp.digest('md5', s) end
function string:trim() return self:gsub('^%s*(.-)%s*$', '%1') end
function trim(s) return s:trim() end
function string:startsWith(s, i) return _G['string-utils'].startsWith(self, s, i) end
function string:endsWith(s, i) return _G['string-utils'].endsWith(self, s, i) end
explode = _G['string-utils'].explode
implode = table.concat
escape = _G['string-utils'].escape
escape_uri = _G['string-utils'].escape_uri
unescape_uri = _G['string-utils'].unescape_uri
base64_encode = _G['string-utils'].base64_encode
base64_decode = _G['string-utils'].base64_decode
strip = _G['string-utils'].strip
iconv = _G['string-utils'].iconv
iconv_strlen = _G['string-utils'].iconv_strlen
iconv_substr = _G['string-utils'].iconv_substr
json_encode = cjson.encode
json_decode = cjson.decode
function printf(s, ...) print(s:format(...)) end
function sprintf(s, ...) return (s:format(...)) end

function main(__epd, headers, _GET, _COOKIE, _POST)
	local app = aliload.app:new(__epd, headers, _GET, _COOKIE, _POST)
	
	--app:set_route('GET', '/test/memcache', require('test').memcache)	
	app:set_route('GET', '/test', require('test').index)
	--app:set_route('GET', '/404', require('errorpage').code404)

	app:all("/", function()
	  response:addHeader("CUSTOM", "HEADER")
	  response:setCookie("ab","c")
	  return "Hello, World" .. base64_encode("aaal.com") .. (request:cookie("abd") or '') .. request:get('arg1', trim, '') .. '--' .. request:post('bb', trim, '') 
	end)

	app:get("/h/:name", function()
	  return "Hello, " --.. params.name;
	end)

	app:get("/age/:age", function(age)
	  return "You are " .. tostring(age) .. " years old."
	end)

	app:run()

end
