//
//  DefaultCell.m
//  DWCheckBox
//
//  Created by Wicky on 2017/2/13.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "DefaultCell.h"
#import "VCModel.h"
@implementation DefaultCell

-(void)setModel:(VCModel *)model
{
    [super setModel:model];
    self.textLabel.text = model.title;
}

@end
