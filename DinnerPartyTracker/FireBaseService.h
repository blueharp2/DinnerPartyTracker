//
//  FireBaseService.h
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/17/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "DinnerParty.h"

@interface FireBaseService : NSObject

//extern const NSString *MY_ROOT_URL;

+(void)saveToFireBase: (NSString *)test;


@end
