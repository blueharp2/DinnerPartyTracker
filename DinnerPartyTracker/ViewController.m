//
//  ViewController.m
//  DinnerPartyTracker
//
//  Created by Lindsey on 1/1/16.
//  Copyright © 2016 Lindsey Boggio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *ExistingDinnerPartyButton;

@property (weak, nonatomic) IBOutlet UIButton *CreateNewDinnerPartyButton;



- (IBAction)CreateNewDinnerPartyButtonPressed:(id)sender;
- (IBAction)ExistingDinnerPartyButtonPressed:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpButtons];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)setUpButtons {
//    self.CreateNewDinnerPartyButton.titleEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
//    self.ExistingDinnerPartyButton.titleEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    
    self.CreateNewDinnerPartyButton.layer.cornerRadius = 4;
    self.ExistingDinnerPartyButton.layer.cornerRadius = 4;
    
}


- (IBAction)CreateNewDinnerPartyButtonPressed:(id)sender {
    //show segue to CreateNewDinnerParty VC
    
}

- (IBAction)ExistingDinnerPartyButtonPressed:(id)sender {
    //show segue to ExistingDinnerParty VC
    
}
@end
