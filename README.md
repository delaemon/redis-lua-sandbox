# redis-lua-sandbox

### setup
```
$ brew install lua
$ luarocks install --local redis-lua
$ luarocks install --local lua-cjson
```

### exec
```
$ redis-cli --eval hello.lua
$ lua ping.lua
```
