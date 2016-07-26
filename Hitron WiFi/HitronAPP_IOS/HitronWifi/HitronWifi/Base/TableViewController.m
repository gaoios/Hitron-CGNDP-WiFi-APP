//
//  TableViewController.m
//  linju
//
//  Created by Nathan.Li on 9/30/15.
//  Copyright © 2015 Movit. All rights reserved.
//

#import "TableViewController.h"
//#import "BaiduMobStat.h"

@interface TableViewController ()
@property (strong, nonatomic) UIView *emptyView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BG_GRAY;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [[BaiduMobStat defaultStat] pageviewStartWithName:[NSString stringWithUTF8String:object_getClassName(self)]];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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

- (void)viewIsEmpty:(BOOL)empty {
    if (empty) {
        if (!_emptyView) {
            self.emptyView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 149, 170)];
            [self.view addSubview:_emptyView];
            _emptyView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-62.5);
            
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 149, 125)];
            iv.image = [UIImage imageNamed:@"Pic_01"];
            [_emptyView addSubview:iv];
            
            UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, 149, 30)];
            lb.textAlignment = NSTextAlignmentCenter;
            lb.textColor = [UIColor darkGrayColor];
            lb.text = I18NString(@"暂时没有数据", nil);
            [_emptyView addSubview:lb];
        }
        _emptyView.hidden = NO;
    } else {
        _emptyView.hidden = YES;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return [UIView new];
//}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
