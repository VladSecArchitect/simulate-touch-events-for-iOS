NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m

OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING=$(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING=$(WARN_COLOR)[WARNINGS]$(NO_COLOR)

COMPILING_STRING=$(OK_COLOR)[COMPILING...]$(NO_COLOR)
LINKING_STRING=$(OK_COLOR)[LINKING...]$(NO_COLOR)
SIGNING_STRING=$(OK_COLOR)[SIGNING...]$(NO_COLOR)
INSTALLING_STRING=$(OK_COLOR)[INSTALLING...]$(NO_COLOR)
RUNNING_STRING=$(OK_COLOR)[RUNNING...]$(NO_COLOR)

SDK_VERSION=$(shell xcrun --sdk iphoneos --show-sdk-version)
SDK_PATH=$(shell xcrun --sdk iphoneos --show-sdk-path)
# xcodebuild -showsdks
# xcodebuild -sdk -version
# xcrun --sdk iphoneos --find clang
#

FRAMEWORKS_ROOT=$(SDK_PATH)/System/Library/Frameworks/
INCLUDES=$(SDK_PATH)/usr/include


INCLUDES=-I . \
		-I "includes" \
		-I "IOKit" \
		-I "IOKit Headers" \
		-I "private-headers"

TARGET=touches

FRAMEWORKS=-framework Foundation \
			-framework CoreFoundation \
			-framework MobileCoreServices \
			-framework IOKit \
			-framework AudioToolbox
			# -framework GraphicsServices

CC=$(shell xcodebuild -sdk iphoneos -find clang)
IFLAGS = $(INCLUDES) -F$(FRAMEWORKS_ROOT)
# WFLAG1 = -Wall
# WFLAG2 = -Werror
# WFLAG3 = -Wextra
WFLAG3 =-Wno-everything
WFLAGS = $(WFLAG1) $(WFLAG2) $(WFLAG3)
#OFLAGS = -g -O3
SFLAG1 =-x objective-c++ -std=gnu++1z -stdlib=libc++ -fobjc-weak -fobjc-abi-version=2
SFLAG2 =-arch arm64 -mios-version-min=11.2
SFLAGS = $(SFLAG1) $(SFLAG2)
DFLAGS = -DDEBUG=1 -DYLD_PRINT_LIBRARIES=1 -DYLD_PRINT_LIBRARIES_POST_LAUNCH=1 -DYLD_PRINT_RPATHS=1
UFLAGS = # Set on make command line only
CFLAGS = $(SFLAGS) $(DFLAGS) $(IFLAGS) $(OFLAGS) $(WFLAGS) $(UFLAGS)
CFLAGS=  $(SFLAGS) $(DFLAGS) $(IFLAGS) $(FRAMEWORKS) $(OFLAGS) $(WFLAGS)

#-fno-obj-arc

LD=$(shell xcodebuild -find ld)
LD=$(shell xcodebuild -sdk iphoneos -find clang++)
LDFLAGS = -demangle -arch arm64 -iphoneos_version_min 11.2 -dead_strip -export_dynamic -syslibroot $(SDK_PATH) -lobjc -lc++
LDFLAGS = -arch arm64 -miphoneos-version-min=11.2 -fobjc-link-runtime -stdlib=libc++ -isysroot $(SDK_PATH) -F$(FRAMEWORKS_ROOT) $(FRAMEWORKS)
#-framework SpringBoardServices
# FILE="main.mm"

# /bin/cat <<EOM >$FILE
# #import <Foundation/Foundation.h>
# #import <UIKit/UIKit.h>

# #include <stdio.h>

# int main (void)
# {
#   puts ("Hello, World!");
#   return 0;
# }
# EOM

COMPILED_TIME=$(shell date +'%y.%m.%d %H:%M:%S')

.SUFFIXES: .mm .o
SRC_OBJC=ioreg_tools.m
SRC_OBJCPP=main.mm ioreg_tools.mm

#You can't do it only with the shorthand. You'll have to use the patsubst function:
#OBJECTS = $(patsubst %.cpp,%.o,$(patsubst %.c,%.o,$(SOURCES)))
#Or you can use one of each:
#OBJECTS = $(patsubst %.cpp,%.o,$(SOURCES:.c=.o))
#Or, you can do it like this:
#OBJECTS = $(addsuffix .o,$(basename $(SOURCES)))
#
OBJECTS=$(SRC_OBJCPP:.mm=.o)

all: prepare_main $(TARGET) install run

prepare_main :
	$(shell set -x)
	@cp -rf main_bkp.mm main.mm
	@sed -i '' 's/COMPILATION_DATE/$(COMPILED_TIME)/g' main.mm
	#g++ -g main.cpp -o foo
	#dsymutil -dump-debug-map touches

#.mm.s:
#	$(CC) $(CFLAGS) -S -masm=intel $@ $<

.mm.o:
	@echo "$(COMPILING_STRING)" $<
	@$(CC) $(CFLAGS) -isysroot $(SDK_PATH) -c -o $@ $< 2> temp.log || touch temp.errors
	@if test -e temp.errors; then echo "$(ERROR_STRING)" && cat temp.log; elif test -s temp.log; then echo "$(WARN_STRING)" && cat temp.log; else echo "$(OK_STRING)"; fi;
	@rm -f temp.errors temp.log

$(TARGET) : $(OBJECTS)
	@echo "$(LINKING_STRING)"
	@$(LD) $(LDFLAGS) $^ -o $@ 2> temp_link.log || touch temp_link.errors
	@if test -e temp_link.errors; then echo "$(ERROR_STRING)" && cat temp_link.log; elif test -s temp_link.log; then echo "$(WARN_STRING)" && cat temp_link.log; else echo "$(OK_STRING)"; fi;
	@rm -f temp_link.errors temp_link.log

sign :
	@echo "$(SIGNING_STRING)"

install :
	@echo "$(INSTALLING_STRING)"
	@expect -c "log_user 0; spawn ssh -p 22 root@192.168.1.11 \"launchctl stop /Library/LaunchDaemons/ru.redhot.SimulateTouches.plist; launchctl unload /Library/LaunchDaemons/ru.redhot.SimulateTouches.plist; rm /bin/touches\"; expect password; send alpine\n; interact; exit"
	@expect -c "log_user 0; spawn scp -o StrictHostKeyChecking=no touches root@192.168.1.11:~/; expect \"password:\"; send alpine\r; interact; exit" 2> install.log
	@expect -c "log_user 0; spawn scp -o StrictHostKeyChecking=no ru.redhot.SimulateTouches.plist root@192.168.1.11:/System/Library/LaunchDaemons/; expect \"password:\"; send alpine\r; interact; exit" 2> install.log
	@expect -c "log_user 0; spawn ssh -p 22 root@192.168.1.11 \"mv touches /bin/; ldid -Stouch_ent.plist /bin/touches\"; expect password; send alpine\n; interact; exit" 2> install.log

# after-install::
# 	# Taokeceshiji1:~ root# uicache
# 	install.exec "killall \"KNcreateOnDisk\"" || true
# 	install.exec "uicache "


# #Finally, make sure to set the ownership of the script to "root:wheel" and its permissions to "755".

# 	install.exec "chmod 775 /Applications/KNcreateOnDisk.app/fake"

# #要先设置用户属主,再设置文件执行权限
# 	install.exec "chown root:wheel /Applications/KNcreateOnDisk.app/KNcreateOnDisk"

# 	#Give your app binary the "set user ID" and "set group ID" flags.
# 	install.exec "chmod 6775 /Applications/KNcreateOnDisk.app/KNcreateOnDisk"


# 	&> DYLD_PRINT_LIBRARIES.txt
run:
	@echo "$(RUNNING_STRING)"
	@expect -c "log_user 0; spawn ssh -p 22 root@192.168.1.11 \"launchctl load /Library/LaunchDaemons/ru.redhot.SimulateTouches.plist; launchctl start /Library/LaunchDaemons/ru.redhot.SimulateTouches.plist\"; expect password; send alpine\n; interact; exit"
