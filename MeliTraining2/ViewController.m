//
//  ViewController.m
//  MeliTraining2
//
//  Created by jgyonzo on 4/21/14.
//  Copyright (c) 2014 Mercadopago. All rights reserved.
//

#import "ViewController.h"
#import "ReplaceTitleViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Replace Title"]) {
        ReplaceTitleViewController *rtcontroller = (ReplaceTitleViewController *) segue.destinationViewController;
        rtcontroller.customTitle = self.inputTextField.text;
    }
}

@end
