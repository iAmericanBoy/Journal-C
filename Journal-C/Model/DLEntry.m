//
//  DLEntry.m
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLEntry.h"

@implementation DLEntry

-(instancetype)initWithName:(NSString *)title bodyText:(NSString *)body
{
    self = [super init];
    if (self){
        _title = title;
        _bodyText = body;
        _timeStamp = [NSDate date];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self){
        _title = [aDecoder decodeObjectForKey:@"title"];
        _bodyText = [aDecoder decodeObjectForKey:@"body"];
        _timeStamp = [aDecoder decodeObjectForKey:@"timeStamp"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    _title = [aCoder decodeObjectForKey:@"title"];
    _bodyText = [aCoder decodeObjectForKey:@"body"];
    _timeStamp = [aCoder decodeObjectForKey:@"timeStamp"];
}

@end