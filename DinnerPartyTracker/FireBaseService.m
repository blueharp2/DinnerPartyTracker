//
//  FireBaseService.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 3/17/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "FireBaseService.h"
#import <Firebase/Firebase.h>


@implementation FireBaseService

//const NSString *MY_ROOT_URL = @"https://dinnerpartytracker.firebaseio.com";

+(void)saveToFireBase: (NSString *)test{
    Firebase *myRootURL = [[Firebase alloc] initWithUrl: @"https://dinnerpartytracker.firebaseio.com"];

    [myRootURL setValue:test];
}


+(void)readFromFirebase{
    Firebase *myRootURL = [[Firebase alloc] initWithUrl: @"https://dinnerpartytracker.firebaseio.com"];
    
[myRootURL observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
    NSLog(@"%@ -> %@", snapshot.key, snapshot.value);
}];

}




@end
