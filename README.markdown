# cookie.lua

## usage

```lua
local cookie = require("cookie")

-- basic usage
assert("foo=bar" == cookie.build({ foo="bar" }))

-- using all possible option values
local time = 1398283214

local options = {
	max_age = 3600,
	domain = ".example.com",
	path = "/",
	expires = time,
	http_only = true,
	secure = true
}

local expected =
	"foo=bar; Max-Age=3600; Domain=.example.com; " ..
	"Path=/; Expires=Wed, 23 Apr 2014 13:01:14 GMT; " ..
	"HttpOnly; Secure"

assert(expected == 
	cookie.build({ foo="bar" }, options))

-- parsing
assert(equal({ foo="bar", bar="baz" },
	cookie.parse("foo=bar; bar=baz")))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"')))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"; foo=baz')))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"; barabaz')))
```

## license

MIt
