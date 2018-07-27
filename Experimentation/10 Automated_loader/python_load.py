import os
import jupyter_client
import subprocess
from shutil import copyfile


status = os.popen('echo $(ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + ' cat password)').readlines()
status = status[-1].rstrip("\r\n")

if(status == passw):

	# Copy the kernel file
	# # Get the list of kernel files

	f 	= open("../copy_commands.sh","w+")
	f.write('ls')
	f.close()
	files 	= os.popen('cat ../copy_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip).readlines()
	# print('Copying ' + files[-1])

	files 	= [file.rstrip('\r\n') for file in files]
	
	if('Scripts' not in files):
		print('Copying pre-built scripts')
		os.system('scp -r ~/.ssh/id_rsa ../loader/Scripts/ ' +  user + '@' + ip + ':~/')

	if('python_server.py' not in files):
		print('Copying server runner')
		os.system('scp -i ~/.ssh/id_rsa ../loader/python_server.py ' +  user + '@' + ip + ':~/python_server.py')

	if('anaconda3' not in files):
		print('Installing anaconda on the server')
		os.popen('cat ../load_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)

	if('Shared' not in files):
		os.popen('cat ../load_commands_mkdir.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)

	# os.system('scp -i ~/.ssh/id_rsa dataMat ' + user + '@' + ip + ':~/Working/data')

	# # # Copy any one file
	# file 	= files[-1].rstrip("\r\n")
	# os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/.local/share/jupyter/runtime/' + file +  ' ..')

	# print(file)
	# # Path of the kernel connection file
	# cf 	= file
	# f 	= open("../server_commands.sh","w+")
	# f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\npython python_server.py ' + cf + ' ' + script + ' ' + user + ' 0 ' + parameters)
	# f.close()
	# os.popen('cat ../server_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)
	# os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/attributes.p .')

else:
	print('Incorrect password or user not registered!')