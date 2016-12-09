//
//  OWSemicircle.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/9.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "OWSemicircle.h"

#define self_width self.frame.size.width
#define self_height self.frame.size.height
#define   OWDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)

@interface OWSemicircle()

@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat radius;

@end

@implementation OWSemicircle

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color lineWidth:(CGFloat)lineWidth radius:(CGFloat)radius
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _color = color;
        _lineWidth = lineWidth;
        _radius = radius;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGPoint center = CGPointMake(self_width / 2, 0);
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:_radius startAngle:OWDegreesToRadians(0) endAngle:OWDegreesToRadians(180) clockwise:YES];
    path1.lineWidth = _lineWidth;
    UIColor *strokeColor1 = _color;
    [strokeColor1 set];
    [path1 stroke];
}

@end
