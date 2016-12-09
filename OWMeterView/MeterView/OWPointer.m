//
//  OWPointer.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "OWPointer.h"

#define self_width self.frame.size.width
#define self_height self.frame.size.height
#define   OWDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)

@interface OWPointer()

@property (nonatomic, strong) UIColor *color;

@end

@implementation OWPointer

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _color = color;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self_width - self_height < (self_width/11.0) + self_height) {
        return;
    }
    
    CGFloat scale = self_width / 200.0;
    CGFloat gapWidth;
    if (self_width/2 >= 100.0) {
        gapWidth = 5.0;
    } else {
        gapWidth = 5.0 * scale;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(gapWidth, self_height/2)];
    [path addLineToPoint:CGPointMake(self_width, self_height * 0.25)];
    [path addLineToPoint:CGPointMake(self_width, self_height * 0.75)];
    UIColor *strokeColor = _color;
    [strokeColor set];
    [path fill];
    
    
    CGPoint center = CGPointMake(self_width *19 / 20 - self_height/2, self_height / 2);
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:self_height/2 startAngle:OWDegreesToRadians(0) endAngle:OWDegreesToRadians(360) clockwise:YES];
    UIColor *strokeColor1 = _color;
    [strokeColor1 set];
    [path1 fill];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:self_height/4 startAngle:OWDegreesToRadians(0) endAngle:OWDegreesToRadians(360) clockwise:YES];
    UIColor *strokeColor2 = [UIColor whiteColor];
    [strokeColor2 set];
    [path2 fill];
}

@end
