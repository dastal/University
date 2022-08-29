INCLUDE_PATH =  -I"D:\Programme\EiffelStudio\library\time\spec\include"
SHELL = /bin/sh
CC = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/gcc"
CPP = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/gcc"
CFLAGS = -O0 -pipe -imacros eif_config.mingw.h -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"D:\Programme\EiffelStudio/studio/spec/win64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -imacros eif_config.mingw.h -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"D:\Programme\EiffelStudio/studio/spec/win64/include" -I. $(INCLUDE_PATH)
LDFLAGS = 
CCLDFLAGS =   -mconsole
LDSHAREDFLAGS =  
EIFLIB = "D:\Programme\EiffelStudio/studio/spec/win64/lib/mingw/mtwkbench.a"
EIFTEMPLATES = D:\Programme\EiffelStudio/studio/config/win64/templates
LIBS = 
MAKE = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/make.exe"
AR = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/ar"
LD = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/ld"
MKDEP =   --
MV = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/cp"
CP = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/cp"
RANLIB = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/ranlib.exe"
RM = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/rm" -f
FILE_EXIST = 
RMDIR = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/rd"
X2C = "D:\Programme\EiffelStudio/studio/spec/win64/bin/x2c.exe"
SHAREDLINK = "D:\Programme\EiffelStudio/gcc/win64/mingw/bin/dllwrap"
SHAREDLIBS = -luser32 -lws2_32 -ladvapi32 -lgdi32 -lshell32 -lmsimg32 -lcomdlg32 -luuid -lole32 -loleaut32 -lcomctl32 -lmpr -lshlwapi -lwinspool -lstdc++ 
SHARED_SUFFIX = .dll
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = "D:\Programme\EiffelStudio/gcc/win64/msys/1.0/bin/touch" finished
PATH := D:\Programme\EiffelStudio/gcc/win64/mingw/libexec/gcc/mingw32/3.4.2;C:\ProgramData\Oracle\Java\javapath;D:\Programme\Python27\;D:\Programme\Python27\Scripts;C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Skype\Phone\;D:\Programme\Git\cmd;D:\Programme\Miktex\miktex\bin\x64\;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;D:\Programme\MATLAB\R2017b\bin;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps; 
SYSTEM_IN_DYNAMIC_LIB = topsort_project.dll 

.SUFFIXES:.cpp .o 

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C3_c.o 

OLDOBJECTS =  bi1039.o bi1039d.o li1037.o li1037d.o so1041.o so1041d.o pa1043.o \
	pa1043d.o tw1040.o tw1040d.o pr1038.o pr1038d.o tw1044.o tw1044d.o \
	tw1045.o tw1045d.o so1042.o so1042d.o it1031.o it1031d.o in1032.o \
	in1032d.o eq1046.o eq1046d.o el1033.o el1033d.o da1029.o da1029d.o \
	eq1030.o eq1030d.o to1034.o to1034d.o ti1026.o ti1026d.o da1024.o \
	da1024d.o da1027.o da1027d.o gr1035.o gr1035d.o ti1025.o ti1025d.o \
	da1028.o da1028d.o da1023.o da1023d.o in1036.o in1036d.o 

all::  Cobj3.o

Cobj3.o: $(OBJECTS) Makefile
	$(RM) $@
	$(LD) -r -o $@ $(OBJECTS)
	$(CREATE_TEST)
	$(RM) $(OBJECTS)


clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

