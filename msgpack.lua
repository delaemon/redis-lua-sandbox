package.path = "../src/?.lua;src/?.lua;" .. package.path
pcall(require, "luarocks.require")
local redis = require "redis"
local cmsgpack = require "cmsgpack"

local params = {
    host = "127.0.0.1",
    port = 6379,
}
local client = redis.connect(params)

val_int = 123
val_str = "abc"
dic = { key_int = val_int, key_str = val_str}
data = cmsgpack.pack(dic)
print(dic)
print(data)

client:set("key", data)
local val = client:get("key")
local t = cmsgpack.unpack(val)
print(val)
print(t)
print(t["key_int"])
print(t["key_str"])
