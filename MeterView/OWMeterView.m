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
@property (nonatomic, strong) UIColor *frontColor;
@property (nonatomic) CGFloat decimalValue;
@property (nonatomic, strong) UIView *backGroudView;
@property (nonatomic, strong) OWMeter *meterView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIButton *hiddenButton;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *valueColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *ValueFont;

@end

@implementation OWMeterView
{
    BOOL hidden;
    CGRect oldRect;
}

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
    hidden = YES;
    
    CGFloat scale = self_height / 215.0;
    scale = scale >= 1 ? 1 : scale;
    
    if ([self.dataSource respondsToSelector:@selector(titleOnMeter:)]) {
        _title = [self.dataSource titleOnMeter:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(frontColorOnMeter:)]) {
        _frontColor = [self.dataSource frontColorOnMeter:self];
    }else{
        _frontColor = [UIColor blackColor];
    }
    
    if ([self.dataSource respondsToSelector:@selector(backGroudViewOnMeter:)]) {
        _backGroudView = [self.dataSource backGroudViewOnMeter:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(titleColorOnMeter:)]) {
        _titleColor = [self.dataSource titleColorOnMeter:self];
    }else{
        _titleColor = [UIColor blackColor];
    }
    
    if ([self.dataSource respondsToSelector:@selector(valueColorOnMeter:)]) {
        _valueColor = [self.dataSource valueColorOnMeter:self];
    }else{
        _valueColor = [UIColor blackColor];
    }
    
    if ([self.dataSource respondsToSelector:@selector(titleFontOnMeter:)]) {
        _titleFont = [self.dataSource titleFontOnMeter:self];
    }else{
        _titleFont = [UIFont systemFontOfSize:16.0 * scale];
    }
    
    if ([self.dataSource respondsToSelector:@selector(valueFontOnMeter:)]) {
        _ValueFont = [self.dataSource valueFontOnMeter:self];
    }else{
        _ValueFont = [UIFont systemFontOfSize:30.0 * scale];
    }
}

#pragma mark - UI
- (void)setUI
{
    [self setBackGroud];
    
    [self setMeterView];
    
    [self setTitleLabel];
    
    [self setValueLabel];

    [self setHiddenButton];
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
    CGFloat top_scale = 10.0 / 215.0;
    
    CGFloat height;
    CGFloat Y;
    if (self_height >= 215.0) {
        height = 100.0;
        Y = 10.0;
    } else {
        height = height_scale * self_height;
        Y = 10.0 * top_scale;
    }
    
    CGFloat X = (self_width - 2 * height) / 2;
    CGFloat width = 2 * height;
    CGRect frame = CGRectMake(X, Y, width, height);
    _meterView = [[OWMeter alloc] initWithFrame:frame color:_frontColor];
    [self addSubview:_meterView];
}

- (void)setTitleLabel
{
    CGFloat top_scale = 15.0 / 215.0;
    CGFloat height_scale = 21.0 / 215.0;
    CGFloat Y;
    CGFloat height;
    if (self_height >= 215.0) {
        height = 21.0;
        Y = 15.0 + _meterView.frame.origin.y + _meterView.frame.size.height;
    } else {
        height = height_scale * self_height;
        Y = self_height * top_scale + _meterView.frame.origin.y + _meterView.frame.size.height;
    }
    
    CGFloat X = 0;
    CGFloat width = self_width;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, Y, width, height)];
    _titleLabel.text = _title;
    _titleLabel.textColor = _titleColor;
    _titleLabel.font = _titleFont;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}

- (void)setValueLabel
{
    CGFloat height_scale = 30.0 / 215.0;
    CGFloat Y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height;
    CGFloat height;
    if (self_height >= 215.0) {
        height = 30.0;
    } else {
        height = height_scale * self_height;
    }
    
    CGFloat X = 0;
    CGFloat width = self_width;
    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, Y, width, height)];
    _valueLabel.text = @"test";
    _valueLabel.font = _ValueFont;
    _valueLabel.textColor = _valueColor;
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_valueLabel];
}

- (void)setHiddenButton
{
    CGFloat width_scale = 30.0 / 215.0;
    CGFloat height_scale = 20.0 / 215.0;
    CGFloat height;
    CGFloat width;
    CGFloat fontValue = 12.0;
    if (self_height >= 215.0) {
        height = 20.0;
        width = 30.0;
    } else {
        height = height_scale * self_height;
        width = width_scale * self_height;
        fontValue = 12.0 * width_scale;
    }
    CGFloat X = self_width/2 - width/2;
    CGFloat Y = self_height - height;
    
    _hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hiddenButton.backgroundColor = [UIColor lightGrayColor];
    _hiddenButton.titleLabel.font = [UIFont systemFontOfSize:fontValue];
    [_hiddenButton setTitle:@"隐藏" forState:UIControlStateNormal];
    [_hiddenButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _hiddenButton.frame = CGRectMake(X, Y, width, height);
    [_hiddenButton addTarget:self action:@selector(meterHiddenOrNotHiden) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_hiddenButton];
}

- (void)meterHiddenOrNotHiden
{
    if (hidden) {
        oldRect = _meterView.bounds;
        
    } else {
        
    }
}

#pragma mark - animation starts
- (void)animationStartsWithValue:(CGFloat)value totalValue:(CGFloat)totalValue
{
    _decimalValue = value / totalValue;
    [_meterView animationStartsWithDecimalValue:_decimalValue];
}

@end
