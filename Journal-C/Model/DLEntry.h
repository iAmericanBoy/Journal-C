//
//  DLEntry.h
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DLEntry : NSObject<NSCoding>

@property(nonatomic,copy, readonly)NSString *title;
@property(nonatomic,copy, readonly)NSString *bodyText;
@property(nonatomic,copy, readonly)NSDate *timeStamp;

-(instancetype)initWithName:(NSString *)title
                   bodyText:(NSString *) body;
-(instancetype)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

@end


