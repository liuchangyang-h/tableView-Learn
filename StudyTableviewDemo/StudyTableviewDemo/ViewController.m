//
//  ViewController.m
//  StudyTableviewDemo
//
//  Created by 朱信磊 on 2017/11/18.
//  Copyright © 2017年 com.bandou.app.studyTableview. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView   *tab;

@end

@implementation ViewController

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
    _tab = [[UITableView alloc]initWithFrame:self.view.bounds];
    [_tab setDataSource:self];
    [_tab setDelegate:self];
    [_tab setShowsVerticalScrollIndicator:false];
    [_tab setShowsHorizontalScrollIndicator:false];
    [_tab setTableFooterView:[[UIView alloc]init]];
    [self.view addSubview:_tab];
}




#pragma mark - tableviewDataSouth

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"tabview样式%ld",indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            StyOneViewController *vc = [[StyOneViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            StyTwoViewController *vc = [[StyTwoViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
  
            
        default:
            break;
    }
}



@end
