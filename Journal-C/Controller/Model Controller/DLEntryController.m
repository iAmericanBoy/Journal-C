//
//  DLEntryController.m
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLEntryController.h"

@implementation DLEntryController

+ (DLEntryController *)sharedInstance {
    static DLEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DLEntryController new];
    });
    return sharedInstance;
}

- (void)addEntry:(DLEntry *)entry
{
    [_entries addObject: entry];
}

-(void)removeEntry:(DLEntry *)entry
{
    [_entries removeObject:entry];
}



@end
