//
//  UIView+EmptyData.m
//  DKusedCar
//
//  Created by li on 2018/5/27.
//  Copyright © 2018年 danke. All rights rDKerved.
//

#import "UIView+EmptyData.h"
#import <objc/runtime.h>
#import "UIView+DKExtension.h"

#ifndef YYSYNTH_DYNAMIC_PROPERTY_OBJECT
#define YYSYNTH_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
[self willChangeValueForKey:@#_getter_]; \
objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _association_); \
[self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
return objc_getAssociatedObject(self, @selector(_setter_:)); \
}
#endif
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

typedef NS_ENUM(NSInteger, ModelType) {
    PresentType = 0,
    PushType = 1,
};

static NSString *emptyplaceholderImageviewKey = @"emptyplaceholderImageviewKey";
static NSString *emptyDesLabelKey = @"emptyDesLabelKey";
static NSString *emptyDetailsDesLabelKey = @"emptyDetailsDesLabelKey";
static NSString *emptyButtonKey = @"emptyButtonKey";

@interface UIView ()

@end
@implementation UIView (EmptyData)

- (void)viewDisplayWithImageName:(NSString *)name ifNecessaryForRowCount:(NSUInteger) rowCount  {
    [self imageName:name desText:nil detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PushType emptyBtnBlock:nil];
}
- (void)viewDisplayWithDesText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount{
    [self imageName:nil desText:des detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PushType emptyBtnBlock:nil];
}
- (void)viewDisplayWithDesText:(NSString *)des detailsDesText:(NSString *)detailsDes ifNecessaryForRowCount:(NSUInteger) rowCount{
    [self imageName:nil desText:des detailsDesText:detailsDes buttonTitle:nil buttonColor:nil count:rowCount modelType:PushType emptyBtnBlock:nil];
}

