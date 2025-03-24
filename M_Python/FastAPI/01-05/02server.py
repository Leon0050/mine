# web应用程序，遵循http协议(现有请求再有响应)
import socket
sock = socket.socket()

#绑定bind
# sock.bind(('127.0.0.1', 8080))
# sock.listen(5)
# # 使用 Python 的 socket 模块创建了一个 TCP 服务器，并监听本地 127.0.0.1:8000 端口，允许最多 5 个客户端同时等待连接。
# while 1: # 死循环
#     conn, addr = sock.accept() # 阻塞等待客户端连接
#     data = conn.recv(1024) # 接收客户端发送的请求数据，最多 1024 字节
#     print('客户端发送的请求信息:\n',data)
#
#     # conn.send(b"hello, world") # 没有按照响应格式来，故响应无效； b -> 字节类型bytes
#     conn.send(b"HTTP/1.1 200 ok\r\n server:linc\r\n\r\nhello world")
#     conn.close() # 关闭客户端连接，但服务器不会关闭，仍然在 while 循环里等待新客户端连接

# content-type在响应头里的作用
# # content-type：text/html
# sock.bind(('127.0.0.1', 8090))
# sock.listen(5)
# # 使用 Python 的 socket 模块创建了一个 TCP 服务器，并监听本地 127.0.0.1:8000 端口，允许最多 5 个客户端同时等待连接。
# while 1: # 死循环
#     conn, addr = sock.accept() # 阻塞等待客户端连接
#     data = conn.recv(1024) # 接收客户端发送的请求数据，最多 1024 字节
#     print('客户端发送的请求信息:\n',data)
#
#     # conn.send(b"hello, world") # 没有按照响应格式来，故响应无效； b -> 字节类型bytes
#     conn.send(b"HTTP/1.1 200 ok\r\n server:linc\r\ncontent-type:text/html \r\n\r\n<h1>hello world<h1>")
#     conn.close() # 关闭客户端连接，但服务器不会关闭，仍然在 while 循环里等待新客户端连接

# content-type：application/json
sock.bind(('127.0.0.1', 8070))
sock.listen(5)
# 使用 Python 的 socket 模块创建了一个 TCP 服务器，并监听本地 127.0.0.1:8000 端口，允许最多 5 个客户端同时等待连接。
while 1: # 死循环
    conn, addr = sock.accept() # 阻塞等待客户端连接
    data = conn.recv(1024) # 接收客户端发送的请求数据，最多 1024 字节
    print('客户端发送的请求信息:\n',data)

    # conn.send(b"hello, world") # 没有按照响应格式来，故响应无效； b -> 字节类型bytes
    conn.send(b'HTTP/1.1 200 ok\r\n server:linc\r\ncontent-type:application/json \r\n\r\n{"hello world":"niu", "user_id":6576}')
    conn.close() # 关闭客户端连接，但服务器不会关闭，仍然在 while 循环里等待新客户端连接






