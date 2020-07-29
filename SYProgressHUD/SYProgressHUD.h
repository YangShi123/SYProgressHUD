//
//  SYProgressHUD.h
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYProgressHUD : NSObject
//通过hud属性，自行修改hud的字体等
@property (nonatomic, strong) MBProgressHUD * hud;
//进度条的进度
@property (nonatomic, assign) CGFloat progress;
//default is 2.0
@property (nonatomic, assign) CGFloat toastTime;

+ (instancetype)shareInstance;


/**
 显示文字
 */
+ (void)showMsg:(NSString *)msg;

/**
 显示文字 可以在指定的view上
 */
+ (void)showMsg:(NSString *)msg inView:(UIView *)view;

/**
 显示菊花
 */
+ (void)showProgressWithMsg:(NSString *)msg;

/**
 显示菊花 可以在指定的view上
 */
+ (void)showProgressWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 成功
 */
+ (void)showSuccessWithMsg:(NSString *)msg;

/**
 成功 可以在指定的view上
 */
+ (void)showSuccessWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 失败
 */
+ (void)showFailureWithMsg:(NSString *)msg;

/**
 失败 可以在指定的view上
 */
+ (void)showFailureWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 进度条
 */
+ (void)showCircleProgressWithMsg:(NSString *)msg;

/**
 进度条 可以在指定的view上
 */
+ (void)showCircleProgressWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 移除
 */
+ (void)hidden;

/**
 在多少时间后移除
 */
+ (void)hiddenDelay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
