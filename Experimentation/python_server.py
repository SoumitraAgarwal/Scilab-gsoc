import sys
import jupyter_client

cf = sys.argv[1]
modelName = sys.argv[2]
user = sys.argv[3]
customflag = sys.argv[4]
parameters = ''
if(len(sys.argv)>5):
	parameters = sys.argv[5]

# Setup up a blocking kernel client using kernel connection file
km=jupyter_client.BlockingKernelClient(connection_file='/home/' + user + '/.local/share/jupyter/runtime/' + cf)

# load the connection settings
km.load_connection_file()

print("Training started!")

# execute any python commands on remote IPython kernel

if(customflag == '0'):
	workdata = '/home/' + user + '/Working/data'
	homedir = '/home/' + user
	command = open('/home/' + user + '/Scripts/' + modelName + '.py').read().replace('workdata','"' + workdata + '"').replace('homedir', '"' + homedir + '"').replace('parameters',parameters)
	print(command)
	f = open(homedir + "/temp.py","w+")
	f.write(command)
	f.close()
	msg_id = km.execute('exec(open(\'/home/' + user + '/temp.py\').read())')
	reply = km.get_shell_msg(msg_id)
	print(reply['content'])
	
elif(customflag == '1'):
	command = open('/home/' + user + '/Scripts/' + modelName + '.py').read().replace('parameters','')
	print(command)
	homedir = '/home/' + user
	f = open(homedir + "/temp.py","w+")
	f.write(command)
	f.close()
	msg_id = km.execute('exec(open(\'/home/' + user + '/temp.py\').read())')
	reply = km.get_shell_msg(msg_id)
	print(reply['content'])

elif(customflag == '2'):
	workdir = '/home/' + user + '/Working'
	homedir = '/home/' + user
	command = open('/home/' + user + '/Scripts/' + modelName + '.py').read().replace('workdir', '"' + workdir + '"').replace('homedir','"' + homedir + '"')
	print(command)
	f = open(homedir + "/temp.py","w+")
	f.write(command)
	f.close()
	msg_id = km.execute('exec(open(\'/home/' + user + '/temp.py\').read())')
	reply = km.get_shell_msg(msg_id)
	print(reply['content'])
print("Training done!")
