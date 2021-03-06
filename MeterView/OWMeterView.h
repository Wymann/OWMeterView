//
//  OWMeterView.h
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OWMeterView;

@protocol OWMeterViewDataSource <NSObject>

@optional

- (NSString *)titleOnMeter:(OWMeterView *)meterView;
- (UIColor *)frontColorOnMeter:(OWMeterView *)meterView;
- (UIView *)backGroudViewOnMeter:(OWMeterView *)meterView;
- (UIColor *)titleColorOnMeter:(OWMeterView *)meterView;
- (UIColor *)valueColorOnMeter:(OWMeterView *)meterView;
- (UIFont *)titleFontOnMeter:(OWMeterView *)meterView;
- (UIFont *)valueFontOnMeter:(OWMeterView *)meterView;
- (UIButton *)hiddenButtonOnMeter:(OWMeterView *)meterView;

@end

@protocol OWMeterViewDelegate <NSObject>

@optional

- (void)didHiddenMeter:(OWMeterView *)meterView;
- (void)didShowMeter:(OWMeterView *)meterView;

@end

@interface OWMeterView : UIView

@property (nonatomic, weak) id <OWMeterViewDataSource> dataSource;
@property (nonatomic, weak) id <OWMeterViewDelegate> delegate;

- (void)animationStartsWithValue:(CGFloat)value totalValue:(CGFloat)totalValue;

@end
