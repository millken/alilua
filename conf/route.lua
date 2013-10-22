
return {

	{'GET', '/template', require('index').f},
	{'GET', '/a', function() return 'a' end},
}