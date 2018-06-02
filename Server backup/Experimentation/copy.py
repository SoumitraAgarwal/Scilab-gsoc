import os

# Get the list of kernel files
files 	= os.popen('cat copy_commands.sh|ssh -i ~/.ssh/id_rsa soumitra@35.203.24.89').readlines()
print('Copying ' + files[-1])

# Copy any one file
file 	= files[-1].rstrip("\r\n")
os.system('scp -i ~/.ssh/id_rsa soumitra@35.203.24.89:/run/user/1002/jupyter/' + file +  ' .')