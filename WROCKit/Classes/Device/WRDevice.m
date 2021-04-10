//
//  WRDevice.m
//  Pods
//
//  Created by 项辉 on 2021/4/9.
//

#import "WRDevice.h"
#import "WRDevice+Identifier.h"
#include <sys/utsname.h>


//MARK:-
@implementation WRDevice

//MARK:- Public
+ (nonnull instancetype)shared {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (DeviceType)type {
    return [self typeWithIdentifier:[self identifier]];
}

//MARK:- Private
- (NSString *)identifier {
	struct utsname systemInfo;
	uname(&systemInfo);
	NSString *identifier = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

	if ([identifier isEqualToString:@"i386"] || [identifier isEqualToString:@"x86_64"]) {
		NSDictionary *environment = [[NSProcessInfo processInfo] environment];
        return environment[@"SIMULATOR_MODEL_IDENTIFIER"];
	}

	return identifier;
}

+ (CGSize)size:(DeviceType)type {
    switch (type) {
        case iPhone2G:
        case iPhone3G:
        case iPhone3GS:
        case iPhone4:
        case iPhone4S:
            return CGSizeMake(320, 480);
        
        case iPhone5:
        case iPhone5c:
        case iPhone5s:
        case iPhoneSE1:
            return  CGSizeMake(320, 568);
            
        case iPhone6:
        case iPhone6s:
        case iPhone7:
        case iPhone8:
        case iPhoneSE2:
            return CGSizeMake(375, 667);
            
        case iPhone6Plus:
        case iPhone6sPlus:
        case iPhone7Plus:
        case iPhone8Plus:
            return CGSizeMake(414, 736);
            
        case iPhoneX:
        case iPhoneXS:
        case iPhone11Pro:
            return CGSizeMake(375, 812);
            
        case iPhone11:
        case iPhoneXR:
        case iPhone11ProMax:
        case iPhoneXSMax:
            return CGSizeMake(414, 896);
              
        case iPhone12Mini:
            return CGSizeMake(360, 780);
        
        case iPhone12:
        case iPhone12Pro:
            return CGSizeMake(390, 844);
            
        case iPhone12ProMax:
            return CGSizeMake(428, 926);
        default:
            return  CGSizeZero;;
    }
}


- (DeviceType)typeWithIdentifier:(NSString *)identifier {

    //iPod Touch
	if ([WRDEVICE_IPODTOUCH_1 containsObject:identifier]) {
		return iPodTouch1;
    } else if ([WRDEVICE_IPODTOUCH_2 containsObject:identifier]) {
        return iPodTouch2;
    } else if ([WRDEVICE_IPODTOUCH_3 containsObject:identifier]) {
        return iPodTouch3;
    } else if ([WRDEVICE_IPODTOUCH_4 containsObject:identifier]) {
        return iPodTouch4;
    } else if ([WRDEVICE_IPODTOUCH_5 containsObject:identifier]) {
        return iPodTouch5;
    } else if ([WRDEVICE_IPODTOUCH_6 containsObject:identifier]) {
        return iPodTouch6;
    } else if ([WRDEVICE_IPODTOUCH_7 containsObject:identifier]) {
        return iPodTouch7;

    //iPad
    } else if ([WRDEVICE_IPAD_1 containsObject:identifier]) {
        return iPad1;
    } else if ([WRDEVICE_IPAD_2 containsObject:identifier]) {
        return iPad2;
    } else if ([WRDEVICE_IPAD_3 containsObject:identifier]) {
        return iPad3;
    } else if ([WRDEVICE_IPAD_4 containsObject:identifier]) {
        return iPad4;
    } else if ([WRDEVICE_IPAD_5 containsObject:identifier]) {
        return iPad5;
    } else if ([WRDEVICE_IPAD_6 containsObject:identifier]) {
        return iPad6;
    } else if ([WRDEVICE_IPAD_7 containsObject:identifier]) {
        return iPad7;
    } else if ([WRDEVICE_IPAD_8 containsObject:identifier]) {
        return iPad8;

    } else if ([WRDEVICE_IPAD_AIR_1 containsObject:identifier]) {
        return iPadAir1;
    } else if ([WRDEVICE_IPAD_AIR_2 containsObject:identifier]) {
        return iPadAir2;
    } else if ([WRDEVICE_IPAD_AIR_3 containsObject:identifier]) {
        return iPadAir3;
    } else if ([WRDEVICE_IPAD_AIR_4 containsObject:identifier]) {
        return iPadAir4;

    } else if ([WRDEVICE_IPAD_MINI_1 containsObject:identifier]) {
        return iPadMini1;
    } else if ([WRDEVICE_IPAD_MINI_2 containsObject:identifier]) {
        return iPadMini2;
    } else if ([WRDEVICE_IPAD_MINI_3 containsObject:identifier]) {
        return iPadMini3;
    } else if ([WRDEVICE_IPAD_MINI_4 containsObject:identifier]) {
        return iPadMini4;
    } else if ([WRDEVICE_IPAD_MINI_5 containsObject:identifier]) {
        return iPadMini5;

    } else if ([WRDEVICE_IPAD_PRO_129_1 containsObject:identifier]) {
        return iPadPro1291;
    } else if ([WRDEVICE_IPAD_PRO_129_2 containsObject:identifier]) {
        return iPadPro1292;
    } else if ([WRDEVICE_IPAD_PRO_129_3 containsObject:identifier]) {
        return iPadPro1293;
    } else if ([WRDEVICE_IPAD_PRO_129_4 containsObject:identifier]) {
        return iPadPro1294;

    } else if ([WRDEVICE_IPAD_PRO_97_1 containsObject:identifier]) {
        return iPadPro0971;

    } else if ([WRDEVICE_IPAD_PRO_105_1 containsObject:identifier]) {
        return iPadPro1051;

    } else if ([WRDEVICE_IPAD_PRO_110_1 containsObject:identifier]) {
        return iPadPro1101;
    } else if ([WRDEVICE_IPAD_PRO_110_2 containsObject:identifier]) {
        return iPadPro1102;

        //iPhone
    } else if ([WRDEVICE_IPHONE_1 containsObject:identifier]) {
        return iPhone2G;
    } else if ([WRDEVICE_IPHONE_3G containsObject:identifier]) {
        return iPhone3G;
    } else if ([WRDEVICE_IPHONE_3GS containsObject:identifier]) {
        return iPhone3GS;
    } else if ([WRDEVICE_IPHONE_4 containsObject:identifier]) {
        return iPhone4;
    } else if ([WRDEVICE_IPHONE_4S containsObject:identifier]) {
        return iPhone4S;
    } else if ([WRDEVICE_IPHONE_5 containsObject:identifier]) {
        return iPhone5;
    } else if ([WRDEVICE_IPHONE_5C containsObject:identifier]) {
        return iPhone5c;
    } else if ([WRDEVICE_IPHONE_5S containsObject:identifier]) {
        return iPhone5s;
    } else if ([WRDEVICE_IPHONE_6 containsObject:identifier]) {
        return iPhone6;
    } else if ([WRDEVICE_IPHONE_6_PLUS containsObject:identifier]) {
        return iPhone6Plus;
    } else if ([WRDEVICE_IPHONE_6S containsObject:identifier]) {
        return iPhone6s;
    } else if ([WRDEVICE_IPHONE_6S_PLUS containsObject:identifier]) {
        return iPhone6sPlus;
    } else if ([WRDEVICE_IPHONE_SE_1 containsObject:identifier]) {
        return iPhoneSE1;
    } else if ([WRDEVICE_IPHONE_SE_2 containsObject:identifier]) {
        return iPhoneSE2;
    } else if ([WRDEVICE_IPHONE_7 containsObject:identifier]) {
        return iPhone7;
    } else if ([WRDEVICE_IPHONE_7_PLUS containsObject:identifier]) {
        return iPhone7Plus;
    } else if ([WRDEVICE_IPHONE_8 containsObject:identifier]) {
        return iPhone8;
    } else if ([WRDEVICE_IPHONE_8_PLUS containsObject:identifier]) {
        return iPhone8Plus;
    } else if ([WRDEVICE_IPHONE_X containsObject:identifier]) {
        return iPhoneX;
    } else if ([WRDEVICE_IPHONE_XR containsObject:identifier]) {
        return iPhoneXR;
    } else if ([WRDEVICE_IPHONE_XS containsObject:identifier]) {
        return iPhoneXS;
    } else if ([WRDEVICE_IPHONE_XS_MAX containsObject:identifier]) {
        return iPhoneXSMax;
    } else if ([WRDEVICE_IPHONE_11 containsObject:identifier]) {
        return iPhone11;
    } else if ([WRDEVICE_IPHONE_11_PRO containsObject:identifier]) {
        return iPhone11Pro;
    } else if ([WRDEVICE_IPHONE_11_PRO_MAX containsObject:identifier]) {
        return iPhone11ProMax;
    } else if ([WRDEVICE_IPHONE_12_MINI containsObject:identifier]) {
        return iPhone12Mini;
    } else if ([WRDEVICE_IPHONE_12 containsObject:identifier]) {
        return iPhone12;
    } else if ([WRDEVICE_IPHONE_12_PRO containsObject:identifier]) {
        return iPhone12Pro;
    } else if ([WRDEVICE_IPHONE_12_PRO_MAX containsObject:identifier]) {
        return iPhone12ProMax;
	}

	return unknown;
}

@end
