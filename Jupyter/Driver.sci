server 	= 'a.soumitra@172.16.68.1'
args 	= 'Hello World!'
script 	= 'Printer.py'

removedir('Params')
createdir('Params')

fd = mopen('Params/server.txt','wt');
mfprintf(fd, server);
mclose(fd);

fd = mopen('Params/script.txt','wt');
mfprintf(fd, script);
mclose(fd);

fd = mopen('Params/arguments.txt','wt');
mfprintf(fd, args);
mclose(fd);

exec('Unix.sci', -1)