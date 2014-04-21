//
//  DiskDetailTableViewController.m
//  MeliTraining2
//
//  Created by jgyonzo on 4/21/14.
//  Copyright (c) 2014 Mercadopago. All rights reserved.
//

#import "DiskDetailTableViewController.h"
#import "SongDetailViewController.h"

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"song" forIndexPath:indexPath];
    
    NSDictionary *songDetail = (NSDictionary *)[self.diskDetail objectAtIndex:indexPath.row];
    
    cell.textLabel.text = songDetail[@"Title"];
    cell.detailTextLabel.text = songDetail[@"Duration"];
    
    return cell;
}

#define HEADER_HEIGHT 100.0
#define HEADER_IMAGE_WIDTH 100.0

//Draws a custom view for the header instructions
-(UIView*)tableView:(UITableView*) tableView viewForHeaderInSection:(NSInteger)section;
{
    if ([tableView numberOfRowsInSection:section] != 0){
        // create the parent view that will hold header Label
        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, tableView.frame.size.width, HEADER_HEIGHT)];
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@ Cover",self.diskTitle]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(0.0, 0.0, HEADER_IMAGE_WIDTH, HEADER_HEIGHT);

        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.highlightedTextColor = [UIColor blackColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:14];
        headerLabel.frame = CGRectMake(HEADER_IMAGE_WIDTH, 0.0, tableView.frame.size.width - HEADER_IMAGE_WIDTH, HEADER_HEIGHT);
        
        headerLabel.text = [NSString stringWithFormat:@"%@ (%lu songs)",self.diskTitle,[self.diskDetail count]];
        
        [customView addSubview:imageView];
        [customView addSubview:headerLabel];
        
        return customView;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HEADER_HEIGHT;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show Song Detail"]) {
        SongDetailViewController *sdcontroller = (SongDetailViewController *) segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        sdcontroller.songInfo = [self.diskDetail objectAtIndex:selectedIndexPath.row];
    }
}
@end
