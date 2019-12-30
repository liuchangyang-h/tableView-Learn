//
//  StyOneViewController.m
//  StudyTableviewDemo
//
//  Created by 朱信磊 on 2017/11/18.
//  Copyright © 2017年 com.bandou.app.studyTableview. All rights reserved.
//

#import "StyOneViewController.h"

@interface StyOneViewController () <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView   *tab;

@end

@implementation StyOneViewController

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
    [self.navigationItem setTitle:@"Plain样式"];
    _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tab setDataSource:self];
    [_tab setDelegate:self];
    [_tab setShowsVerticalScrollIndicator:false];
    [_tab setShowsHorizontalScrollIndicator:false];
    [_tab setTableHeaderView:[self headerView]];
    [self.view addSubview:_tab];
}


- (UIView *)headerView{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
    [v setBackgroundColor:[UIColor yellowColor]];
    {
        UILabel *lb = [[UILabel alloc]initWithFrame:v.bounds];
        [lb setFont:[UIFont systemFontOfSize:16]];
        [lb setTextColor:[UIColor lightGrayColor]];
        [lb setTextAlignment:NSTextAlignmentCenter];
        [lb setText:@"tableview的HeaderView,可以自定义这个view"];
        [v addSubview:lb];
    }
    return v;
}


#pragma mark - tableviewDataSouth

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
            if (cell==nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
                [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
            }
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
            if (cell==nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
            if (cell==nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
                [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
            }
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
            if (cell==nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[NSString stringWithFormat:@"Cell%ld",indexPath.row]];
            }
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
   
        default:
            break;
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"样式%ld",indexPath.row]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"样式%ld详情",indexPath.row]];
    [cell.imageView setImage:[UIImage imageNamed:@"icon"]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

#pragma mark - tableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
