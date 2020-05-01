@interface NSMutableDictionary (DefaultsValue)

- (NSInteger)nonZeroIntegerForKey:(NSString *)key fallback:(NSInteger)fallback;
- (BOOL)valueExistsForKey:(NSString *)key;

@end