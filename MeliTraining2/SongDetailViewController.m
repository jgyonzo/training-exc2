//
//  SongDetailViewController.m
//  MeliTraining2
//
//  Created by jgyonzo on 4/21/14.
//  Copyright (c) 2014 Mercadopago. All rights reserved.
//

#import "SongDetailViewController.h"

@interface SongDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratinLabel;

@end

@implementation SongDetailViewController

- (IBAction)closeButtonToched:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI
{
    self.songNameLabel.text = self.songInfo[@"Title"];
    self.durationLabel.text = self.songInfo[@"Duration"];
    self.ratinLabel.text = [NSString stringWithFormat:@"Rating: %@", self.songInfo[@"Rating"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
