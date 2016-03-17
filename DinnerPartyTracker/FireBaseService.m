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
    NSLog(test);
    [myRootURL setValue:test];
}




//Code below has no error messages...but I don't think that's what I want.
//Firebase *myRootURL = nil;
//
//+(void)initialize{
//    if (!myRootURL) {
//        myRootURL = [[Firebase alloc] initWithUrl: @"https://dinnerpartytracker.firebaseio.com"];
//    }
//}
//
//-(id)init {
//    self = [super init];
//    if (self) {
//        [myRootURL setValue:@"Do you have data?"];
//    }
//    return self;
//}


//Firebase *myRootURL = [[Firebase alloc] initWithUrl: @"https://dinnerpartytracker.firebaseio.com"];
//
//// Create a reference to a Firebase database URL (Example from Firebase)
//Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com"];
//// Write data to Firebase
//[myRootRef setValue:@"Do you have data? You'll love Firebase."];




@end
