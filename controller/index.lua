module('index',package.seeall)
local slt2 = require('slt2')
--local user = {
--    name = 'world'
--}

function index() 
	local tmpl = slt2.loadstring([[<span>
	#{ if user ~= nil then }#
	Hello, #{= user.name }#!
	#{ else }#
	<a href="/login">login</a>
	#{ end }#
	</span>
	]])	
	return  slt2.render(tmpl, {user = user})
end

function f() 
	local tmpl = slt2.loadfile("view/a/index.html")	
	return  slt2.render(tmpl, {name = "alilua"})
end