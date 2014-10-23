#import <Foundation/Foundation.h>

@interface NSString (AvoidMTLModelCrash)

- (char)charValue;
- (unsigned char)unsignedCharValue;
- (short)shortValue;
- (unsigned short)unsignedShortValue;
- (unsigned int)unsignedIntValue;
- (long)longValue;
- (unsigned long)unsignedLongValue;
- (unsigned long long)unsignedLongLongValue;
- (NSUInteger)unsignedIntegerValue;
- (NSString *)stringValue;
- (NSComparisonResult)compare:(NSNumber *)otherNumber;
- (BOOL)isEqualToNumber:(NSNumber *)number;
- (NSString *)descriptionWithLocale:(id)locale;

@end
