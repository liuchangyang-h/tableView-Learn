//
//  StyTwoViewController.m
//  StudyTableviewDemo
//
//  Created by 朱信磊 on 2017/11/18.
//  Copyright © 2017年 com.bandou.app.studyTableview. All rights reserved.
//

#import "StyTwoViewController.h"

@interface StyTwoViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView   *tab;

@end

@implementation StyTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView{
    [super loadView];
    [self.navigationItem setTitle:@"Group样式"];
    _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tab setDataSource:self];
    [_tab setDelegate:self];
    [_tab setShowsVerticalScrollIndicator:false];
    [_tab setShowsHorizontalScrollIndicator:false];
    _tab.tableFooterView = [[UIView alloc]init]; //去除多余的分割线
    [_tab setTableHeaderView:[self headerView]];
    [self.view addSubview:_tab];
}

- (UIView *)headerView{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
    [v setBackgroundColor:[UIColor yellowColor]];
    {

        UIButton *lb = [[UIButton alloc] init] ;
        [lb setBackgroundColor:[UIColor whiteColor]] ;
        [lb setFrame:CGRectMake(20, 20, 10, 20)] ;
        [v addSubview:lb] ;

//        UILabel *bt = [[UILabel alloc]initWithFrame:v.bounds];
//        [bt setFont:[UIFont systemFontOfSize:16]];
//        [bt setTextColor:[UIColor lightGrayColor]];
//        [bt setTextAlignment:NSTextAlignmentCenter];
//        [bt setText:@"tableview的HeaderView,可以自定义这个view"];
//        [v addSubview:bt];
    }
    return v;
}


#pragma mark - tableviewDataSouth

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if ((indexPath.section == 0) && (indexPath.row == 0)) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"]; //UITableViewCellStyleDefault, 左侧显示textLabel（不显示detailTextLabel），imageView可选（显示在最左边）
            [cell setAccessoryType:UITableViewCellAccessoryNone]; //没有任何的样式
            
            [cell.textLabel setText:@"你三姑"];
            [cell.imageView setImage:[UIImage imageNamed:@"icon"]];
        }
    }
    else if ((indexPath.section == 0) && (indexPath.row == 1)){
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"]; //UITableViewCellStyleValue1, 左侧显示textLabel、右侧显示detailTextLabel（默认灰色），imageView可选（显示在最左边）
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark]; //cell的右边有一个小箭头，距离右边有十几像素
            
            [cell.textLabel setText:@"你大爷"];
            [cell.imageView setImage:[UIImage imageNamed:@"icon"]];
            [cell.detailTextLabel setText:@"呵呵"];
        }
    }
    else if ((indexPath.section == 1) && (indexPath.row == 0)){
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell2"]; //UITableViewCellStyleValue2, 左侧依次显示textLabel(默认蓝色)和detailTextLabel，imageView可选（显示在最左边）
            [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton]; //cell右边有一个蓝色的圆形button；
            
            [cell.textLabel setText:@"你在哪"];
            [cell.imageView setImage:[UIImage imageNamed:@"icon"]];
            [cell.detailTextLabel setText:@"世界"];
        }
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell3"]; //UITableViewCellStyleSubtitle, 左上方显示textLabel，左下方显示detailTextLabel（默认灰色）,imageView可选（显示在最左边）
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark]; //cell右边的形状是对号
            
            [cell.textLabel setText:@"在你家"];
            [cell.detailTextLabel setText:@"你下面"];
            [cell.imageView setImage:[UIImage imageNamed:@"icon"]];
        }
    }
    
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 100;
    }else if (section==1){
        return 20;
    }
    return 0;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 1;
//}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 100)];
        [v setBackgroundColor:[UIColor lightGrayColor]];
        {
            UILabel *lb = [[UILabel alloc]initWithFrame:v.bounds];
            [lb setFont:[UIFont systemFontOfSize:14]];
            [lb setTextColor:[UIColor blackColor]];
            [lb setTextAlignment:NSTextAlignmentCenter];
            [lb setText:@"section0的Header,可以自定义这个view"];
            [v addSubview:lb];
        }
        return v;
    }
    return nil;
}





#pragma mark - tableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
