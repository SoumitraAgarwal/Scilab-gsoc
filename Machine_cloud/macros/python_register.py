import os

status = os.popen('echo $(ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + ' cat password)').readlines()

status = status[-1]
if(status == '\n'):
	f 	= open(base + "/macros/utility.sh","w+")
	f.write('echo \'' + password + '\' >> password')
	f.close()
	os.popen('cat ' + base + '/macros/utility.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)
else:
	print('User already registered!')