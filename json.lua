package.path = "../src/?.lua;src/?.lua;" .. package.path
pcall(require, "luarocks.require")
local redis = require "redis"
local cjson = require "cjson"

local params = {
    host = "127.0.0.1",
    port = 6379,
}
local client = redis.connect(params)
val1 = "val-one"
dic = { key1 = val1, "val2", "val3"}
print(dic)
json_data = cjson.encode(dic)
client:set("key", json_data)
local val = client:get("key")
print(val)
print(cjson.decode(val))
