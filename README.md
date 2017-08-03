# lua for haproxy
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
### 说明
#### service
 
 * 替换原有服务处理逻辑
 * 只会执行一次
 
#### action

 * 作为回调注册到socket处理的过程中
 * 每次对应的action触发都会执行该函数
 
#### fetch

 * 该逻辑根据配置触发

#### task init
* 该逻辑在haproxy初始化完成后调用
* init在主线程里面，不能阻塞
* task为独立线程，可用于进行心跳相关检测
