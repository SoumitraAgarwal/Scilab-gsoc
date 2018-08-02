import os
import jupyter_client
import subprocess
from shutil import copyfile


f 	= open(base + "/macros/init.py","w+")
f.write('import os\nos.system(\'cat ' + base + '/macros/init_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + '\')')
f.close()
# For copying files from local machine to remote server/machine
subprocess.Popen(["nohup", "python", base + "/macros/init.py"])


status = os.popen('echo $(ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + ' cat password)').readlines()
status = status[-1].rstrip("\r\n")

if(status == passw):
	os.system('scp -i ~/.ssh/id_rsa dataMat ' + user + '@' + ip + ':~/Working/data')
	os.system('scp -i ~/.ssh/id_rsa ' + model +' '+  user + '@' + ip + ':~/Working/model.p')
	# Copy the kernel file
	# # Get the list of kernel files

	f 	= open(base + "/macros/copy_commands.sh","w+")
	f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\ncd $(jupyter --runtime-dir)\nls')
	f.close()
	files 	= os.popen('cat ' + base + '/macros/copy_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip).readlines()
	# print('Copying ' + files[-1])

	# # # Copy any one file
	file 	= files[-1].rstrip("\r\n")
	# os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/.local/share/jupyter/runtime/' + file +  ' ..')

	print(file)
	# # Path of the kernel connection file
	cf 	= file
	f 	= open(base + "/macros/server_commands.sh","w+")
	f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\npython python_server.py ' + cf + ' predictor.py ' + user + ' 2 ')
	f.close()
	os.popen('cat ' + base + '/macros/server_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip)
	os.system('scp -i ~/.ssh/id_rsa ' + user + '@' + ip + ':~/ypred.p .')

else:
	print('Incorrect password or user not registered!')