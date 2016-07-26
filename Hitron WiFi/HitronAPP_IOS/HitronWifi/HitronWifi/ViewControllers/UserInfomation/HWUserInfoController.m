//
//  HWUserInfoController.m
//  HitronWifi
//
//  Created by Neo Gao on 16/6/7.
//  Copyright © 2016年 Movit. All rights reserved.
//

#import "HWUserInfoController.h"
#import "HWBaseCell.h"
#import "HWBaseCellModel.h"
#import "HWUserManager.h"
#import "HWUser.h"

@interface HWUserInfoController ()
{
    NSMutableArray *m_cellItems;
    HWUser *m_currentUser;
}

@end

@implementation HWUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //
    [self.tableView setSeparatorInset:(UIEdgeInsetsMake(0, -8, 0, 0))];
    
    //Get The User Info
    [[HWUserManager getInstance] getAllUserSucess:^(NSArray *users){
        HWUser *user = [users objectAtIndex:0];
        
        [[HWUserManager getInstance] getUser:user Sucess:^(HWUser *responseUser){
            NSLog(@"%@",responseUser);
            m_currentUser = responseUser;
            
            //View Data
            NSArray *viewItemsSection1 =@[@{@"cell_icon":@"ico_1.png",@"cell_title":@"Reset Password"},
                                  @{@"cell_icon":@"ico_2.png",@"cell_title":@"Binding Device"},
                                  @{@"cell_icon":@"ico_3.png",@"cell_title":@"Setting"},
                                  ];
            
            NSMutableArray *viewItemModelsPart1 = [HWBaseCellModel objectArrayWithKeyValuesArray:viewItemsSection1];
            if (m_currentUser) {
                [viewItemModelsPart1 insertObject:m_currentUser atIndex:0];
            }
            
            NSArray *viewItemSection2 = @[  @{@"cell_title":@"Application"},
                                            @{@"cell_title":@"Sign Out"}];
            NSArray *viewItemModelsPart2 = [HWBaseCellModel objectArrayWithKeyValuesArray:viewItemSection2];
            m_cellItems = [NSMutableArray arrayWithObjects:viewItemModelsPart1, viewItemModelsPart2, nil];
        
            //refresh the table
            __weak typeof(self) weakself = self;
            [weakself.tableView reloadData];
        } Failure:^(NSError *err){
            
        }];
    } Failure:^(NSError *err){
        
    }];
}


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (m_cellItems) {
        return [m_cellItems count];
    }else{
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (m_cellItems) {
        if (section == 0) {
            return [m_cellItems[0] count];
        }else{
            return [m_cellItems[1] count];;
        }
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"";
    if (indexPath.section == 0 && indexPath.row == 0) {
        identifier = [NSString stringWithFormat:@"HWUserAvatorCell"];
    }else{
        identifier = [NSString stringWithFormat:@"HWUserTitleIconCell"];
    }
    if (indexPath.section == 1) {
        identifier = [NSString stringWithFormat:@"HWUserTitleCell"];
    }
    
    HWBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        Class cellClass = NSClassFromString(identifier);
        cell = [[cellClass  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    id cellModel = [[m_cellItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [(HWBaseCell *)cell configureCellWithModel:cellModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *controllerIdentifier = @"";
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
            
            }
                break;
            case 1:{
                controllerIdentifier = [NSString stringWithFormat:@"resetPassword"];
            }
                break;
            case 2:{
                controllerIdentifier = [NSString stringWithFormat:@"bindingDevices"];
            }
                break;
            case 3:{
                controllerIdentifier = [NSString stringWithFormat:@"setting"];
            }
                break;
            default:
                break;
        }
        
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"User"bundle:nil];
        UITableViewController *detailViewController=[board instantiateViewControllerWithIdentifier:controllerIdentifier];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }else{
        switch (indexPath.row) {
            case 0:{
                //controllerIdentifier = [NSString stringWithFormat:@"appAccess"];
                [[HWUserManager getInstance]doTempAccessSucess:^(BOOL suc){
                    if (suc) {
                        [HWUtility showAlertView:I18NString(@"Success", nil) message:I18NString(@"OK", nil)];
                    }
                } Failure:^(NSError *err){
                    [HWUtility showAlertView:I18NString(@"Error", nil) message:I18NString(@"Request failed!", nil)];
                }];
            }
                break;
            case 1:{
                //controllerIdentifier = [NSString stringWithFormat:@"signOut"];
                [[HWUserManager getInstance]doUserLogoutSucess:^(BOOL suc){
                    if (suc) {
                        //
                        HWUser *user = [[HWUser alloc]init];
                        user.name = @"";
                        user.userID = @"";
                        
                        if (m_cellItems) {
                            id bm = [[m_cellItems objectAtIndex:0]objectAtIndex:0];
                            if ([bm isKindOfClass:[HWUser class]]) {
                                [[m_cellItems objectAtIndex:0]replaceObjectAtIndex:0 withObject:user];
                            }
                        }
    
                        [HWUtility showAlertView:I18NString(@"Success", nil) message:I18NString(@"OK", nil)];
                        
                        //[self.tableView reloadData];
                    }
                } Failure:^(NSError *err){
                    [HWUtility showAlertView:I18NString(@"Success", nil) message:I18NString(@"Request failed!", nil)];
                }];
            }
                break;
            default:
                break;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 200;
    }else{
        return 80;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 40;
    }
}






@end
