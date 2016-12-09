//
//  OWMeterView.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "OWMeterView.h"
#import "OWMeter.h"

#define self_width self.frame.size.width
#define self_height self.frame.size.height

@interface OWMeterView()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGFloat decimalValue;
@property (nonatomic, strong) UIView *backGroudView;
@property (nonatomic, strong) OWMeter *meterView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIButton *hiddenButton;

@end

@implementation OWMeterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - data
-(void)setDataSource:(id<OWMeterViewDataSource>)dataSource
{
    _dataSource = dataSource;
    [self initData];
    [self setUI];
}

- (void)initData
{
    if ([self.dataSource respondsToSelector:@selector(titleOnMeter:)]) {
        _title = [self.dataSource titleOnMeter:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(colorOneMeter:)]) {
        _color = [self.dataSource colorOneMeter:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(backGroudViewOneMeter:)]) {
        _backGroudView = [self.dataSource backGroudViewOneMeter:self];
    }
}

#pragma mark - UI
- (void)setUI
{
    [self setBackGroud];
    
    [self setMeterView];
    
    [self setTitleLabel];
}

- (void)setBackGroud
{
    self.backgroundColor = [UIColor whiteColor];
    
    if (_backGroudView) {
        _backGroudView.frame = self.bounds;
        [self addSubview:_backGroudView];
    }
}

- (void)setMeterView
{
    CGFloat height_scale = 100.0 / 215.0;
    CGFloat top_scale = 20.0 / 215.0;
    
    CGFloat height;
    CGFloat Y;
    if (self_height >= 215.0) {
        height = 100.0;
        Y = 20.0;
    } else {
        height = height_scale * self_height;
        Y = 20.0 * top_scale;
    }
    
    CGFloat X = (self_width - 2 * height) / 2;
    CGFloat width = 2 * height;
    CGRect frame = CGRectMake(X, Y, width, height);
    _meterView = [[OWMeter alloc] initWithFrame:frame color:_color];
    [self addSubview:_meterView];
}

- (void)setTitleLabel
{
    
}

#pragma mark - animation starts
- (void)animationStartsWithValue:(CGFloat)value totalValue:(CGFloat)totalValue
{
    _decimalValue = value / totalValue;
    
}

@end
