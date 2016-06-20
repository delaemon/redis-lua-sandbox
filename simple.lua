package.path = "../src/?.lua;src/?.lua;" .. package.path
pcall(require, "luarocks.require")
local redis = require 'redis'

local params = {
    host = '127.0.0.1',
    port = 6379,
}

local client = redis.connect(params)
-- client:select(15) -- for testing purposes

client:set('key', 'val')
local value = client:get('key')

print(value)
