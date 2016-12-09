//
//  OWMeter.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "OWMeter.h"
#import "OWPointer.h"

#define self_width self.frame.size.width
#define self_height self.frame.size.height
#define   OWDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)

@interface OWMeter()

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) OWPointer *pointer;

@end

@implementation OWMeter
- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        _color = color;
        self.backgroundColor = [UIColor clearColor];
        
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    CGFloat scale = self_height / 100.0;
    CGFloat height;
    if (self_height >= 100.0) {
        height = 15.0;
    } else {
        height = 15.0 * scale;
    }
    
    CGFloat X = 9.0;
    CGFloat Y = self_height - height/2;
    CGFloat width = (self_width / 2 - 9.0 + height/2) * 20 / 19;
    CGRect frame = CGRectMake(X, Y, width, height);
    _pointer = [[OWPointer alloc] initWithFrame:frame color:_color];
//    _pointer.layer.anchorPoint = CGPointMake(self_width *19 / 20 - self_height/2, self_height / 2);
    [self addSubview:_pointer];
}

- (void)drawRect:(CGRect)rect {
    //semi-circle
    CGFloat scale = self_height / 100.0;
    CGFloat lineWidth;
    if (self_height >= 100.0) {
        lineWidth = 5.0;
    } else {
        lineWidth = 5.0 * scale;
    }
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.height - lineWidth - 2.0 startAngle:OWDegreesToRadians(180) endAngle:OWDegreesToRadians(360) clockwise:YES];
    path.lineCapStyle = kCGLineCapSquare;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = lineWidth;
    UIColor *strokeColor = [UIColor lightGrayColor];
    [strokeColor set];
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.height - lineWidth - 2.0 startAngle:OWDegreesToRadians(180) endAngle:OWDegreesToRadians(240) clockwise:YES];
    path1.lineCapStyle = kCGLineCapSquare;
    path1.lineJoinStyle = kCGLineJoinRound;
    path1.lineWidth = lineWidth + 4.0;
    UIColor *strokeColor1 = _color;
    [strokeColor1 set];
    [path1 stroke];
}

@end
