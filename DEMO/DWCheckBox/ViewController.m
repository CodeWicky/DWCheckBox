//
//  ViewController.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/12.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "ViewController.h"
#import "DWTableViewHelper.h"
#import "VCModel.h"
#import "DefaultCell.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"

@interface ViewController ()<DWTableViewHelperDelegate>

@property (nonatomic ,strong) UITableView * mainTab;

@property (nonatomic ,strong) DWTableViewHelper * helper;

@property (nonatomic ,strong) NSMutableArray * dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTab];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.helper.multiSelect = NO;
    });
}

-(void)dw_TableView:(__kindof UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[AViewController new] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[BViewController new] animated:YES];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[CViewController new] animated:YES];
    } else if (indexPath.row == 3) {
        [self.navigationController pushViewController:[DViewController new] animated:YES];
    }
}

-(UITableView *)mainTab
{
    if (!_mainTab) {
        _mainTab = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        self.helper = [[DWTableViewHelper alloc] initWithTabV:_mainTab dataSource:self.dataArr];
        self.helper.helperDelegate = self;
    }
    return _mainTab;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        NSArray * titleArr = @[@"标准使用",@"定制Layout",@"定制cell",@"定制容器"];
        [titleArr enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            VCModel * model = [VCModel new];
            model.title = obj;
            model.cellClassStr = NSStringFromClass([DefaultCell class]);
            model.cellID = [NSString stringWithFormat:@"%@%@",NSStringFromClass([self class]),model.cellClassStr];
            [_dataArr addObject:model];
        }];
    }
    return _dataArr;
}

@end
