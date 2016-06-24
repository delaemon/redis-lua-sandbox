package.path = "../src/?.lua;src/?.lua;" .. package.path
pcall(require, "luarocks.require")
local redis = require 'redis'
local sha1 = require 'sha1'

local params = {
    host = '127.0.0.1',
    port = 6379,
}

local client = redis.connect(params)
query = "return redis.pcall('set', KEYS[1], ARGV[1])"
qs = sha1(query)
client:eval(query, 1, 'key1', 'val1')
client:evalsha(qs, 1, 'key2', 'val2')
--local one = client:get('key1')
--print(one)

local two = client:get('key2')
print(qs)
print(two)
