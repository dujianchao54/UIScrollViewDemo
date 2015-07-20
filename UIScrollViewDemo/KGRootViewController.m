//
//  KGRootViewController.m
//  UIScrollViewDemo
//
//  Created by KG on 15/6/18.
//  Copyright (c) 2015年 KG. All rights reserved.
//

#import "KGRootViewController.h"

@interface KGRootViewController ()<UIScrollViewDelegate>

@end

@implementation KGRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //在ios7以后,加一个属性,当滚动视图,或继承于滚动视图的视图在加到视图控制器上时
    //视图控制器可能会加一些各种条,如果按照之前UI布局,那么实际上,这个条会遮挡住滚动视图的一部分
    self.automaticallyAdjustsScrollViewInsets  = NO;
    
    
    //创建一个滚动视图加到view
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, 320, 200)];
    
    //创建一张图片对象
    UIImage * image = [UIImage imageNamed:@"2-550x309.jpg"];
    //创建一个imageView
    //使用图片的实际大小来给imageView的bounds赋值
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width   ,image.size.height)];
    //将图片加到imageView
    imageView.image = image;
    //将imageView加到滚动视图上
    [scrollView addSubview:imageView];
    //滚动视图如果想要滚动,需要设置一个属性
    //这个属性是内容的滚动范围
    scrollView.contentSize = image.size;
    
    //设置是否允许回弹
    scrollView.bounces = NO;
    
    //滚动提示条可以禁用
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //翻面属性
    //scrollView.pagingEnabled = YES;
    
    //偏移量
    scrollView.contentOffset = CGPointMake(-50, -80);
    
    
    //设置缩放比例
    scrollView.maximumZoomScale = 2;
    scrollView.minimumZoomScale = 0.5;
    
    //如果想实现图片的缩放,那么需要实现一个协议方法,来告诉视图,缩放哪一张图片
    scrollView.delegate = self;
    
    
    
    [self.view addSubview:scrollView];
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return scrollView.subviews.lastObject;
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
