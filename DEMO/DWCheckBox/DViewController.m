//
//  DViewController.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/12.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "DViewController.h"
#import "CustomCheckBoxCell.h"

@interface DViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tab;

@property (nonatomic ,strong) NSArray * cells;

@property (nonatomic ,strong) DWCheckBoxManager * mgr;

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    [self.view addSubview:self.tab];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.tableFooterView = [self footerView];
    
    CustomCheckBoxCell * cell1 = [CustomCheckBoxCell buttonWithType:(UIButtonTypeCustom)];
    [cell1 setFrame:CGRectMake(0, 0, 44, 44)];
    __weak typeof(self)weakSelf = self;
    
    ///因为要做radioBox类型，所以需要用到Mgr，故回调中操作mgr，mgr回调操作图片。若cell1与cell2无相互限制，可不实现selectedBlock，需要改变状态的事件中直接调用-cellBeSelected:image:方法
    cell1.selectedBlock = ^(BOOL selected,CustomCheckBoxCell * cell){
        if (!selected) {
            [weakSelf.mgr selectAtIndex:0];
        }
        else
        {
            [weakSelf.mgr deselectAtIndex:0];
        }
    };
    CustomCheckBoxCell * cell2 = [CustomCheckBoxCell buttonWithType:(UIButtonTypeCustom)];
    [cell2 setFrame:CGRectMake(0, 0, 44, 44)];
    cell2.selectedBlock = ^(BOOL selected,CustomCheckBoxCell * cell){
        if (!selected) {
            [weakSelf.mgr selectAtIndex:1];
        }
        else
        {
            [weakSelf.mgr deselectAtIndex:1];
        }
    };
    self.cells = @[cell1,cell2];
    
    self.mgr = [[DWCheckBoxManager alloc] initWithCountOfBoxes:self.cells.count multiSelect:NO defaultSelect:@[@0] selectedChangeBlock:^(DWCheckBoxManager *mgr, id currentSelect, NSString *identifier) {
        [weakSelf handleCellWithCurrentSelect:currentSelect];
    }];
    self.mgr.selectedImage = [UIImage imageNamed:@"爱心-1"];
    self.mgr.unSelectedImage = [UIImage imageNamed:@"爱心"];
    
    [self handleCellWithCurrentSelect:self.mgr.currentSelected];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",self.mgr.currentSelected);
}

-(UIView *)footerView
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 414, 600)];
    label.text = @"1.把他放在TableView并不是一个最好的应用，毕竟TableView自带选择模式，不过我真想不到一个合适的情景你要自定义Container了\n2.可能你会发现自定义container方式使用起来略显繁琐，这是因为为了解耦，即你可以单独使用DWCheckBoxView中的任意一个类配合其他自主实现的类进行扩展，所以我将cell的改变用回调回调出来，回调中操作manager，manager回调中改变cell这种方式去实现自定义。不过这真的是你使用这个类最繁琐的一种情况了，因为这种情况中你相当于只用到了我的manager类。如果不考虑耦合性，我将cell与manager同时写在container里面，的确更加简单，不过会降低定制的可能。\n3.事实上除非你本质上就不需要一个容器类，例如本例，否则你可以借助我提供的容器类DWCheckBoxView作为容器，他将自动替你实现cell的selectedBlock。（但是自定义cell还是需要回调block）\n4.事实上你唯一可能需要自定义的只有layout其他的你也可以直接调用DWCheckBoxView的api进行定制";
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}

-(void)handleCellWithCurrentSelect:(id)currentSelect
{
    NSArray * arr = nil;
    if (currentSelect) {
        arr = @[currentSelect];
    }
    __weak typeof(self)weakSelf = self;
    [self.cells enumerateObjectsUsingBlock:^(id<DWCheckBoxCellProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([arr containsObject:@(idx)]) {
            [obj cellBeSelected:YES withImage:weakSelf.mgr.selectedImage];
        }
        else
        {
            [obj cellBeSelected:NO withImage:weakSelf.mgr.unSelectedImage];
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
        CustomCheckBoxCell * check = self.cells[indexPath.row];
        check.tag = 10000;
        [cell addSubview:check];
        check.center = cell.center;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
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

@end
