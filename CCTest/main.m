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

@protocol PersonProtocol <NSObject>

- (void)walk;

@end

@interface Person : NSObject <PersonProtocol> {
    NSInteger _gender;
}

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;

- (void)run;

@end

@implementation Person

- (void)run {
    NSLog(@"I am running.");
}

- (void)walk {
    NSLog(@"I am walking.");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        Class pcls = object_getClass(p);
        
    }
    return 0;
}
