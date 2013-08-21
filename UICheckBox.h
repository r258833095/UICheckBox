//
//  UICheckBox.h
//  UICheckBox
//
//  Created by 斌 on 13-8-19.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    UICheckBoxTpyeDefault = 0, //默认，按钮在左方
    UICheckBoxTpyeBtnOnRight,  //按钮在右方，仅一行支持6个中文，num无效
    UICheckBoxTpyeBtnAtBottom, //按钮在底部，自动排列
    
}CheckBoxType;

@interface UICheckBox : UIView{
    
    NSArray *arLblName;
    
    BOOL multiple;
}

@property (nonatomic,retain)NSString *strSel;

- (id)initWithAr:(NSArray*)arLbl;

- (void)setMultiple:(BOOL)selMultiple;

- (void)setType:(CheckBoxType)type;


- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state;

- (NSString*)getStrSel;

@end
