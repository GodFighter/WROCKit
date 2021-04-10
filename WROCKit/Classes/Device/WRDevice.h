//
//  WRDevice.h
//  Pods
//
//  Created by 项辉 on 2021/4/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WRDeviceEnum.h"

NS_ASSUME_NONNULL_BEGIN

//MARK:-
@interface WRDevice : NSObject

+ (nonnull instancetype)shared;

/** 设备类型 */
@property (assign, nonatomic) DeviceType type;

/** 获取设备尺寸
 *
 *  @param type 设备类型
 *
 *  @return 设备尺寸
 */
+ (CGSize)size:(DeviceType)type;

@end

NS_ASSUME_NONNULL_END
/// 设备尺寸
///
/// - parameter type: 设备类型
/// - returns: 设备尺寸
