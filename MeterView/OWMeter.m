//
//  OWMeter.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "OWMeter.h"
#import "OWPointer.h"
#import "OWSemicircle.h"
#import <POP.h>

#define self_width self.frame.size.width
#define self_height self.frame.size.height
#define   OWDegreesToRadians(degrees)  ((M_PI * degrees)/ 180)

@interface OWMeter()

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) OWPointer *pointer;
@property (nonatomic, strong) OWSemicircle *semicircle;

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
    //semi-circle
    UIView *copySelf = [[UIView alloc] initWithFrame:self.bounds];
    copySelf.backgroundColor = [UIColor clearColor];
    copySelf.clipsToBounds = YES;
    [self addSubview:copySelf];
    
    CGFloat semiscale = self_height / 100.0;
    CGFloat lineWidth;
    if (self_height >= 100.0) {
        lineWidth = 5.0;
    } else {
        lineWidth = 5.0 * semiscale;
    }
    CGFloat semiX = 0;
    CGFloat semiY = self.frame.size.height;
    CGFloat semiWidth = self.frame.size.width;
    CGFloat semiHeight = self.frame.size.height;
    _semicircle = [[OWSemicircle alloc] initWithFrame:CGRectMake(semiX, semiY, semiWidth, semiHeight) color:_color lineWidth:lineWidth + 4.0 radius:self.frame.size.height - lineWidth - 2.0];
    _semicircle.layer.anchorPoint = CGPointMake(0.5, 0);
    _semicircle.layer.position = CGPointMake(self_width/2, self_height);
    [copySelf addSubview:_semicircle];
    
    
    //pointer
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
    
    CGFloat anchorPointX = (width * 19.0/20.0 - height/2)/width;
    CGFloat anchorPointY = 0.5;
    _pointer.layer.anchorPoint = CGPointMake(anchorPointX, anchorPointY);
    _pointer.layer.position = CGPointMake(self_width/2, self_height);
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
    path.lineWidth = lineWidth;
    UIColor *strokeColor = [UIColor lightGrayColor];
    [strokeColor set];
    [path stroke];
}

- (void)animationStartsWithDecimalValue:(CGFloat)decimalValue
{
    POPSpringAnimation *rotationAnima = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnima.springSpeed = 2;
    rotationAnima.springBounciness = 3.0;
    rotationAnima.toValue = @(decimalValue * M_PI);
    
    POPBasicAnimation *rotationAnima2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnima2.toValue = @(decimalValue * M_PI);
    
    [_pointer.layer pop_addAnimation:rotationAnima forKey:@"rotationAnima"];
    
    if (decimalValue == 1 || decimalValue == 0) {
        [_semicircle.layer pop_addAnimation:rotationAnima2 forKey:@"rotationAnima2"];
    } else {
        [_semicircle.layer pop_addAnimation:rotationAnima forKey:@"rotationAnima"];
    }
}

@end
