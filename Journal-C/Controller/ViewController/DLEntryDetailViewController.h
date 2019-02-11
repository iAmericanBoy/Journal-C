//
//  DLEntryDetailViewController.h
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLEntry.h"


@interface DLEntryDetailViewController : UIViewController

@property(nonatomic,strong)DLEntry *entry;

-(void)updateView;

@end

