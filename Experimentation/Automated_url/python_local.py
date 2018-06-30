import os
import jupyter_client
import subprocess
from shutil import copyfile


# For copying files from local machine to remote server/machine
subprocess.Popen(["nohup", "python", "../init.py"])

print(os.listdir('.'))
os.system('scp -i ~/.ssh/id_rsa dataMat soumitra@35.196.55.90:~/Working/data')

# Copy the kernel file
# # Get the list of kernel files
files 	= os.popen('cat ../copy_commands.sh|ssh -i ~/.ssh/id_rsa soumitra@35.196.55.90').readlines()
# print('Copying ' + files[-1])

# # # Copy any one file
file 	= files[-1].rstrip("\r\n")
# os.system('scp -i ~/.ssh/id_rsa soumitra@35.196.55.90:~/.local/share/jupyter/runtime/' + file +  ' ..')

print(file)
# # Path of the kernel connection file
cf 	= file
f 	= open("../server_commands.sh","w+")
f.write('export PATH="/home/soumitra/anaconda3/bin:$PATH"\npython python_server.py ' + cf + ' ' + script)
f.close()
os.popen('cat ../server_commands.sh|ssh -i ~/.ssh/id_rsa soumitra@35.196.55.90')
os.system('scp -i ~/.ssh/id_rsa soumitra@35.196.55.90:~/attributes.p .')