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
	f.write('export PATH="/home/' + user + '/anaconda3/bin:$PATH"\ncd Working\nwget ' + url + '\ncd')
	f.close()
	files 	= os.popen('cat ../copy_commands.sh|ssh -i ~/.ssh/id_rsa ' + user + '@' + ip + '').readlines()

else:
	print('Incorrect password or user not registered!')