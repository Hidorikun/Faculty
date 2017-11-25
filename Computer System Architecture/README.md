# Computer System Architecture

To assemble and run those programs you can consider:
- [EMU8086](http://qpdownload.com/8086-microprocessor-emulator/)

- [DOSBox](https://www.dosbox.com/)

	 - tasm - assemble a program with embedded DEBUG information
		This is done using he following TASM command line syntax :
		-		tasm example
				tasm example.asm
		- important options: /l, /zi

	- tlink - linking with debug information in order ro create an executable file
		example.obj + example.obj + ... -> example.exe (or example .com)
			This is done by entering the following command :
		-		tlink example
				tlink example.obj
		- important options: /v, /t
	- td - running debug - This is done by entering the following command:
		- 		td example
				td example.exe
	- example:
		- wihout options:
			-		> tasm  example
					> tlink example
					> td example
		- with options:
			-		> tasm /zi example
					> tlink /v example
					> td example
