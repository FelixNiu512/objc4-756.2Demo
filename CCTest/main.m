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
#import "Programmer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Job *job = [Job alloc];
        CCNSLog(@"job: %@ -- %p", job, &job);
    }
    return 0;
}
