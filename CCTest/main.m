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
#import <objc/runtime.h>

@interface Person : NSObject

@end

@implementation Person

@end

@interface Teacher : Person

@end

@implementation Teacher

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object = [[NSObject alloc] init];
        Person *person = [[Person alloc] init];
        Teacher *teacher = [[Teacher alloc] init];
        NSLog(@"%@ -- %@ -- %@", teacher, person, object);
    }
    return 0;
}
