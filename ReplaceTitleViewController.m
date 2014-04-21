//
//  ReplaceTitleViewController.m
//  MeliTraining2
//
//  Created by jgyonzo on 4/21/14.
//  Copyright (c) 2014 Mercadopago. All rights reserved.
//

#import "ReplaceTitleViewController.h"

@interface ReplaceTitleViewController ()
@end

@implementation ReplaceTitleViewController

- (void) setCustomTitle:(NSString *)customTitle
{
    _customTitle = customTitle;
    if (self.view.window) {
        [self updateUI];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI
{
    self.title = self.customTitle;
}
@end
