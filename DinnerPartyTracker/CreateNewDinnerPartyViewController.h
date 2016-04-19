//
//  CreateNewDinnerPartyViewController.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 1/4/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "DinnerParty.h"
#import "CreateNewDinnerPartyDateViewController.h"
#import "MenuItems.h"

@interface CreateNewDinnerPartyViewController : UIViewController 

@property (strong, nonatomic)DinnerParty *dinnerParty;
@property (strong, nonatomic)NSDate *dateOfDinnerParty;
@property (strong, nonatomic)NSString *guestsNames;
@property (strong, nonatomic)MenuItems *menuItems;
@property (strong, nonatomic)NSMutableDictionary *menuItemsDictionary;
@property (strong, nonatomic)NSMutableArray<NSMutableDictionary *> *menuItemsArray;

@end
