#import <objc/runtime.h>
#import <UIKit/UIKit.h>

%hook UIWindow

- (BOOL)_shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		return NO; //if you want to force portrait use interfaceOrientation = UIInterfaceOrientationPortrait;
	}
	return %orig(interfaceOrientation);
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(long long)arg1 checkForDismissal:(BOOL)arg2 isRotationDisabled:(BOOL*)arg3 
{
	if(arg1 == UIDeviceOrientationPortraitUpsideDown){
		return NO; //if you want to force portrait use arg1 = UIInterfaceOrientationPortrait;
	}
	return %orig(arg1, arg2, arg3);
}

%end

%hook UIDevice

- (void)setOrientation:(UIDeviceOrientation)orientation animated:(BOOL)animated
{
	if(orientation == UIDeviceOrientationPortraitUpsideDown){
		return; //orientation = UIDeviceOrientationPortrait; to force portrait orientation
	}
	%orig(orientation, animated);
}

- (void)setOrientation:(long long)arg1 
{
	if(arg1 == UIDeviceOrientationPortraitUpsideDown){
		return; //arg1 = UIDeviceOrientationPortrait; to force portrait orientation
	}
	%orig(arg1);
}

%end
