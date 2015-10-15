export ARCHS = armv7 arm64
export TARGET = :clang:latest:latest

PACKAGE_VERSION = 0.0.2

include theos/makefiles/common.mk

TWEAK_NAME = NoUpsideDown
NoUpsideDown_FILES = Tweak.xm
NoUpsideDown_FRAMEWORKS = Foundation UIKit QuartzCore
NoUpsideDown_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