-(void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount{
    [self imageName:imageName desText:des detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PushType emptyBtnBlock:nil];
}

-(void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des detailsDesText:(NSString *)detailsDes buttonTitle:(NSString *)btnTitle ifNecessaryForRowCount:(NSUInteger)rowCount emptyBtnBlock:(EmptyBtnBlock)emptyBtnBlock
{
    [self imageName:imageName desText:des detailsDesText:detailsDes buttonTitle:btnTitle buttonColor:nil count:rowCount modelType:PushType emptyBtnBlock:emptyBtnBlock];
}

- (void)viewDisplayWithImageName:(NSString *)imageName desText:(NSString *)des detailsDesText:(NSString *)detailsDes buttonTitle:(NSString *)btnTitle buttonColor:(UIColor *)btnColor ifNecessaryForRowCount:(NSUInteger)rowCount emptyBtnBlock:(EmptyBtnBlock)emptyBtnBlock
{
    [self imageName:imageName desText:des detailsDesText:detailsDes buttonTitle:btnTitle buttonColor:btnColor count:rowCount modelType:PushType emptyBtnBlock:emptyBtnBlock];
}

- (void)viewPresentDisplayWithImageName:(NSString *)name ifNecessaryForRowCount:(NSUInteger) rowCount  {
    [self imageName:name desText:nil detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PresentType emptyBtnBlock:nil];
}
- (void)viewPresentDisplayWithDesText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount{
    [self imageName:nil desText:des detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PresentType emptyBtnBlock:nil];
}
- (void)viewPresentDisplayWithImageName:(NSString *)name desText:(NSString *)des ifNecessaryForRowCount:(NSUInteger) rowCount  {
    [self imageName:name desText:des detailsDesText:nil buttonTitle:nil buttonColor:nil count:rowCount modelType:PresentType emptyBtnBlock:nil];
}

-(void)imageName:(NSString *)imageName desText:(NSString *)des detailsDesText:(NSString *)detailsDes buttonTitle:(NSString *)btnTitle buttonColor:(UIColor *)btnColor count:(NSUInteger)rowCount modelType:(ModelType)type emptyBtnBlock:(EmptyBtnBlock)emptyBtnBlock{
    
    if (rowCount == 0) {
        if (imageName) {
            self.emptyplaceholderImageview.image = [UIImage imageNamed:imageName];
            [self.emptyplaceholderImageview mas_makeConstraints:^(MASConstraintMaker *make) {
                if (type==PushType) {
                    make.centerY.mas_equalTo(self).mas_offset(-kOriginY);
                }else{
                    make.centerY.mas_equalTo(self).mas_offset(-44);
                }
                make.centerX.mas_equalTo(self);
                make.size.mas_equalTo(CGSizeMake(self.dk_width/2, self.dk_width/2));
            }];
        }
        if (des&&des.length>0) {
            self.emptyDesLabel.text=des;
            [self.emptyDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                if (type==PushType) {
                    make.centerY.mas_equalTo(!kStringIsEmpty(imageName) ? self.emptyplaceholderImageview.mas_bottom : self).mas_offset(!kStringIsEmpty(imageName) ? -10 : -kOriginY);
                }else{
                    make.centerY.mas_equalTo(imageName ? self.emptyplaceholderImageview.mas_bottom : self).mas_offset(imageName ? -10 : -44);
                }
                make.centerX.mas_equalTo(self);
            }];
            
            
        }
        
        if (detailsDes&&detailsDes.length>0) {
            self.emptyDetailsDesLabel.text=detailsDes;
            [self.emptyDetailsDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                if (type == PushType) {
                    if (kStringIsEmpty(des) && kStringIsEmpty(imageName)) {
                        make.centerY.mas_equalTo(self).mas_offset(-kOriginY);
                    } else {
                        make.top.mas_equalTo(!kStringIsEmpty(des) ? self.emptyDesLabel.mas_bottom : self.emptyplaceholderImageview.mas_bottom).mas_offset(15);
                    }
                } else {
                    if (kStringIsEmpty(des) && kStringIsEmpty(imageName)) {
                        make.centerY.mas_equalTo(self).mas_offset(-44);
                    } else {
                        make.top.mas_equalTo(!kStringIsEmpty(des) ? self.emptyDesLabel.mas_bottom : self.emptyplaceholderImageview.mas_bottom).mas_offset(15);
                    }
                }
                make.centerX.mas_equalTo(self);
            }];

            
        }
        
        if (btnTitle&&btnTitle.length>0) {
            [self.emptyButton addActionHandler:^(NSInteger tag) {
                !emptyBtnBlock ?: emptyBtnBlock();
            }];
            [self.emptyButton setTitle:btnTitle forState:UIControlStateNormal];
            !btnColor ?: [self.emptyButton setBackgroundImage:[UIImage imageWithColor:btnColor] forState:UIControlStateNormal];
            [self.emptyButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(200*KIphoneWH, 40*KIphoneWH));
                if (type == PushType) {
                    if (kStringIsEmpty(imageName) && kStringIsEmpty(des) && kStringIsEmpty(detailsDes)) {
                        make.centerY.mas_equalTo(self).mas_offset(-kOriginY);
                    } else {
                        make.top.mas_equalTo(!kStringIsEmpty(detailsDes) ? self.emptyDetailsDesLabel.mas_bottom : !kStringIsEmpty(des) ? self.emptyDesLabel.mas_bottom : self.emptyplaceholderImageview.mas_bottom).mas_offset(15);
                    }
                } else {
                    if (kStringIsEmpty(imageName) && kStringIsEmpty(des) && kStringIsEmpty(detailsDes)) {
                        make.centerY.mas_equalTo(self).mas_offset(-44);
                    } else {
                        make.top.mas_equalTo(!kStringIsEmpty(detailsDes) ? self.emptyDetailsDesLabel.mas_bottom : !kStringIsEmpty(des) ? self.emptyDesLabel.mas_bottom : self.emptyplaceholderImageview.mas_bottom).mas_offset(15);
                    }
                }
                make.centerX.mas_equalTo(self);
            }];
        }
    } else {
        [self hideViewDisplay];
    }
}

