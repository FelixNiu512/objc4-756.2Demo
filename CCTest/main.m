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

+ (void)printMyClassName;
- (void)run;

@end

@implementation Person

+ (void)printMyClassName {
    NSLog(@"my class name is Person");
}

- (void)run {
    NSLog(@"I am running.");
}

- (void)walk {
    NSLog(@"I am walking.");
}

@end

//@interface Tool : NSObject
//
//@end
//
//@implementation Tool
//
//
//
//@end

void printMethods(Class cls) {
    if (cls == nil) {
        return ;
    }
    CCNSLog(@"------------ print %@ methods ------------", NSStringFromClass(cls));
    uint32_t count;
    Method *methods = class_copyMethodList(cls, &count);
    for (uint32_t i = 0; i < count; i++) {
        Method method = methods[i];
        CCNSLog(@"名字：%@ -- 类型：%s", NSStringFromSelector(method_getName(method)), method_getTypeEncoding(method));
    }
}

void fly(id obj, SEL sel) {
    NSLog(@"I am flying");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class pcls = [Person class];
        class_addMethod(pcls, NSSelectorFromString(@"fly"), (IMP)fly, "v@:");
        printMethods(pcls);
        [[pcls alloc] performSelector:NSSelectorFromString(@"fly")];
    }
    return 0;
}
