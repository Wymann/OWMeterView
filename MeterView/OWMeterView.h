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
- (UIColor *)colorOneMeter:(OWMeterView *)meterView;
- (UIView *)backGroudViewOneMeter:(OWMeterView *)meterView;

@end

@protocol OWMeterViewDelegate <NSObject>

@optional

- (void)animationFinishedOnMeter:(OWMeterView *)meterView;

@end

@interface OWMeterView : UIView

@property (nonatomic, weak) id <OWMeterViewDataSource> dataSource;
@property (nonatomic, weak) id <OWMeterViewDelegate> delegate;

- (void)animationStartsWithValue:(CGFloat)value totalValue:(CGFloat)totalValue;

@end