//YYSYNTH_DYNAMIC_PROPERTY_OBJECT(emptyplaceholderImageview, setEmptyplaceholderImageview,RETAIN , UIImageView*);
//YYSYNTH_DYNAMIC_PROPERTY_OBJECT(emptyDesLabel, setEmptyDesLabel,RETAIN , UILabel*);
//YYSYNTH_DYNAMIC_PROPERTY_OBJECT(emptyDetailsDesLabel, setEmptyDetailsDesLabel,RETAIN , UILabel*);
//YYSYNTH_DYNAMIC_PROPERTY_OBJECT(emptyButton, setEmptyButton, RETAIN, UIButton *);
YYSYNTH_DYNAMIC_PROPERTY_OBJECT(emptyBtnBlock, setEmptyBtnBlock, COPY, EmptyBtnBlock);

-(void)hideViewDisplay{
    if (self.emptyplaceholderImageview) {
        [self.emptyplaceholderImageview removeFromSuperview];
    }
    if (self.emptyDesLabel) {
        [self.emptyDesLabel removeFromSuperview];
    }
    
    if (self.emptyDetailsDesLabel) {
        [self.emptyDetailsDesLabel removeFromSuperview];
    }
    if (self.emptyButton) {
        [self.emptyButton removeFromSuperview];
    }
}

#pragma mark - lazy loading

- (UIImageView *)emptyplaceholderImageview
{
    UIImageView *emptyplaceholderImageview = objc_getAssociatedObject(self, &emptyplaceholderImageviewKey);
    if (!emptyplaceholderImageview) {
        emptyplaceholderImageview = [[UIImageView alloc]init];
        emptyplaceholderImageview.contentMode=UIViewContentModeScaleAspectFit;
        objc_setAssociatedObject(self, &emptyplaceholderImageviewKey, emptyplaceholderImageview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addSubview:emptyplaceholderImageview];
    return emptyplaceholderImageview;
}
- (UILabel *)emptyDesLabel
{
    UILabel *emptyDesLabel = objc_getAssociatedObject(self, &emptyDesLabelKey);
    if (!emptyDesLabel) {
        emptyDesLabel = [[UILabel alloc]init];
        emptyDesLabel.font=[UIFont systemFontOfSize:17];
        emptyDesLabel.textAlignment =NSTextAlignmentCenter;
        emptyDesLabel.textColor=TEXT_COLOR_C;
        emptyDesLabel.numberOfLines=0;
        objc_setAssociatedObject(self, &emptyDesLabelKey, emptyDesLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addSubview:emptyDesLabel];
    return emptyDesLabel;
}

- (UILabel *)emptyDetailsDesLabel
{
    UILabel *emptyDetailsDesLabel = objc_getAssociatedObject(self, &emptyDetailsDesLabelKey);
    if (!emptyDetailsDesLabel) {
        emptyDetailsDesLabel = [[UILabel alloc]init];
        emptyDetailsDesLabel.font=[UIFont systemFontOfSize:TEXT_SIZE_D];
        emptyDetailsDesLabel.textAlignment =NSTextAlignmentCenter;
        emptyDetailsDesLabel.textColor=TEXT_COLOR_C;
        emptyDetailsDesLabel.numberOfLines=0;
        objc_setAssociatedObject(self, &emptyDetailsDesLabelKey, emptyDetailsDesLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addSubview:emptyDetailsDesLabel];
    return emptyDetailsDesLabel;
}

- (UIButton *)emptyButton
{
    UIButton *emptyButton = objc_getAssociatedObject(self, &emptyButtonKey);
    if (!emptyButton) {
        emptyButton = [[UIButton alloc]init];
        emptyButton.layer.cornerRadius = 20*KIphoneWH;
        emptyButton.layer.masksToBounds = YES;
        [emptyButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [emptyButton setBackgroundImage:[UIImage imageWithColor:RGB(237, 85, 85) size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        objc_setAssociatedObject(self, &emptyButtonKey, emptyButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addSubview:emptyButton];
    return emptyButton;
}
@end
