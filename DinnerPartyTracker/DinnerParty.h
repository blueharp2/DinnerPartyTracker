//
//  DinnerParty.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/11/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItems.h"

@interface DinnerParty : NSObject

@property(copy, nonatomic) NSDate * dateOfDinnerParty;
@property(copy, nonatomic) NSString *guestsNames;
@property(strong,nonatomic)MenuItems *menuItems;


-(id)initWithDateOfDinnerParty:(NSDate *)dateOfDinnerParty
                   guestsNames:(NSString *)guestsNames
                     menuItems:(MenuItems *)menuItems;

@end
