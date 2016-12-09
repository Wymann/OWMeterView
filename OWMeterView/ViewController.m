//
//  ViewController.m
//  OWMeterView
//
//  Created by Wyman Chen on 2016/12/8.
//  Copyright © 2016年 conpak. All rights reserved.
//

#import "ViewController.h"
#import "OWMeterView.h"

@interface ViewController ()<OWMeterViewDelegate, OWMeterViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    OWMeterView *meterView = [[OWMeterView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 215.0)];
    meterView.dataSource = self;
    meterView.delegate = self;
    [self.view addSubview:meterView];
    
    [meterView animationStartsWithValue:125 totalValue:500];
}

-(NSString *)titleOnMeter:(OWMeterView *)meterView
{
    return @"Tax Payable";
}

-(UIColor *)colorOneMeter:(OWMeterView *)meterView
{
    return [UIColor blackColor];
}

//-(UIView *)backGroudViewOneMeter:(OWMeterView *)meterView
//{
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    return view;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
