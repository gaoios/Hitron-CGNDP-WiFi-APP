//
//  HWMainViewController.m
//  HitronWifi
//
//  Created by Chunhui Li on 6/8/16.
//  Copyright © 2016 Movit. All rights reserved.
//

#import "HWMainViewController.h"
#import "HWRouterService.h"

@interface HWMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    NSArray *cellInfos;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *ssidNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *upSpeedLabel;
@end

@implementation HWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.scrollEnabled = NO;
    cellInfos = @[@{@"title":@"Jone's Phone",@"image":[UIImage imageNamed:@"icon_jonephone"]}
                 ,@{@"title":I18NString(@"Notification", nil),@"image":[UIImage imageNamed:@"icon_otification"]}
                 ,@{@"title":I18NString(@"Network Mapping", nil),@"image":[UIImage imageNamed:@"icon_networkmapping"]}
                 ,@{@"title":I18NString(@"User Management", nil),@"image":[UIImage imageNamed:@"icon_usermanageme"]}
                 ,@{@"title":I18NString(@"Advanced Settings", nil),@"image":[UIImage imageNamed:@"icon_setting"]}
                 ,@{@"title":I18NString(@"About", nil),@"image":[UIImage imageNamed:@"icon_about"]}];
    
    
//    NSArray *aa = [NEHotspotHelper supportedNetworkInterfaces];
//    for(NEHotspotNetwork *hotspotNetwork in [NEHotspotHelper supportedNetworkInterfaces]) {
//        double signalStrength = hotspotNetwork.signalStrength;
//        NSLog(@"%@ --  %@", hotspotNetwork.SSID,signalStrength);
//    }
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    NSString *ssidName = [HWUtility wifiName];
    _ssidNameLabel.text = ssidName.length?ssidName:I18NString(@"Not Connected", nil);
    
    [HWRouterService routerStatusWithResult:^(BOOL isSuccess, NSString *errorMsg, id res) {
        if (isSuccess) {
            double downSpeed = [res[@"downSpeed"] doubleValue]/1024.0;
            double upSpeed = [res[@"upSpeed"] doubleValue]/1024.0;
            _downSpeedLabel.text = FStr(@"%.0fMB/S",downSpeed);
            _upSpeedLabel.text = FStr(@"%.0fMB/S",upSpeed);
        }
    }];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row) {
        return SCREEN_HEIGHT*0.58;
    } else {
        return SCREEN_HEIGHT*0.42;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float w = SCREEN_WIDTH/3.0;
    float h = SCREEN_HEIGHT*0.29;
    if (SCREEN_HEIGHT>=568) {
        h -= 40;
    }
    return CGSizeMake(w, h);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (SCREEN_HEIGHT<568) {
        return UIEdgeInsetsZero;
    } else {
        return UIEdgeInsetsMake(30, 0, 30, 0);
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return cellInfos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *iv = [cell viewWithTag:10];
    UILabel *label = [cell viewWithTag:11];
    NSDictionary *cellInfo = cellInfos[indexPath.row];
    iv.image = cellInfo[@"image"];
    label.text = cellInfo[@"title"];
    
    if (indexPath.row == 0) {
        iv.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"uaer_father"]];
    } else {
        iv.backgroundColor = nil;
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 4:
            [self performSegueWithIdentifier:@"toSettings" sender:nil];
            break;
            
        default:
            break;
    }
}
@end
