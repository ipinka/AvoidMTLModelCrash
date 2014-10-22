#import <Foundation/Foundation.h>

@interface NSDictionary (AvoidMTLModelCrash)

+ (void)avoidMTLModelCrash;

- (BOOL)swizzle_respondsToSelector:(SEL)aSelector;

- (id)swizzle_forwardingTargetForSelector:(SEL)aSelector;

@end
