//
//  MenuItems.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/11/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "MenuItems.h"

@implementation MenuItems

@dynamic menuItemName;
@dynamic cookboookName;

-(id)initWithMenuItemName:(NSString *)menuItemName
             cookbookName:(NSString *)cookbookName{
    
    if ((self = [super init])) {
        self.menuItemName = menuItemName;
        self.cookboookName = cookbookName;
    }
    return self;
}




@end
