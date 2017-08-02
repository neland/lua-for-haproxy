# haproxy-for-lua
### 编译
* 编译Lua5.3以上

```
wget http://www.lua.org/ftp/lua-5.3.3.tar.gz
tar -xzf lua-5.3.3.tar.gz
cd lua-5.3.3 
make linux
make install
```

* 编译Haproxy

```
// 获取1.6以后的版本
wget http://www.haproxy.org/download/1.6/src/haproxy-1.6.0.tar.gz
tar -xzf haproxy-1.6.0.tar.gz
cd haproxy-1.6.0
// 主要是添加USER_LUA=1 linux2628可以通过 uname -a看到，linux2628=2.6.28
make TARGET=linux2632 USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 USE_CRYPT_H=1 USE_LIBCRYPT=1 USE_LUA=1
make install
```

### 一些资料
* [官方Lua说明](http://www.arpalert.org/src/haproxy-lua-api/1.8dev/index.html#http-class)
* [官方配置说明](http://cbonte.github.io/haproxy-dconv/1.7/configuration.html#7.3.6)

### 例子的执行
```
haproxy -f sample.conf
```
