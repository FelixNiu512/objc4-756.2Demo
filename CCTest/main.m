//
//  main.m
//  CCTest
//
//  Created by Constant Cody on 12/21/19.
//

#ifdef DEBUG
#define CCNSLog(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define CCNSLog(format, ...);
#endif

#import <Foundation/Foundation.h>

@interface Person : NSObject

@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person alloc];
        Person *p1 = [p init];
        Person *p2 = [p init];
        CCNSLog(@"p ==> %@", p);
        CCNSLog(@"p1 ==> %@", p1);
        CCNSLog(@"p2 ==> %@", p2);
    }
    return 0;
}
