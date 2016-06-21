package.path = "../src/?.lua;src/?.lua;" .. package.path
pcall(require, "luarocks.require")
local redis = require 'redis'

local params = {
    host = '127.0.0.1',
    port = 6379,
}

local client = redis.connect(params)
client:eval("return redis.call('set', KEYS[1], ARGV[1])", 1, 'key1', 'val1')
local one = client:get('key1')
print(one)
