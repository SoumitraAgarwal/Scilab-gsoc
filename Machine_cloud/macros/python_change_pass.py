import os

status = os.popen('echo $(ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + ' cat password)').readlines()
status = status[-1].rstrip("\r\n")

if(status == opassword):
	f 	= open(base + "macros/utility.sh","w+")
	f.write('rm password\necho \'' + npassword + '\' >> password')
	f.close()
	os.popen('cat ' + base  + 'macros/utility.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)
else:
	print('Incorrect password or user not registered!')