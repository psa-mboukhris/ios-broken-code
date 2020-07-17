//
//  TableViewController.m
//  Exercices
//
//  Created by Julien Nicco on 13/08/2019.
//  Copyright © 2019 Julien Nicco. All rights reserved.
//

#import "TableViewController.h"
#import "Exercices-Swift.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/* ---------------
 
    Launch DetailViewController programmaticaly here
 
 -----------------*/

- (void) pushDetailViewController:(NSString*)rowValue {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.stringDetail = [NSString stringWithFormat:@"%@", rowValue];
    [self.navigationController pushViewController:detailVC animated:YES];
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


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row + 1;
    if (row % 2 == 0) {
        [self pushDetailViewController:[NSString stringWithFormat:@"%ld", row]];
    } else {
        ViewController *rootController = self.navigationController.viewControllers[0];
        rootController.stringResult = [NSString stringWithFormat:@"%ld", (long)row];

        [self.navigationController popToViewController:rootController animated:true];
    }
}

@end
