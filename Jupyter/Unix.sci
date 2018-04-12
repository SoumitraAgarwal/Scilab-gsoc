server 	= mgetl('Params/server.txt')
args 	= mgetl('Params/arguments.txt')
script 	= mgetl('Params/script.txt')

command 	= 'ssh ' + server + ' python ' + script + ' ' + args 

[rep,stat,stderr]=unix_g(command)
disp(rep)