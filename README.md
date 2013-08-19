UICheckBox
==========

自定义多选/单选框

- (id)initWithAr:(NSArray*)arLbl;//初始化

- (void)setMultiple:(BOOL)selMultiple;//设置多选/单选

- (void)setHorizontally:(int)num;// 1:默认支持15个中文 2:支持6个中文 3：支持3个中文

- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state;//设置按钮

- (NSString*)getStrSel;//获取选中





example
==========
    NSArray *arLbl =[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    UICheckBox *chk =[[UICheckBox alloc]initWithAr:arLbl];
    chk.frame=CGRectMake(0, 0, 320, 100);
    [chk setMultiple:YES];
    [chk setBtnBackgroundImage:[UIImage imageNamed:@"btn_check_off.png"] forState:UIControlStateNormal];
    [chk setBtnBackgroundImage:[UIImage imageNamed:@"btn_check_on.png"] forState:UIControlStateHighlighted];
    [chk setBtnBackgroundImage:[UIImage imageNamed:@"btn_check_on.png"] forState:UIControlStateSelected];
    [chk setHorizontally:3];
    [self.view addSubview:chk];
