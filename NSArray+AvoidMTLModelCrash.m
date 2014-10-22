#import "NSArray+AvoidMTLModelCrash.h"

#import "JRSwizzle.h"

#import "NSDictionary+AvoidMTLModelCrash.h"

static NSDictionary *__checkDict = nil;
static NSString *__checkString = @"";
static NSNumber *__checkNumber = nil;

@implementation NSArray (AvoidMTLModelCrash)

+ (void)load
{
    __checkDict = [[NSDictionary alloc] init];
    __checkNumber = @0;
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
    if ([__checkDict swizzle_respondsToSelector:aSelector]) {
        return YES;
    }
    if ([__checkString respondsToSelector:aSelector]) {
        return YES;
    }
    if ([__checkNumber respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)swizzle_forwardingTargetForSelector:(SEL)aSelector
{
    if ([self swizzle_forwardingTargetForSelector:aSelector]) {
        return self;
    }
    if ([__checkDict swizzle_forwardingTargetForSelector:aSelector]) {
        return __checkDict;
    }
    if ([__checkString forwardingTargetForSelector:aSelector]) {
        return __checkString;
    }
    if ([__checkNumber forwardingTargetForSelector:aSelector]) {
        return __checkString;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
