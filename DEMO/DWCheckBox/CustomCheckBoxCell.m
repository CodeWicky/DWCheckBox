//
//  CustomCheckBoxCell.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/14.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "CustomCheckBoxCell.h"

@implementation CustomCheckBoxCell
@synthesize selectedBlock,isSelected;
+(instancetype)buttonWithType:(UIButtonType)buttonType
{
    CustomCheckBoxCell * btn = [super buttonWithType:buttonType];
    if (btn) {
        [btn addTarget:btn action:@selector(BtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return btn;
}

-(void)BtnAction:(UIButton *)sender
{
    if (self.selectedBlock) {
        self.selectedBlock(self.isSelected,self);
    }
}

-(void)cellBeSelected:(BOOL)selected withImage:(UIImage *)image
{
    self.isSelected = selected;
    [self setImage:image forState:(UIControlStateNormal)];
}

@end
