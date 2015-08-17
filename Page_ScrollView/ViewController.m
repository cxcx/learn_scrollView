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

@interface ViewController () <UIScrollViewDelegate>
{
    int i;
}
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControll;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int pageNum = 3;
    [self setValue:@(1) forKey:@"i"];
    NSLog(@"%d", i);
    NSLog(@"SCREENHEIGHT = %f\n SCREENWIDTH = %f", SCREENHEIGHT, SCREENWIDTH);
    _scrollView    = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _pageControll  = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    
    
    
    UIView* leftView    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    UIView* midView     = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)];
    UIView* rightView   = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 2, 0, SCREENWIDTH, SCREENHEIGHT)];
    
    [self.view addSubview:_scrollView];
    [_scrollView addSubview:leftView];
    [_scrollView addSubview:midView];
    [_scrollView addSubview:rightView];
    leftView.backgroundColor    = [UIColor redColor];
    midView.backgroundColor     = [UIColor blueColor];
    rightView.backgroundColor   = [UIColor blackColor];
    
    //pageCtroll setting
    [self.view addSubview:_pageControll];
    _pageControll.numberOfPages = pageNum;
    NSDictionary*  view = [NSDictionary dictionaryWithObjectsAndKeys:_pageControll, @"pageControll", nil];
    NSArray* constraints_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[pageControll]-20-|" options:0 metrics:nil views:view];
    NSArray* constraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[pageControll]-|" options:0 metrics:nil views:view];
    _pageControll.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:constraints_H];
    [self.view addConstraints:constraints_v];
    
    
    
    //添加kvo观察 i 的变化
    [self addObserver:self forKeyPath:@"i" options:0 context:NULL];
    
    
    
    
    //contentsize属性用来控制展示的全部内容的大小
    _scrollView.contentSize      = CGSizeMake(SCREENWIDTH * pageNum, SCREENHEIGHT);
    
    //是否允许滑动
    _scrollView.scrollEnabled    = YES;
    
    //设置初始位置偏移量
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    //no表示滑到边界时不允许边界弹缩，默认为yes
    _scrollView.bounces = YES;
    
    //If the value of this property is YES, the scroll view stops on multiples of the scroll view’s bounds when the user scrolls. The default value is NO.
    //pagingEnable = YES;表示滑动时 会在下一个scrollview大小的页面停止 不会向前继续滑动；
    _scrollView.pagingEnabled = YES;
    
    //取消显示滑动时边界的滑动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    ////使用代理
    _scrollView.delegate = self;
    
    __weak ViewController* vc;
    vc = self;
    //添加定时器
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:3 target:vc  selector:@selector(showNextPage) userInfo:nil repeats:YES];
    [timer fire];
}
//滑动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // NSLog(@"在滑动");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束减速");
    ;
    NSLog(@"%d" , i);
}


#pragma mark --定时运行显示下一张page
- (void)showNextPage
{
    switch (i % 3) {
        case 0:
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            _pageControll.currentPage = i % 3;
            break;
        case 1:
            [_scrollView setContentOffset:CGPointMake(1 * SCREENWIDTH, 0) animated:YES];
            _pageControll.currentPage = i % 3;
            break;
        case 2:
            [_scrollView setContentOffset:CGPointMake(2 * SCREENWIDTH, 0) animated:YES];
            _pageControll.currentPage = i % 3;
            break;
            
        default:
            break;
    }
    int tem = i + 1;
    [self setValue:@(tem) forKey:@"i"];
}

#pragma mark  -- kvo观察i变化

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"i 变化了");
}


@end
