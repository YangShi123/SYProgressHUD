//
//  ViewController.m
//  SYProgessHudDemo
//
//  Created by wenjiepeng on 2019/8/21.
//  Copyright © 2019 石阳. All rights reserved.
//

#import "ViewController.h"
#import "SYProgressHUD.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * showView;

@property (nonatomic, copy) NSArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = @[@"提示弹窗", @"提示弹窗-指定view", @"菊花弹窗", @"菊花弹窗-指定view", @"加载成功弹窗", @"加载成功弹窗-指定view", @"加载失败弹窗", @"加载失败弹窗-指定view", @"进度条弹窗", @"进度条弹窗-指定view"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.showView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            [SYProgressHUD showMsg:@"这个是一个弹窗"];
        }
            break;
        case 1:
        {
            [SYProgressHUD showMsg:@"这个是一个弹窗" inView:self.showView];
        }
            break;
        case 2:
        {
            [SYProgressHUD showProgressWithMsg:@"正在加载..."];
            [SYProgressHUD hiddenDelay:2.0];
        }
            break;
        case 3:
        {
            [SYProgressHUD showProgressWithMsg:@"正在加载..." inView:self.showView];
            [SYProgressHUD hiddenDelay:2.0];
        }
            break;
        case 4:
        {
            [SYProgressHUD showSuccessWithMsg:@"加载成功!"];
            [SYProgressHUD hiddenDelay:2.0];
            [SYProgressHUD shareInstance].hud.completionBlock = ^{
                NSLog(@"123");
            };
        }
            break;
        case 5:
        {
            [SYProgressHUD showSuccessWithMsg:@"加载成功!" inView:self.showView];
            [SYProgressHUD hiddenDelay:2.0];
        }
            break;
        case 6:
        {
            [SYProgressHUD showFailureWithMsg:@"加载失败!"];
            [SYProgressHUD hiddenDelay:2.0];
        }
            break;
        case 7:
        {
            [SYProgressHUD showFailureWithMsg:@"加载失败!" inView:self.showView];
            [SYProgressHUD hiddenDelay:2.0];
        }
            break;
        case 8:
        {
            [SYProgressHUD showCircleProgressWithMsg:@"正在加载..."];
            CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(run:)];
            [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
            
        }
            break;
        case 9:
        {
            [SYProgressHUD showCircleProgressWithMsg:@"正在加载..." inView:self.showView];
            CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(run:)];
            [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        }
            break;
            
        default:
            break;
    }
}

- (void)run:(CADisplayLink *)link
{
    static NSInteger i = 0;
    i ++;
    CGFloat j = i / 100.0;
    if (j > 1)
    {
        i = 0;
        j = 1;
        [SYProgressHUD hidden];
        [link invalidate];
    }
    [SYProgressHUD shareInstance].progress = j;
}

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (UIView *)showView
{
    if (_showView == nil)
    {
        _showView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 200, [UIScreen mainScreen].bounds.size.width, 200)];
        _showView.backgroundColor = [UIColor redColor];
    }
    return _showView;
}

@end
