//
//  DLEntryController.m
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLEntryController.h"

@implementation DLEntryController

-(instancetype)init
{
    self = [super init];
    if(self) {
        _entries = [NSMutableArray array];
        [self loadFromPersistentStore];
    }
    return self;
}

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
    [self saveToPersistentStore];
}

-(void)removeEntry:(DLEntry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStore];
}

-(void)updateEntry:(DLEntry *)entry withTitle:(NSString *)title andBody:(NSString *)body
{
    entry.title = title;
    entry.bodyText = body;
    [self saveToPersistentStore];
}

-(void)saveToPersistentStore
{   
    NSData *dataToSave = [NSKeyedArchiver archivedDataWithRootObject:_entries];
    [[NSUserDefaults standardUserDefaults] setObject:dataToSave forKey:@"savedEntries"];
}

-(void) loadFromPersistentStore
{
    NSData *dataToDecode = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedEntries"];
    if (dataToDecode) {
        _entries = [NSKeyedUnarchiver unarchiveObjectWithData:dataToDecode] ;
    }
}

@end
