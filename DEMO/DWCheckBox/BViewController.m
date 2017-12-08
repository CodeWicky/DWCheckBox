//
//  BViewController.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/14.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "BViewController.h"
#import "DWCheckBox.h"
#import "CustomLayout.h"
@interface BViewController ()

@property (nonatomic ,strong) DWCheckBoxView * check;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray * cells = [DWCheckBoxView cellsFromTitles:@[@"自定制的Layout",@"我估计是一竖排",@"多说两句话凑点字"]];
    CustomLayout * layout = [CustomLayout new];
    DWCheckBoxManager * manager = [[DWCheckBoxManager alloc] initWithCountOfBoxes:cells.count multiSelect:NO defaultSelect:nil selectedChangeBlock:^(DWCheckBoxManager *mgr, id currentSelect, NSString *identifier) {
        NSArray * arr = nil;
        if (currentSelect) {
            arr = @[currentSelect];
        }
        [cells enumerateObjectsUsingBlock:^(id<DWCheckBoxCellProtocol> obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([arr containsObject:@(idx)]) {
                [obj cellBeSelected:YES withImage:mgr.selectedImage];
            } else {
                [obj cellBeSelected:NO withImage:mgr.unSelectedImage];
            }
        }];
    }];
    DWCheckBoxView * view = [[DWCheckBoxView alloc] initWithFrame:CGRectMake(0, 64, 414, 672) layout:layout manager:manager multiSelect:NO cells:cells];
    self.check = view;
    [self.view addSubview:view];
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
