//
//  ListTableViewController.h
//  Exercices
//
//  Created by Jigar Jarsania on 7/13/20.
//  Copyright © 2020 Julien Nicco. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ReturnDelegate
- (void)returnValue:(NSInteger)value;
@end

@interface ListTableViewController : UITableViewController

@property (nonatomic, weak) id <ReturnDelegate> delegate;
@property(nonatomic,assign) BOOL isBackFromDetails;
@end

NS_ASSUME_NONNULL_END
