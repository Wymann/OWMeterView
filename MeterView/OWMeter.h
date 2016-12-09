//
//  OWMeter.h
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWMeter : UIView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;
- (void)animationStartsWithDecimalValue:(CGFloat)decimalValue;

@end
