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

@property (nonatomic, strong) OWMeterView *meterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _meterView = [[OWMeterView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 215.0)];
    _meterView.dataSource = self;
    _meterView.delegate = self;
    [self.view addSubview:_meterView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 100;
    button.frame = CGRectMake(self.view.frame.size.width / 2 - 50.0, self.view.frame.size.height - 300.0, 100.0, 21.0);
    [button setTitle:@"100" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag = 101;
    button1.frame = CGRectMake(self.view.frame.size.width / 2 - 50.0, self.view.frame.size.height - 270.0, 100.0, 21.0);
    [button1 setTitle:@"275" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag = 102;
    button2.frame = CGRectMake(self.view.frame.size.width / 2 - 50.0, self.view.frame.size.height - 240.0, 100.0, 21.0);
    [button2 setTitle:@"450" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.tag = 103;
    button3.frame = CGRectMake(self.view.frame.size.width / 2 - 50.0, self.view.frame.size.height - 210.0, 100.0, 21.0);
    [button3 setTitle:@"859" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.tag = 104;
    button4.frame = CGRectMake(self.view.frame.size.width / 2 - 50.0, self.view.frame.size.height - 180.0, 100.0, 21.0);
    [button4 setTitle:@"1000" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
}

-(NSString *)titleOnMeter:(OWMeterView *)meterView
{
    return @"Tax Payable";
}

-(UIColor *)frontColorOnMeter:(OWMeterView *)meterView
{
    return [UIColor orangeColor];
}

-(UIView *)backGroudViewOnMeter:(OWMeterView *)meterView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderWidth = 1.0;
    view.layer.borderColor = [UIColor darkGrayColor].CGColor;
    return view;
}

-(UIColor *)titleColorOnMeter:(OWMeterView *)meterView
{
    return [UIColor darkGrayColor];
}

-(UIColor *)valueColorOnMeter:(OWMeterView *)meterView
{
    return [UIColor orangeColor];
}

- (void)start:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
            [_meterView animationStartsWithValue:100 totalValue:1000];
            break;
        case 101:
            [_meterView animationStartsWithValue:275 totalValue:1000];
            break;
        case 102:
            [_meterView animationStartsWithValue:450 totalValue:1000];
            break;
        case 103:
            [_meterView animationStartsWithValue:859 totalValue:1000];
            break;
        case 104:
            [_meterView animationStartsWithValue:1000 totalValue:1000];
            break;
        default:
            break;
    }
}


@end
