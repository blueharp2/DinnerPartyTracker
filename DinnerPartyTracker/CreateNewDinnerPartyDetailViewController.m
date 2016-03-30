//
//  CreateNewDinnerPartyDetailViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/14/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyDetailViewController.h"
#import <Firebase/Firebase.h>
#import "CreateNewDinnerPartyViewController.h"
#import "MenuItems.h"

@interface CreateNewDinnerPartyDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *menuItemTextField;
@property (weak, nonatomic) IBOutlet UITextField *cookbookTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextFiled;

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
    [self.urlTextFiled setDelegate:self];
    self.saveMenuItemButton.layer.cornerRadius = 4;
    
}

- (IBAction)saveMenuItemButtonPressed:(UIButton *)sender {
    [self.menuItemTextField resignFirstResponder];
    [self.cookbookTextField resignFirstResponder];
    [self.urlTextFiled resignFirstResponder];
    
    NSString *menuItem = self.menuItemTextField.text;
    NSString *cookBook = self.cookbookTextField.text;
    
    NSString *urlBase = @"http://";
    NSString *urlString = [urlBase stringByAppendingString:self.urlTextFiled.text];
    NSURL *url = [NSURL URLWithString:urlString];
    //NSLog(@"%@",url);
    //Might want to add some extra protection incase someone copies and pastes the url.  In that case the http:// is already there. 
    
    [self.createNewDinnerPartyDetailDelegate didSaveMenuItems:menuItem cookBook:cookBook url:url];
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
