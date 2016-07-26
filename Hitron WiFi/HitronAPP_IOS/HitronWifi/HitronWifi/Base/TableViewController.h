//
//  TableViewController.h
//  linju
//
//  Created by Nathan.Li on 9/30/15.
//  Copyright © 2015 Movit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWUtility.h"
@interface TableViewController : UITableViewController
- (IBAction)leftHeaderBtnPressed:(id)sender;
- (IBAction)rightHeaderBtnPressed:(id)sender;


- (void)viewIsEmpty:(BOOL)empty;
@end
