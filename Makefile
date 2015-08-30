export ARCHS = armv7 arm64
export TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = NoUpsideDown
NoUpsideDown_FILES = Tweak.xm
NoUpsideDown_FRAMEWORKS = Foundation UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
