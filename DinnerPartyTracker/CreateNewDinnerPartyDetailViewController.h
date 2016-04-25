//
//  CreateNewDinnerPartyDetailViewController.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/14/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "CreateNewDinnerPartyViewController.h"
#import "DinnerParty.h"
#import "MenuItems.h"

@protocol CreateNewDinnerPartyDetailViewControllerDelegate <NSObject>

-(void)didSaveMenuItems:(NSString *)menuItem cookBook:(NSString *)cookBookTitle url:(NSURL *)url;

@end



@interface CreateNewDinnerPartyDetailViewController : UIViewController

@property(nonatomic, assign) id<CreateNewDinnerPartyDetailViewControllerDelegate> createNewDinnerPartyDetailDelegate;

- (IBAction)saveMenuItemButtonPressed:(UIButton *)sender;

@end
