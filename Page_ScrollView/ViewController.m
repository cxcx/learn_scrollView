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
    
    
    
    //contentsize属性用来控制展示的全部内容的大小
    scrollView.contentSize      = CGSizeMake(SCREENWIDTH * 3, SCREENHEIGHT);
    
    //是否允许滑动
    scrollView.scrollEnabled    = YES;
    
    //设置初始位置偏移量
    [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    //no表示滑到边界时不允许边界弹缩，默认为yes
    scrollView.bounces = YES;
    
    //If the value of this property is YES, the scroll view stops on multiples of the scroll view’s bounds when the user scrolls. The default value is NO.
    //pagingEnable = YES;表示滑动时 会在下一个scrollview大小的页面停止 不会向前继续滑动；
    scrollView.pagingEnabled = YES;
    
    
    
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
