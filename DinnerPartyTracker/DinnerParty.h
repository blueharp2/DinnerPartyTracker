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






//@dynamic dateOfDinnerParty;
//@dynamic guestsNames;
//@dynamic menuItems;
//
//-(id)initWithDateOfDinnerParty:(NSDate *)dateOfDinnerParty
//                   guestsNames:(NSString *)guestsNames
//                     menuItems:(MenuItems *)menuItems{
//    if ((self = [super init])) {
//        self.dateOfDinnerParty = dateOfDinnerParty;
//        self.guestsNames = guestsNames;
//        self.menuItems = menuItems;
@end
