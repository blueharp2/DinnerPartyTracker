//
//  CreateNewDinnerPartyDateViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/23/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyDateViewController.h"
#import "CreateNewDinnerPartyViewController.h"

@interface CreateNewDinnerPartyDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation CreateNewDinnerPartyDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDateViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Date View Controller and Date Picker

-(void)setupDateViewController{
//    [[UINavigationBar appearance] setTitleTextAttributes:@{
//            NSFontAttributeName: [UIFont fontWithName:@"Futura" size:16.0f]
//                                                           }];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];
}


-(void)doneButtonSelected:(UIBarButtonItem *)sender{
    NSDate *dateOfDinnerParty = [self.datePicker date];
    [self.createNewDinnerPartyDateDelegate didFinishSelectingDate: dateOfDinnerParty];
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
