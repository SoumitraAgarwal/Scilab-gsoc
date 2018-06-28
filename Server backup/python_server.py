import sys
import jupyter_client

cf = sys.argv[1]
modelName = sys.argv[2]

# Setup up a blocking kernel client using kernel connection file
km=jupyter_client.BlockingKernelClient(connection_file='/home/soumitra/.local/share/jupyter/runtime/' + cf)

# load the connection settings
km.load_connection_file()

print("Training started!")

# execute any python commands on remote IPython kernel

km.execute('exec(open(\'/home/soumitra/Scripts/' + modelName + '.py\').read())')

print("Training done!")
