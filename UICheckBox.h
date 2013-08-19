//
//  UICheckBox.h
//  UICheckBox
//
//  Created by 斌 on 13-8-19.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICheckBox : UIView{
    
    NSArray *arLblName;
    
    BOOL multiple;
}

@property (nonatomic,retain)NSString *strSel;

- (id)initWithAr:(NSArray*)arLbl;

- (void)setMultiple:(BOOL)selMultiple;

- (void)setHorizontally:(int)num;// 1:默认支持15个中文 2:支持6个中文 3：支持3个中文

- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state;

- (NSString*)getStrSel;

@end
