import os
import jupyter_client

# Path of the kernel connection file
cf='kernel-23932.json'

# Setup up a blocking kernel client using kernel connection file
km=jupyter_client.BlockingKernelClient(connection_file='/run/user/1000/jupyter/' + cf)

# load the connection settings
km.load_connection_file()
direct = '/home/soumitra/Desktop/Projects/GSOC/Scilab-gsoc/Experimentation/Testing/Tester.py'
km.execute_interactive('exec(open(\''+ direct +'\').read())')
print("Training done!")