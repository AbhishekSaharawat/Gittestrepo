import socket
ob=socket.socket()# creating socket for client in client machine
ob.connect(('10.191.244.36',2301)) # connecting to server at particular ip and particular port
conn=True
while conn:
   msg=input("enter msg to be send to server") # msg to send to server 
   print(f'sending {msg} in encoded format i.e {msg.encode('utf-8')}')
   ob.send(msg.encode('utf-8'))
   if msg =='bye':
      conn=False
      ob. close()
