//
//  UIView+NetTipView.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights reserved.
//

#import "UIView+NetTipView.h"

@implementation NetTipView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.txtLabel];
        [self addSubview:self.button];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self).mas_offset(-100);
        }];
        
        [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(155, 40));
            make.centerX.mas_equalTo(self.imageView);
            make.centerY.mas_equalTo(self).mas_offset(50);
        }];
    }
    return self;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        _imageView.image=[UIImage imageNamed:@"abnormalNet"];
        [self addSubview:_imageView];
        
    }
    return _imageView;
}
- (UILabel *)txtLabel
{
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
        _txtLabel.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 38);
        _txtLabel.backgroundColor = [UIColor clearColor];
        _txtLabel.textColor = [UIColor lightGrayColor];
        _txtLabel.text = descText;
        _txtLabel.textAlignment = NSTextAlignmentCenter;
        _txtLabel.font = [UIFont systemFontOfSize:15];
    }
    return _txtLabel;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [_button setBackgroundColor:LIGHT_BACKGROUND_COLOR];
        //        _button.layer.cornerRadius = 20;
        //        _button.layer.borderWidth = 0.5;
        //        _button.layer.borderColor=UIColorFromRGB(0xa39d97).CGColor;
        //        [_button setTitle:buttontitle forState:UIControlStateNormal];
        //        [_button setTitleColor:UIColorFromRGB(0xa39d97) forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"reloading.png"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"reloading_press.png"] forState:UIControlStateHighlighted];
        _button.titleLabel.font = [UIFont systemFontOfSize:19];
        [_button addTarget:self
                    action:@selector(btnClick:)
          forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnClick:(UIButton *)sender
{
    if (_toDoBlock) {
        _toDoBlock();
    }
}

@end

@implementation UIView (NetworkError)


- (NetTipView *)getNetTipView
{
    UIView *view = [self getViewWithTag:kNetTipViewTag];
    if (view && [view isKindOfClass:[NetTipView class]]){
        
        return (NetTipView *)view;
    }
    else
    {
        return nil;
    }
}

- (void)showNetTipViewWithToDoBlock:(NetTipBlock)block
{
    NetTipView *view = [self getNetTipView];
    if (!view) {
        view = [[NetTipView alloc] init];
        view.backgroundColor= LIGHT_BACKGROUND_COLOR;
        view.tag = kNetTipViewTag;
        view.toDoBlock = block;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(49);
            
        }];
    }
}
- (void)showNoNavigationNetTipViewWithToDoBlock:(NetTipBlock)block
{
    NetTipView *view = [self getNetTipView];
    if (!view) {
        view = [[NetTipView alloc] init];
        view.backgroundColor= LIGHT_BACKGROUND_COLOR;
        view.tag = kNetTipViewTag;
        view.toDoBlock = block;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self).mas_offset(NavBarHeight);
            make.bottom.mas_equalTo(self).mas_offset(49);
            
        }];
    }
}

- (void)hideNetTipView
{
    NetTipView *view = [self getNetTipView];
    
    if (view) {
        [view removeFromSuperview];
    }
}

- (BOOL)isShowingNetTipView
{
    return [self getNetTipView]?YES:NO;
}

- (UIView *)getViewWithTag:(NSInteger)tag
{
    for (UIView *view in self.subviews)
    {
        if (view.tag == tag) {
            return view;
            break;
        }
    }
    return nil;
}



@end
