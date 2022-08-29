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

OBJECTS = big_file_C2_c.o 

OLDOBJECTS =  ap1006.o ap1006d.o eq1007.o eq1007d.o in999.o in999d.o in990.o \
	in990d.o ne1015.o ne1015d.o eq1017.o eq1017d.o eq996.o eq996d.o \
	it997.o it997d.o in993.o in993d.o er991.o er991d.o in995.o in995d.o \
	in994.o in994d.o ad1010.o ad1010d.o so998.o so998d.o ne1014.o \
	ne1014d.o st1013.o st1013d.o eq1018.o eq1018d.o eq1016.o eq1016d.o \
	da1004.o da1004d.o it1020.o it1020d.o it992.o it992d.o ad1011.o \
	ad1011d.o ex1009.o ex1009d.o ne1000.o ne1000d.o so1012.o so1012d.o \
	da1003.o da1003d.o da1022.o da1022d.o ti1002.o ti1002d.o ab1005.o \
	ab1005d.o du1001.o du1001d.o da1008.o da1008d.o fi1021.o fi1021d.o \
	da1019.o da1019d.o 

all::  Cobj2.o

Cobj2.o: $(OBJECTS) Makefile
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

