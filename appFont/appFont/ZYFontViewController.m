//
//  ZYFontViewController.m
//  appFont
//
//  Created by 懒洋洋 on 16/11/25.
//  Copyright © 2016年 LDWL. All rights reserved.
//

#import "ZYFontViewController.h"

@interface ZYFontViewController ()

@end

@implementation ZYFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"具体样式";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"abc&123?ABC?字体!";
    label.font = [UIFont fontWithName:self.fontStr size:30];
    label.center = self.view.center;
    NSLog(@"字体的字符串:%@" , self.fontStr);
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
