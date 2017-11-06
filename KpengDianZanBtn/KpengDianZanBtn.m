//
//  KpengDianZanBtn.m
//  dianzanBtnDemo
//
//  Created by 王朋 on 2017/11/6.
//  Copyright © 2017年 王朋. All rights reserved.
//

#import "KpengDianZanBtn.h"

@implementation KpengDianZanBtn

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    
    self =[super initWithFrame:frame];
    [self setupUI];
    return self;
}

- (void)setupUI {
   
    [self setImage:[UIImage imageNamed:@"imgBundle.bundle/evtDetail_btn_like_n"] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font =[UIFont systemFontOfSize:14];
    [self addTarget:self action:@selector(btnActionClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnActionClick:(UIButton*)sender {
    sender.selected =!sender.selected;
    if (sender.selected) {
        [self setImage:[UIImage imageNamed:@"imgBundle.bundle/evtDetail_btn_like_c"] forState:UIControlStateNormal];
        
        __block UILabel *addLab =[[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x-20, self.frame.size.height-20, 20, 20)];
        addLab.textColor =[UIColor redColor];
        addLab.text =@"+1";
        [self addSubview:addLab];
        
        [UIView animateWithDuration:1 animations:^{
            addLab.frame =CGRectMake(self.frame.origin.x-20, -30, 20, 20);
        } completion:^(BOOL finished) {
            [addLab removeFromSuperview];
        }];
        
        
    } else {
        [self setImage:[UIImage imageNamed:@"imgBundle.bundle/evtDetail_btn_like_n"] forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:1 animations:^{
     
        [UIView animateWithDuration:1/3 animations:^{
            self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.2, 1.2);
        }];
      
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1/3 animations:^{
            self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 0.8, 0.8);

        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1/3 animations:^{
                self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.0, 1.0);
            }];
        }];
       
    }];
    
   
    
    if (_btnActionCallBack) {
        _btnActionCallBack (sender.selected,sender);
    }
    
}

-(void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
    
}




@end
