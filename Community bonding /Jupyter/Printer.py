import sys

if __name__ == "__main__":
	
	printer = ''
	print(sys.argv)
	for i in range(1,len(sys.argv)):
		printer += sys.argv[i] + ' '
	print(printer)