//
//  DiskDetailTableViewController.m
//  MeliTraining2
//
//  Created by jgyonzo on 4/21/14.
//  Copyright (c) 2014 Mercadopago. All rights reserved.
//

#import "DiskDetailTableViewController.h"

@interface DiskDetailTableViewController ()

@end

@implementation DiskDetailTableViewController

-(void) setDiskTitle:(NSString *)diskTitle
{
    NSString *plistDisksPath = [[NSBundle mainBundle] pathForResource:@"disksDetail" ofType:@"plist"];
    NSDictionary *disksDetails = [[NSDictionary alloc] initWithContentsOfFile:plistDisksPath];
    if (disksDetails[diskTitle]) {
        _diskTitle = diskTitle;
        self.diskDetail = disksDetails[diskTitle];
    }else{
        NSLog(@"Disk not found");
        _diskTitle = @"Not Found";
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.diskTitle;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.diskDetail count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Songs";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"song" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.diskDetail objectAtIndex:indexPath.row];
    
    return cell;
}

@end
