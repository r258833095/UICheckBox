//
//  UICheckBox.m
//  UICheckBox
//
//  Created by 斌 on 13-8-19.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "UICheckBox.h"

@implementation UICheckBox
@synthesize strSel;

static NSInteger row;
- (id)initWithAr:(NSArray *)arLbl
{
    self = [super init];
    if (self) {
        arLblName = arLbl;
        row = [arLblName count];
        [self btnInit];
    }
    return self;
}

-(void)btnInit{
    
    for (int index=0; index<row ; index++) {
        
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0+35*index, 30, 30)];
        [btn setTag:index+1];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
        
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(38, 4+35*index, 255, 21)];
        lbl.tag=index+11;
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.font=[UIFont systemFontOfSize:17];
        lbl.text=[arLblName objectAtIndex:index];
        lbl.textColor=[UIColor blackColor];
        lbl.backgroundColor=[UIColor clearColor];
        [self addSubview:lbl];
        
        
    }
    
    
}

- (void)btnAction:(UIButton*)btn{
    
    if (!multiple) {
        for (int index=0; index<row ; index++) {
            UIButton *btnOther = (UIButton*)[self viewWithTag:index+1];
            btnOther.selected = NO;
        }
    }
    
    btn.selected=! btn.selected;
    
}

- (void)setMultiple:(BOOL)selMultiple{
    multiple = selMultiple;
}

- (void)setType:(CheckBoxType)type{
    
    switch (type) {
            
        case UICheckBoxTpyeBtnOnRight:
            for (int index=0; index<row ; index++) {
                UIButton *btn = (UIButton*)[self viewWithTag:index+1];
                btn.frame=CGRectMake(110, 0+35*index, 30, 30);
                
                
                UILabel *lbl = (UILabel*)[self viewWithTag:index+11];
                lbl.frame=CGRectMake(0, 4+35*index, 102, 21);
                lbl.textAlignment = NSTextAlignmentLeft;
            }
            break;
            
        case UICheckBoxTpyeBtnAtBottom:
            for (int index=0; index<row ; index++) {
                UILabel *lbl = (UILabel*)[self viewWithTag:index+11];
                lbl.textAlignment = NSTextAlignmentCenter;
                CGSize sizeName = [lbl.text sizeWithFont:lbl.font
                                       constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                                           lineBreakMode:NSLineBreakByWordWrapping];
                
                if (sizeName.width < 34) {//小于34直接赋值为34
                    sizeName.width = 34;
                }
                
                if (index == 0) {
                    
                    lbl.frame=CGRectMake(0 , 0 , sizeName.width , 21);
                    
                }else{
                    
                    UILabel *lblFront = (UILabel*)[self viewWithTag:index+10];
                    float widthLbl = lblFront.frame.origin.x + lblFront.frame.size.width + 8 + sizeName.width;
                    
                    if (widthLbl < self.frame.size.width) {//判断文本尾部是否超过宽度
                        
                        lbl.frame=CGRectMake(lblFront.frame.origin.x + lblFront.frame.size.width + 8 , lblFront.frame.origin.y , sizeName.width , 21);
                        
                    }else{
                        
                        lbl.frame=CGRectMake(0 , lblFront.frame.origin.y + 57 , sizeName.width , 21);
                        
                    }
                    
                }
                
                UIButton *btn = (UIButton*)[self viewWithTag:index+1];
                //按钮位置=文本w/2+文本x-按钮宽/2
                float btnX = sizeName.width / 2 + lbl.frame.origin.x - 30 / 2;
                float btnY = lbl.frame.origin.y + 20;
                btn.frame=CGRectMake(btnX, btnY, 30, 30);
                
            }
            break;
        default:
            for (int index=0; index<row ; index++) {
                UIButton *btn = (UIButton*)[self viewWithTag:index+1];
                btn.frame=CGRectMake(0, 0+35*index, 30, 30);
                
                UILabel *lbl = (UILabel*)[self viewWithTag:index+11];
                lbl.frame=CGRectMake(38, 4+35*index, 255, 21);
                lbl.textAlignment = NSTextAlignmentLeft;
            }
            break;
    }

}

- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state{
    
    for (int index=0; index<row ; index++) {
        UIButton *btn =(UIButton*)[self viewWithTag:index+1];
        [btn setBackgroundImage:image forState:state];
    }
}


- (NSString*)getStrSel{
    strSel = @"";
    
    for (int index=0; index<row ; index++) {
        UIButton *btn =(UIButton*)[self viewWithTag:index+1];
        if (btn.selected==YES) {
            strSel =[strSel stringByAppendingFormat:@"%D",btn.tag];
        }
    }
    return strSel;
}

@end
