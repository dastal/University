INCLUDE_PATH = 
SHELL = /bin/sh
CC = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/gcc"
CPP = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/gcc"
CFLAGS = -O0 -pipe -imacros eif_config.mingw.h -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/studio/spec/windows/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -imacros eif_config.mingw.h -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/studio/spec/windows/include" -I. $(INCLUDE_PATH)
LDFLAGS = 
CCLDFLAGS =   -mconsole
LDSHAREDFLAGS =  
EIFLIB = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/studio/spec/windows/lib/mingw/mtwkbench.a"
EIFTEMPLATES = C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/studio/config/windows/templates
LIBS = 
MAKE = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/make.exe"
AR = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/ar"
LD = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/ld"
MKDEP =   --
MV = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/cp"
CP = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/cp"
RANLIB = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/ranlib.exe"
RM = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/rm" -f
FILE_EXIST = 
RMDIR = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/rd"
X2C = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/studio/spec/windows/bin/x2c.exe"
SHAREDLINK = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/bin/dllwrap"
SHAREDLIBS = -luser32 -lws2_32 -ladvapi32 -lgdi32 -lshell32 -lmsimg32 -lcomdlg32 -luuid -lole32 -loleaut32 -lcomctl32 -lmpr -lshlwapi -lwinspool -lstdc++ 
SHARED_SUFFIX = .dll
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = "C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/msys/1.0/bin/touch" finished
PATH := C:\Program Files (x86)\Eiffel Software\EiffelStudio 18.07 GPL/gcc/windows/mingw/libexec/gcc/mingw32/3.4.2;C:\ProgramData\Oracle\Java\javapath;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Windows Live\Shared;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Intel\OpenCL SDK\2.0\bin\x86;C:\Program Files (x86)\Intel\OpenCL SDK\2.0\bin\x64;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;C:\FPC\2.6.4\bin\i386-Win32;C:\Program Files\MATLAB\R2015b\runtime\win64;C:\Program Files\MATLAB\R2015b\bin;C:\Program Files\MiKTeX 2.9\miktex\bin\x64\;C:\WINDOWS\System32\OpenSSH\;C:\Users\David\AppData\Local\Microsoft\WindowsApps; 
SYSTEM_IN_DYNAMIC_LIB = project.dll 

.SUFFIXES:.cpp .o 

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = eoption.o epattern.o efrozen.o ecall.o eplug.o eskelet.o enames.o \
	evisib.o ececil.o einit.o eparents.o 

all::  $(OBJECTS)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

