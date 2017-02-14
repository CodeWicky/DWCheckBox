//
//  CustomLayout.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/14.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "CustomLayout.h"

@implementation CustomLayout

-(void)layoutCheckBoxView:(UIView *)checkBoxView cells:(NSArray<UIView<DWCheckBoxCellProtocol> *> *)cells
{
    __block CGFloat originY = 0;
    [cells enumerateObjectsUsingBlock:^(UIView<DWCheckBoxCellProtocol> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint origin = CGPointMake(0, originY);
        CGRect frame = obj.frame;
        frame.origin = origin;
        obj.frame = frame;
        originY += frame.size.height + 10;
        [checkBoxView addSubview:obj];
    }];
}

@end
