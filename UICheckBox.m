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
        
       
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(14, 16+35*index, 30, 30)];
    [btn setTag:index+1];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
                
                
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(52, 20+35*index, 255, 21)];
    lbl.tag=index+11;
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

- (void)setHorizontally:(int)num{

    switch (num) {
        case 2:
            for (int index=0; index<row ; index++) {
                UIButton *btn = (UIButton*)[self viewWithTag:index+1];
                btn.frame=CGRectMake((index%2==0?14:166), 16+35*(index/2), 30, 30);
                
                
                UILabel *lbl = (UILabel*)[self viewWithTag:index+11];
                lbl.frame=CGRectMake((index%2==0?52:204), 20+35*(index/2), 102, 21);
            }
            break;
        case 3:
            for (int index=0; index<row ; index++) {
                UIButton *btn = (UIButton*)[self viewWithTag:index+1];
                btn.frame=CGRectMake(14+(index%3)*98, 16+35*(index/3), 30, 30);
                
                
                UILabel *lbl = (UILabel*)[self viewWithTag:index+11];
                lbl.frame=CGRectMake(52+(index%3)*98, 20+35*(index/3), 58, 21);
            }
            break;
        default:
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
