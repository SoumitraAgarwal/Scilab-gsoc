import os
import jupyter_client
import subprocess
from shutil import copyfile


# For copying files from local machine to remote server/machine
subprocess.Popen(["nohup", "python", "../init.py"])
# Copy the kernel file

status = os.popen('echo $(ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + ' cat password)').readlines()
status = status[-1].rstrip("\r\n")

if(status == passw):
	os.popen('scp -i ~/.ssh/id_rsa ' + prep + ' ' + user + '@' + ip + ':~/Working/preprocessing.py')
	os.system('scp -i ~/.ssh/id_rsa ' + script + '.py ' +  user + '@' + ip + ':~/Scripts/' + script + '.py')
	# Copy the kernel file
	# # Get the list of kernel files
	f 	= open("../copy_commands.sh","w+")
	f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\nrm attributes.p\ncd $(jupyter --runtime-dir)\nls')
	f.close()
	files 	= os.popen('cat ../copy_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + '').readlines()

	# print('Copying ' + files[-1])

	# # # Copy any one file
	file 	= files[-1].rstrip("\r\n")
	# os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/.local/share/jupyter/runtime/' + file +  ' ..')

	print(file)
	# # Path of the kernel connection file
	cf 	= file
	f 	= open("../server_commands.sh","w+")
	f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\nls\ncd Working\npython preprocessing.py\ncd\npython python_server.py ' + cf + ' ' + script + ' ' + user + ' 1 ')
	f.close()
	os.popen('cat ../server_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + '')
	os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/attributes.p .')

else:
	print('Incorrect password or user not registered!')