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

@interface Person (Fly)

- (void)fly;

@end

@implementation Person (Fly)

- (void)fly {
    NSLog(@"I am flying.");
}

@end

void printProperties(Class cls) {
    if (cls == nil) {
        return ;
    }
    CCNSLog(@"------------ print %@ properties ------------", NSStringFromClass(cls));
    uint32_t count;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    for (uint32_t i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        CCNSLog(@"名字：%s -- 属性：%s", property_getName(property), property_getAttributes(property));
    }
}

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

id getter(id obj, SEL sel) {
    return objc_getAssociatedObject(obj, (__bridge const void * _Nonnull)(NSStringFromSelector(sel)));
}

void setter(id obj, SEL sel, id value) {
    objc_setAssociatedObject(obj, (__bridge const void * _Nonnull)(NSStringFromSelector(sel)), value, OBJC_ASSOCIATION_RETAIN);
}

void runtimeAddPropertyCountry(Class cls) {
    objc_property_attribute_t attrs[] = {
        { "T", "@\"NSString\"" },           // T 类型，这里country是NSString类型
        { "&", "" },                        // & = strong/retain
        { "N", "" },                        // N = nonatomic
        { "V", "_country" }                 // V 成员变量
    };
    class_addProperty(cls, "country", attrs, 4);
    
    class_addMethod(cls, NSSelectorFromString(@"country"), (IMP)getter, "@@:");
    class_addMethod(cls, NSSelectorFromString(@"setCountry:"), (IMP)setter, "v@:@");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class pcls = [Person class];
        
//        runtimeAddPropertyCountry(pcls);
//        printProperties(pcls);
//        printMethods(pcls);
        
        NSLog(@"%p", pcls);
    }
    return 0;
}
