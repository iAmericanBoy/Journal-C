//
//  DLEntryController.h
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLEntry.h"


@interface DLEntryController : NSObject

+(DLEntryController *)sharedInstance;

@property(nonatomic,strong,readonly)NSMutableArray *entries;
- (void)addEntry:(DLEntry *)entry;
- (void)removeEntry:(DLEntry *)entry;
- (void)updateEntry:(DLEntry *)entry
          withTitle:(NSString *)title
            andBody:(NSString *)body;
- (instancetype)init;
- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;

@end

