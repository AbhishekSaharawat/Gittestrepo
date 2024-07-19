import socket 
ob=socket.socket()# creating socket in Server Machine
ob.bind(('10.191.244.36',2301)) # binding socket with IP and Port of server,so that server listen on this ip and port

ob.listen()# ready to listen from anywhere 
print("Listen to whole world")
clientobject,add=ob.accept()# Accept (agree) connection from client  
print("Accepted the connection from client")
print("connected with address",add)
conn=True
while conn :
  gotmsg=clientobject.recv(1024)  #receiving packets from client
  print(gotmsg.decode('utf-8'))
  if len(gotmsg)==0:
   conn=False
   ob.close()