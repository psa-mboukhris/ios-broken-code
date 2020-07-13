//
//  ListTableViewController.m
//  Exercices
//
//  Created by Jigar Jarsania on 7/13/20.
//  Copyright © 2020 Julien Nicco. All rights reserved.
//

#import "ListTableViewController.h"
#import "Exercices-Swift.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController
NSInteger selectedIndex = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isBackFromDetails = false;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
    if(_isBackFromDetails == true){
        [self.delegate returnValue:selectedIndex];
        [self.navigationController popViewControllerAnimated:true];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DefaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row + 1];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row + 1;
    selectedIndex = indexPath.row + 1;
    if (row % 2 == 0) {
        
        [self pushDetailViewController:[NSString stringWithFormat:@"%ld", row]];
    }
    else {
        [self.delegate returnValue:selectedIndex];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/* ---------------
 
    Launch DetailViewController programmaticaly here
 
 -----------------*/

-(void)pushDetailViewController:(NSString*)rowValue {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    controller.screenName = rowValue;
    self.isBackFromDetails = true;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
