//
//  HWDeviceInfoViewController.m
//  HitronWifi
//
//  Created by Chunhui Li on 6/12/16.
//  Copyright © 2016 Movit. All rights reserved.
//

#import "HWDeviceInfoViewController.h"

@interface HWDeviceInfoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UILabel *manufactoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *connectedSourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *macAddLabel;
@property (weak, nonatomic) IBOutlet UILabel *ipAddLabel;

@property (weak, nonatomic) IBOutlet UILabel *linkSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *upSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *downSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalDataLabel;

@end

@implementation HWDeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section?10:0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return section?[UIView new]:nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float session0height = SCREEN_HEIGHT<568?80:100;
    if (indexPath.section == 0) {
        return session0height;
    } else {
        return (SCREEN_HEIGHT - session0height - 64 - 20)/9;
    }
}
@end
