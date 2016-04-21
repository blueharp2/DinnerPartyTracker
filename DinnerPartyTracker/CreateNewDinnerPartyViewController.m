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
#import "DinnerParty.h"
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
//    self.addMenuItemButton.layer.cornerRadius = 4;
//    [self.dateOfDinnerPartyTextField setDelegate:self];
//    [self.guestsNamesTextField setDelegate:self];
//    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
//   
    [self setupMainViewController];
    
    [FireBaseService saveToFireBase:@"Testing 1,2,3"];
    [FireBaseService readFromFirebase];
    

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.menuItemsTableVIew reloadData];
    
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
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];

}

#pragma mark - Segues & VC Delegates

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

-(void)didFinishSelectingDate:(NSDate *)dateOfDinnerParty{
    if (dateOfDinnerParty != nil) {
        NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        self.dateOfDinnerPartyTextField.text = [dateFormatter stringFromDate: dateOfDinnerParty];
        
        self.dateOfDinnerParty = dateOfDinnerParty;
        [self.dateOfDinnerPartyTextField endEditing:YES];
        [self.dateOfDinnerPartyTextField resignFirstResponder];
    }
}


-(void)didSaveMenuItems:(NSString *)menuItem cookBook:(NSString *)cookBookTitle url:(NSURL *)url{
    NSLog(@"%@", menuItem);
    
    if (self.menuItemsArray.count == 0){
        self.menuItemsArray = [NSMutableArray new];
    }
    
    if (self.menuItemsDictionary == nil) {
        self.menuItemsDictionary = [NSMutableDictionary new];
    }else {
        self.menuItemsDictionary = [NSMutableDictionary new];
    }
    
//    if (self.menuItemsDictionary == nil) {
//        self.menuItemsDictionary = [NSMutableDictionary new];
//    }
    
    [self.menuItemsDictionary setValue:menuItem forKey:@"Menu Item"];
    [self.menuItemsDictionary setValue:cookBookTitle forKey:@"Cookbook Title"];
    [self.menuItemsDictionary setValue:url forKey:@"url"];
    [self.menuItemsArray addObject: self.menuItemsDictionary];
}
//        MenuItems *menuItems = [MenuItems new];
//        menuItems.menuItemName = menuItem;
//        menuItems.cookboookName = cookBookTitle;
//        menuItems.url = url;

//Fix this.  It is overwriting the first entry to the array?
//    if (self.menuItemsDictionary == nil) {
//        self.menuItemsDictionary = [NSMutableDictionary new];
//        [self.menuItemsDictionary setValue:menuItem forKey:@"Menu Item"];
//        [self.menuItemsDictionary setValue:cookBookTitle forKey:@"Cookbook Title"];
//        [self.menuItemsDictionary setValue:url forKey:@"url"];
//        [self.menuItemsArray addObject: self.menuItemsDictionary];
//    }else{
//        [self.menuItemsDictionary setValue:menuItem forKey:@"Menu Item"];
//        [self.menuItemsDictionary setValue:cookBookTitle forKey:@"Cookbook Title"];
//        [self.menuItemsDictionary setValue:url forKey:@"url"];
//        [self.menuItemsArray addObject: self.menuItemsDictionary];
//    }

//    if (self.menuItemsDictionary == nil) {
//        self.menuItemsDictionary = [NSMutableDictionary new];
//        [self.menuItemsDictionary setValue:menuItem forKey:@"Menu Item"];
//        [self.menuItemsDictionary setValue:cookBookTitle forKey:@"Cookbook Title"];
//        [self.menuItemsDictionary setValue:url forKey:@"url"];
//    }
//}


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

#pragma mark - UITableView Protocol Functions

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.menuItemsTableVIew dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
    
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"menuItemCell"];
        }
    
    cell.textLabel.text = [[self.menuItemsArray objectAtIndex:indexPath.row] objectForKey:@"Menu Item"];
    cell.detailTextLabel.text = [[self.menuItemsArray objectAtIndex:indexPath.row] objectForKey:@"Cookbook Title"];
    
    
//        cell.textLabel.text = [self.menuItemsArray valueForKey:@"Menu Item"];
//        cell.detailTextLabel.text = [self.menuItemsArray valueForKey:@"Cookbook Title"];


//    cell.textLabel.text = [self.menuItemsArray valueForKey:@"Menu Item"];
//    cell.detailTextLabel.text = [self.menuItemsArray valueForKey:@"Cookbook Title"];
    
    
//    for (id item in self.menuItemsArray){
//            cell.textLabel.text = [item valueForKey:@"Menu Item"];
//            cell.detailTextLabel.text = [item valueForKey:@"Cookbook Title"];
//        }

//        cell.textLabel.text = [self.menuItemsDictionary valueForKey:@"Menu Item"];
//        cell.detailTextLabel.text = [self.menuItemsDictionary valueForKey:@"Cookbook Title"];
    
        return cell;
}
//
//-(UITableViewCell *)tableview:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [self.menuItemsTableVIew dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
//    
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"menuItemCell"];
//    }
//    
//    cell.textLabel.text = [self.menuItemsDictionary valueForKey:@"Menu Item"];
//    cell.detailTextLabel.text = [self.menuItemsDictionary valueForKey:@"Cookbook Title"];
//    
//    return cell;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return self.menuItemsDictionary.count;
    return self.menuItemsArray.count;
}



#pragma mark - Save

-(void)saveButtonSelected:(UIBarButtonItem *)sender{
//    DinnerParty *dinnerparty = [[DinnerParty alloc]initWithDateOfDinnerParty:self.dateOfDinnerParty guestsNames:self.guestsNames menuItems:self.menuItems];
    
//    DinnerParty *dinnerParty = [DinnerParty new];
//    dinnerParty.guestsNames = self.guestsNames;
    //dinnerParty.dateOfDinnerParty = self.dateOfDinnerParty;
    
}



@end
