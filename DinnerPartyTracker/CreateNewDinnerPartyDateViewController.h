//
//  CreateNewDinnerPartyDateViewController.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/23/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateNewDinnerPartyViewController.h"
#import "DinnerParty.h"

@protocol CreateNewDinnerPartyDateViewControllerDelegate <NSObject>

-(void)didFinishSelectingDate:(NSDate *)dateOfDinnerParty;

@end



@interface CreateNewDinnerPartyDateViewController : UIViewController

@property(nonatomic, assign) id<CreateNewDinnerPartyDateViewControllerDelegate> createNewDinnerPartyDateDelegate;

-(void)doneButtonSelected:(UIBarButtonItem *)sender;

@end
