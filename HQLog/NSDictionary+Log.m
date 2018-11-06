/* 文件 : NSArray+Log.h
 * 作者 : Mr_Han
 * CSDN: https://blog.csdn.net/u010960265
 * GitHub https://github.com/HanQiGod
 * 日期 : 2018/09/20
 * 版权 : COPYRIGHT @Mr_Han 
 */

#import "NSDictionary+Log.h"
#import "NSString+unicode.h"
#import <objc/runtime.h>

@implementation NSDictionary (Log)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}
- (NSString *)debugDescription{
    return [super debugDescription];
}
- (NSString *)xy_debugDescription{
    return self.xy_debugDescription.unicodeString;
}

+ (void)load{
    [self swapMethod];
}

+ (void)swapMethod{
    Method method1 = class_getInstanceMethod(self, @selector(debugDescription));
    Method method2 = class_getInstanceMethod(self, @selector(xy_debugDescription));
    
    method_exchangeImplementations(method1, method2);
}
#endif

@end
