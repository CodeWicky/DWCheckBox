//
//  AViewController.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/13.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "AViewController.h"
#import "DWCheckBox.h"
@interface AViewController ()

@property (nonatomic ,strong) DWCheckBoxView * check;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DWCheckBoxView * view = [[DWCheckBoxView alloc] initWithFrame:CGRectMake(0, 64, 414, 672) multiSelect:YES titles:@[@"这个水果名特别长，比屏幕长，估计换行啊，因为后面还有字",@"苹果",@"奇异果",@"这个水果名也不短，所以这里应该换行了",@"香蕉",@"大鸭梨",@"还有一堆水果"] defaultSelect:nil];
    [self.view addSubview:view];
    self.check = view;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",self.check.currentSelected);
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
