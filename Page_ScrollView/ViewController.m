//
//  ViewController.m
//  Page_ScrollView
//
//  Created by renhe_cx on 8/14/15.
//  Copyright (c) 2015 renhe. All rights reserved.
//

#import "ViewController.h"
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREENWIDTH  [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int pageNum = 3;
    NSLog(@"SCREENHEIGHT = %f\n SCREENWIDTH = %f", SCREENHEIGHT, SCREENWIDTH);
    UIScrollView* scrollView    = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    
    
    UIView* leftView    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    UIView* midView     = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)];
    UIView* rightView   = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 2, 0, SCREENWIDTH, SCREENHEIGHT)];

    scrollView.contentSize      = CGSizeMake(SCREENWIDTH * 3, SCREENHEIGHT);
    scrollView.scrollEnabled    = YES;
    [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.view addSubview:scrollView];
    [scrollView addSubview:leftView];
    [scrollView addSubview:midView];
    [scrollView addSubview:rightView];
    leftView.backgroundColor    = [UIColor redColor];
    midView.backgroundColor     = [UIColor blueColor];
    rightView.backgroundColor   = [UIColor blackColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
