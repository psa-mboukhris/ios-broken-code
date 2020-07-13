//
//  ViewController.m
//  Exercices
//
//  Created by Julien Nicco on 13/08/2019.
//  Copyright © 2019 Julien Nicco. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewController.h"

@interface ViewController () <ReturnDelegate>

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stringResult = @"To Define";
}
- (IBAction)btnClicked:(UIButton *)sender {
     UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ListTableViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"ListTableViewController"];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)returnValue:(NSInteger)value{
    self.stringResult = [NSString stringWithFormat:@"%ld", value];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setResultLabelText:self.stringResult];
}

-(void)setResultLabelText:(NSString*)text{
    self.resultLabel.text = [NSString stringWithFormat:@"Result : %@", text];
}

 #pragma mark - Navigation
 

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     
 }




@end
