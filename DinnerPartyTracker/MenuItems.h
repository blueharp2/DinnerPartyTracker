//
//  MenuItems.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/11/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItems : NSObject

@property(copy, nonatomic) NSString *menuItemName;
@property(copy, nonatomic) NSString *cookboookName;
@property(copy, nonatomic) NSURL *url;

-(id)initWithMenuItemName:(NSString *)menuItemName
             cookbookName:(NSString *)cookbookName
                      url:(NSURL *)url;

@end
