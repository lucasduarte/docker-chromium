var httpProxy = require('http-proxy');

httpProxy.createServer({
    target: 'ws://127.0.0.1:9111',
    ws: true,
    localAddress: '127.0.0.1'
})
.listen(9222);