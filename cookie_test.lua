local equal  = require("lib/equal-5bb8dbf")
local cookie = require("cookie")

-- case 1: Basic
assert("foo=bar" == cookie.build({ foo="bar" }))

-- case 2: Max-Age
local options = { max_age = 1 }
assert("foo=bar; Max-Age=1" ==
	cookie.build({ foo="bar" }, options))

-- case 3: Domain
local options = { domain = ".example.com" }
assert("foo=bar; Domain=.example.com" ==
	cookie.build({ foo="bar" }, options))

-- case 4: Path
local options = { path = "/base" }
assert("foo=bar; Path=/base" ==
	cookie.build({ foo="bar" }, options))

-- case 5: Expires
local time = 1398283214
local options = { expires = time }
assert("foo=bar; Expires=Wed, 23 Apr 2014 13:01:14 GMT" ==
	cookie.build({ foo="bar" }, options))

-- case 6: HttpOnly
local options = { http_only = true }
assert("foo=bar; HttpOnly" ==
	cookie.build({ foo="bar" }, options))

-- case 7: Secure
local options = { secure = true }
assert("foo=bar; Secure" ==
	cookie.build({ foo="bar" }, options))

-- case 8: Everything
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

-- case 9: parsing
assert(equal({ foo="bar", bar="baz" },
	cookie.parse("foo=bar; bar=baz")))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"')))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"; foo=baz')))

assert(equal({ foo="bar", bar="baz" },
	cookie.parse('foo=bar; bar="baz"; barabaz')))


print("All tests passed.")
