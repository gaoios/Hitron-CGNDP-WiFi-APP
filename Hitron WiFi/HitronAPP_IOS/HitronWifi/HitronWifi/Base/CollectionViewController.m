//
//  CollectionViewController.m
//  PiLife
//
//  Created by Chunhui Li on 12/2/15.
//  Copyright © 2015 Movit. All rights reserved.
//

#import "CollectionViewController.h"
//#import "BaiduMobStat.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [[BaiduMobStat defaultStat] pageviewStartWithName:[NSString stringWithUTF8String:object_getClassName(self)]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftHeaderBtnPressed:(id)sender {
    NSArray *vcs = self.navigationController.childViewControllers;
    if (vcs.count && vcs[0] == self) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)rightHeaderBtnPressed:(id)sender {
    
}

@end
