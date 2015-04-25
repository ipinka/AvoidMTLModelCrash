#import "NSNumber+AvoidMTLModelCrash.h"

#import "JRSwizzle.h"

static NSString *__checkString = @"";

@implementation NSNumber (AvoidMTLModelCrash)

+ (void)load
{
    static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
        [self avoidMTLModelCrash];
     });
}

+ (void)avoidMTLModelCrash
{
    [self jr_swizzleMethod:@selector(respondsToSelector:) withMethod:@selector(swizzle_respondsToSelector:) error:nil];
    [self jr_swizzleMethod:@selector(forwardingTargetForSelector:) withMethod:@selector(swizzle_forwardingTargetForSelector:) error:nil];
}

- (BOOL)swizzle_respondsToSelector:(SEL)aSelector
{
    if ([self swizzle_respondsToSelector:aSelector]) {
        return YES;
    }
    if ([__checkString respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)swizzle_forwardingTargetForSelector:(SEL)aSelector
{
    if ([self swizzle_forwardingTargetForSelector:aSelector]) {
        return self;
    }
    if ([__checkString respondsToSelector:aSelector]) {
        return [NSString stringWithFormat:@"%@", self];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
