import sys
import jupyter_client

cf = sys.argv[1]

# Setup up a blocking kernel client using kernel connection file
km=jupyter_client.BlockingKernelClient(connection_file='/home/soumitra/.local/share/jupyter/runtime/' + cf)

# load the connection settings
km.load_connection_file()

print("Training started!")

# execute any python commands on remote IPython kernel

km.execute_interactive('exec(open("Shared/linear_regression.py").read())')

print("Training done!")
