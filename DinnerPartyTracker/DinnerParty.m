//
//  DinnerParty.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/11/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "DinnerParty.h"
#import "MenuItems.h"

@implementation DinnerParty

@dynamic dateOfDinnerParty;
@dynamic guestsNames;
@dynamic menuItems;

-(id)initWithDateOfDinnerParty:(NSDate *)dateOfDinnerParty
                   guestsNames:(NSString *)guestsNames
                     menuItems:(MenuItems *)menuItems{
    if ((self = [super init])) {
        self.dateOfDinnerParty = dateOfDinnerParty;
        self.guestsNames = guestsNames;
        self.menuItems = menuItems;
    }
    return self;
}





@end
