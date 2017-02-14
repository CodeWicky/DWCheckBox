//
//  CViewController.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/14.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "CViewController.h"
#import "DWCheckBox.h"
#import "CustomCheckBoxCell.h"
@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DWCheckBoxDefaultLayout * layout = [DWCheckBoxDefaultLayout new];
    
    CustomCheckBoxCell * cell1 = [CustomCheckBoxCell buttonWithType:(UIButtonTypeCustom)];
    [cell1 setFrame:CGRectMake(0, 0, 44, 44)];
    CustomCheckBoxCell * cell2 = [CustomCheckBoxCell buttonWithType:(UIButtonTypeCustom)];
    [cell2 setFrame:CGRectMake(0, 0, 44, 44)];
    NSArray * cells = @[cell1,cell2];
    
    DWCheckBoxManager * manager = [[DWCheckBoxManager alloc] initWithCountOfBoxes:cells.count multiSelect:NO defaultSelect:@[@1] selectedChangeBlock:^(DWCheckBoxManager *mgr, id currentSelect, NSString *identifier) {
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
    [self.view addSubview:view];
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
