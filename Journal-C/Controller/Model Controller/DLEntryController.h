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

@property(nonatomic,copy,readonly)NSMutableArray *entries;
@property(nonatomic,copy,readonly)DLEntryController *sharedInstance;

- (void)addEntry:(DLEntry *)entry;
- (void)removeEntry:(DLEntry *)entry;
- (instancetype)init;



@end

