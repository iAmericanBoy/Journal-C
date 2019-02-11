//
//  DLEntryDetailViewController.m
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLEntryDetailViewController.h"
#import "DLEntryController.h"

@interface DLEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation DLEntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateView];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{
        if (_entry) {
            //update
            [[DLEntryController sharedInstance] updateEntry:_entry withTitle:_titleTextField.text andBody:_bodyTextView.text];
        } else {
            //new
            DLEntry * entry = [[DLEntry alloc] initWithName:_titleTextField.text bodyText:_bodyTextView.text];
            [[DLEntryController sharedInstance] addEntry:entry];
            _entry = entry;
        }
    [self.navigationController popViewControllerAnimated:true];
}

-(void)updateView
{
    if (_entry) {
        self.title = @"Entry";
        _titleTextField.text = _entry.title;
        _bodyTextView.text = _entry.bodyText;
    }
}


@end
