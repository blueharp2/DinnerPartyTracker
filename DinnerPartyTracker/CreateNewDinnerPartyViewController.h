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

@interface CreateNewDinnerPartyViewController : UIViewController 

@property (strong, nonatomic)DinnerParty *dinnerParty;
@property (strong, nonatomic)NSDate *dateOfDinnerParty;
@property (strong, nonatomic)NSString *guestsNames;


@end
