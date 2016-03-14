//
//  CreateNewDinnerPartyDetailViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/14/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyDetailViewController.h"

@interface CreateNewDinnerPartyDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *menuItemTextField;
@property (weak, nonatomic) IBOutlet UITextField *cookbookTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveMenuItemButton;
- (IBAction)saveMenuItemButtonPressed:(UIButton *)sender;

@end

@implementation CreateNewDinnerPartyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDetailViewController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupDetailViewController{
    [self.menuItemTextField setDelegate:self];
    [self.cookbookTextField setDelegate:self];
    self.saveMenuItemButton.layer.cornerRadius = 4;
    
}

- (IBAction)saveMenuItemButtonPressed:(UIButton *)sender {
    [self.menuItemTextField resignFirstResponder];
    [self.cookbookTextField resignFirstResponder];
    
    
}
@end
