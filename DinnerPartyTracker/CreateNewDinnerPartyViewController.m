//
//  CreateNewDinnerPartyViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 1/4/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyViewController.h"

@interface CreateNewDinnerPartyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *DateOfDinnerPartyTextField;
@property (weak, nonatomic) IBOutlet UITextField *GuestsNamesTextField;
@property (weak, nonatomic) IBOutlet UITableView *MenuItemsTableVIew;

@end

@implementation CreateNewDinnerPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
