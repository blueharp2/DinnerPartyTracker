//
//  CreateNewDinnerPartyViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 1/4/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyViewController.h"
#import <Firebase/Firebase.h>
#import "MenuItems.h"
#import "DinnerParty.h"


@interface CreateNewDinnerPartyViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateOfDinnerPartyTextField;
@property (weak, nonatomic) IBOutlet UITextField *guestsNamesTextField;
@property (weak, nonatomic) IBOutlet UITableView *menuItemsTableVIew;
@property (weak, nonatomic) IBOutlet UIButton *addMenuItemButton;

@end

@implementation CreateNewDinnerPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addMenuItemButton.layer.cornerRadius = 4;
   // [self setupMainViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupMainViewController{
    [self.dateOfDinnerPartyTextField setDelegate:self];
    [self.guestsNamesTextField setDelegate:self];
    self.menuItemsTableVIew.delegate = self;
    self.menuItemsTableVIew.dataSource = self;
    self.addMenuItemButton.layer.cornerRadius = 4;
}

#pragma mark - UITableView Protocol Functions

-(UITableViewCell *)tableview:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.menuItemsTableVIew dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
    

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


@end
