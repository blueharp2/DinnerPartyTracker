//
//  CreateNewDinnerPartyViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 1/4/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "CreateNewDinnerPartyViewController.h"
#import "FireBaseService.h"
#import <Firebase/Firebase.h>
#import "MenuItems.h"
#import "CreateNewDinnerPartyDateViewController.h"
#import "CreateNewDinnerPartyDetailViewController.h"



@interface CreateNewDinnerPartyViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, CreateNewDinnerPartyDateViewControllerDelegate, CreateNewDinnerPartyDetailViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dateOfDinnerPartyTextField;
@property (weak, nonatomic) IBOutlet UITextField *guestsNamesTextField;
@property (weak, nonatomic) IBOutlet UITableView *menuItemsTableVIew;
@property (weak, nonatomic) IBOutlet UIButton *addMenuItemButton;

@end

@implementation CreateNewDinnerPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Delete these when setupMainViewController is done
    self.addMenuItemButton.layer.cornerRadius = 4;
    [self.dateOfDinnerPartyTextField setDelegate:self];
    [self.guestsNamesTextField setDelegate:self];
   
    // [self setupMainViewController];
    
    [FireBaseService saveToFireBase:@"Testing 1,2,3"];
    [FireBaseService readFromFirebase];
   

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setupMainViewController{
    [self.dateOfDinnerPartyTextField setDelegate:self];
    [self.guestsNamesTextField setDelegate:self];
    self.menuItemsTableVIew.delegate = self;
    self.menuItemsTableVIew.dataSource = self;
    self.addMenuItemButton.layer.cornerRadius = 4;
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"dinnerPartyDateSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[CreateNewDinnerPartyDateViewController class]]) {
            CreateNewDinnerPartyDateViewController *dateVC = (CreateNewDinnerPartyDateViewController *)segue.destinationViewController;
            dateVC.createNewDinnerPartyDateDelegate = self;
        }
    }
    if ([segue.identifier isEqualToString:@"segueToCreateDetailVC"]) {
        if ([segue.destinationViewController isKindOfClass:[CreateNewDinnerPartyDetailViewController class]]) {
            CreateNewDinnerPartyDetailViewController *detailVC = (CreateNewDinnerPartyDetailViewController *)segue.destinationViewController;
            detailVC.createNewDinnerPartyDetailDelegate = self;
        }
    }
}

#pragma mark - UITextField

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(self.dateOfDinnerParty == nil){
        [self.dateOfDinnerPartyTextField endEditing:YES];
        [self.dateOfDinnerPartyTextField resignFirstResponder];
    }
    if (textField == self.dateOfDinnerPartyTextField) {
        [self performSegueWithIdentifier:@"dinnerPartyDateSegue" sender:self];
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.guestsNamesTextField != nil) {
        self.guestsNames = self.guestsNamesTextField.text;

        [self.guestsNamesTextField resignFirstResponder];
        [self.guestsNamesTextField endEditing:YES];
    }
    return YES;
}


-(void)didFinishSelectingDate:(NSDate *)dateOfDinnerParty{
   if (dateOfDinnerParty != nil) {
            NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        self.dateOfDinnerPartyTextField.text = [dateFormatter stringFromDate: dateOfDinnerParty];
        [self.dateOfDinnerPartyTextField endEditing:YES];
        [self.dateOfDinnerPartyTextField resignFirstResponder];
    }
}

#pragma mark - UITableView Protocol Functions

-(UITableViewCell *)tableview:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.menuItemsTableVIew dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



#pragma mark - Save


@end
