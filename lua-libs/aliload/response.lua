local class = require 'aliload/30log'
local _ = require("aliload/underscore")
local table = table
local Response = class {}
Response.__name = "Response"

local function parse_arguments(args)
  if _.isString(args) then
    return nil, nil, args
  elseif _.isNumber(args) then
    return args, nil, nil
  elseif _.isArray(args) and _.isNumber(args[1]) then
    local status, body, headers = _.shift(args), _.pop(args), unpack(args)
    return status, headers, body
  else
    return nil, nil, nil
  end
end

function Response:__init(args)
  local status, headers, body = parse_arguments(args)
  self.status = status or 200
  self.body = body or " "
  self.headers = headers or {}
end

function Response:update(args)
  local status, headers, body = parse_arguments(args)
  self.status = status or self.status
  self.headers = headers or self.headers
  self.body = body or self.body
end

function Response:addHeader(name, value)
  self.headers[name] = value
end

function Response:clearHeader()
  self.headers = {}
end

function Response:finish(epd, headers, get, cookie, post)
    if not self.headers['Content-Type'] then
        self:addHeader('Content-Type', 'text/html; charset=utf-8')
    end
    for n, v in pairs(self.headers) do
        --header(n, v)
    end
    self:clearHeader()
  if(_.isFunction(self.body)) then
    for str in self.body do
      echo(epd, str)
    end
  else
    echo(epd, self.body)
  end
  die(epd)
end

return Response
