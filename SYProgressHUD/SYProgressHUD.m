//
//  SYProgressHUD.m
//

#import "SYProgressHUD.h"

@interface SYProgressHUD ()

@end

@implementation SYProgressHUD

+ (instancetype)shareInstance
{
    static SYProgressHUD * hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[SYProgressHUD alloc] init];
        hud.toastTime = 2.0;
    });
    return hud;
}

+ (void)SYProgressShowMsg:(NSString *)msg inView:(UIView *)view mode:(MBProgressHUDMode)mode customImg:(UIImageView *)imageView
{
    if ([SYProgressHUD shareInstance].hud != nil)
    {
        [[SYProgressHUD shareInstance].hud removeFromSuperview];
    }
    [SYProgressHUD shareInstance].hud = [MBProgressHUD showHUDAddedTo:view ? view : [UIApplication sharedApplication].delegate.window animated:YES];
    [SYProgressHUD shareInstance].hud.label.text = msg;
    [SYProgressHUD shareInstance].hud.label.numberOfLines = 0;
    [SYProgressHUD shareInstance].hud.mode = mode;
    if (mode == MBProgressHUDModeCustomView) {
        [SYProgressHUD shareInstance].hud.customView = imageView;
    }
    [SYProgressHUD shareInstance].hud.contentColor = [UIColor whiteColor];
    [SYProgressHUD shareInstance].hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    [SYProgressHUD shareInstance].hud.bezelView.color = [UIColor blackColor];
    [SYProgressHUD shareInstance].hud.animationType = MBProgressHUDAnimationZoom;
    [SYProgressHUD shareInstance].hud.label.textColor = [UIColor whiteColor];
    [SYProgressHUD shareInstance].hud.removeFromSuperViewOnHide = YES;
    [SYProgressHUD shareInstance].hud.margin = 15;
}

+ (void)showMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeText customImg:nil];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeText customImg:nil];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showProgressWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeIndeterminate customImg:nil];
}

+ (void)showProgressWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeIndeterminate customImg:nil];
}

+ (void)showSuccessWithMsg:(NSString *)msg;
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[[SYProgressHUD shareInstance] imageWithResourceName:@"success"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showSuccessWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[[SYProgressHUD shareInstance] imageWithResourceName:@"success"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showFailureWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[[SYProgressHUD shareInstance] imageWithResourceName:@"fail"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showFailureWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[[SYProgressHUD shareInstance] imageWithResourceName:@"fail"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:[SYProgressHUD shareInstance].toastTime];
}

+ (void)showCircleProgressWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeAnnularDeterminate customImg:nil];
}

+ (void)showCircleProgressWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeAnnularDeterminate customImg:nil];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [SYProgressHUD shareInstance].hud.progress = progress;
}

+ (void)hidden
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES];
}

+ (void)hiddenDelay:(NSTimeInterval)delay
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:delay];
}

- (UIImage *)imageWithResourceName:(NSString *)name
{
    NSBundle * bundle = [NSBundle bundleForClass:[SYProgressHUD class]];
    NSURL * url = [bundle URLForResource:@"images" withExtension:@"bundle"];
    NSBundle * imageBundle = [NSBundle bundleWithURL:url];
    UIImage * image = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:name ofType:@"png"]];
    return image;
}

@end
