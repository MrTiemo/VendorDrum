//
//  ACPayPwdAlert.m
//  ACPayPwdView
//
//  Created by ablett on 16/6/16.
//  Copyright © 2016年 ablett. All rights reserved.
//

#import "ACPayPwdAlert.h"
#import "ACPwdInputView.h"
#import "UIView+ACExtension.h"


#define kColorComplete [UIColor colorWithRed:0.214 green:0.526 blue:1.000 alpha:1.000]
#define kColorNormal   [UIColor colorWithWhite:0.584 alpha:1.000]
#define kColorMask     [UIColor colorWithWhite:0.000 alpha:0.400]
#define kFrameAlert    CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*0.8, 168)
#define kColorLine     [UIColor colorWithWhite:0.824 alpha:1.000]
#define kColorCancel   [UIColor colorWithRed:0.967 green:0.159 blue:0.047 alpha:1.000]

static const CGFloat duration = 0.25;

@interface ACPayPwdAlert()

@property (strong, nonatomic) UIView *maskView;             ///< 遮罩
@property (strong, nonatomic) UILabel *titleLabel;          ///< 标题
@property (strong, nonatomic) ACPwdInputView *pwdInputView; ///< 输入区

//@property (strong, nonatomic) UIButton *forgetPass;        ///< 忘记密码?

@property (strong, nonatomic) UIButton *completeBtn;        ///< 确定

@property (assign, nonatomic, getter=isComplete) BOOL complete; ///< 是否完成
@property (copy, nonatomic) NSString *pwd;                      ///< 密码
@end

@implementation ACPayPwdAlert

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    //set default value
    self.length = 6;
    
    CGFloat padding = 20.f;
    CGFloat margin = 15.f;
    CGFloat width = [UIScreen mainScreen].bounds.size.width*0.8;
    CGFloat titleH = 20.f;
    CGFloat inputH = (width-padding*2)/self.length;
    CGFloat btnH = 44.f;
    CGFloat height = titleH+inputH+btnH+margin*4+1.f;
    
    
    self.frame = CGRectMake(0, 0, width, height+40);
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 8.f;
    
    /** title label */
    self.titleLabel.frame = CGRectMake(padding, margin, inputH*self.length, titleH);
    
    /** top line */
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleLabel.bottom+margin, self.width, 0.5)];
    topLine.backgroundColor = kColorLine;
    
    /** pwd view */
    self.pwdInputView.frame = CGRectMake(padding, topLine.bottom+margin, inputH*self.length, inputH);
    
    /** bottom line */
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.pwdInputView.bottom+margin+40, self.width, 0.5)];
    bottomLine.backgroundColor = kColorLine;
    
    /** bottom vline */
    UIView *bottomVLine = [[UIView alloc] initWithFrame:CGRectMake((self.width-0.5)*0.5, bottomLine.bottom, 0.5, btnH)];
    bottomVLine.backgroundColor = kColorLine;
    
    /** cancel button */
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setFrame:CGRectMake(0, bottomLine.bottom, (self.width-0.5)*0.5, btnH)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:kColorCancel forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    /** forget button */
    self.forgetPass.frame = CGRectMake(0, self.pwdInputView.bottom+margin, self.width, 30);
    
    /** complete button */
    self.completeBtn.frame = CGRectMake(bottomVLine.right, bottomLine.bottom, (self.width-0.5)*0.5, btnH);
    
    [self addSubview:self.titleLabel];
    [self addSubview:topLine];
    [self addSubview:self.pwdInputView];
    [self addSubview:bottomLine];
    [self addSubview:bottomVLine];
    [self addSubview:self.forgetPass];
    [self addSubview:self.completeBtn];
    [self addSubview:cancelBtn];
    
    __weak typeof(&*self)weakSelf = self;
    self.pwdInputView.inputDidCompletion = ^(NSString *pwd) {
        if (pwd.length == weakSelf.pwdInputView.length) {
            weakSelf.pwd = pwd;
            weakSelf.complete = YES;
        }else {
            weakSelf.pwd = @"";
            weakSelf.complete = NO;
        }
    };
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Setter/Getter

- (void)setTitle:(NSString *)title {
    _title = title;
   self.titleLabel.text = title;
}

- (void)setLength:(NSUInteger)length {
    _length = length;
    self.pwdInputView.length = length;
}

- (void)setComplete:(BOOL)complete {
    _complete = complete;
    if (complete) {
        self.completeBtn.enabled = YES;
        [self.completeBtn setTitleColor:kColorComplete forState:UIControlStateNormal];
    }else {
        self.completeBtn.enabled = NO;
        [self.completeBtn setTitleColor:kColorNormal forState:UIControlStateNormal];
    }
}

- (ACPwdInputView *)pwdInputView {
    if (!_pwdInputView) {
        _pwdInputView = [[ACPwdInputView alloc] init];
    }
    return _pwdInputView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication].windows lastObject].bounds];
        _maskView.backgroundColor = kColorMask;
        _maskView.alpha = 0.f;
    }
    return _maskView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithWhite:0.202 alpha:1.000];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    return _titleLabel;
}

- (UIButton *)completeBtn {
    if (!_completeBtn) {
        _completeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_completeBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_completeBtn setTitleColor:kColorNormal forState:UIControlStateNormal];
        [_completeBtn.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
        [_completeBtn setEnabled:NO];
        [_completeBtn addTarget:self action:@selector(complete:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completeBtn;
}
- (UIButton *)forgetPass {
    if (!_forgetPass) {
        _forgetPass = [UIButton buttonWithType:UIButtonTypeSystem];
        [_forgetPass setTitle:@"忘记支付密码?" forState:UIControlStateNormal];
        [_forgetPass setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_forgetPass.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
//        [_forgetPass setEnabled:NO];
        [_forgetPass addTarget:self action:@selector(foeget:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPass;
}

#pragma mark - Public

- (void)show {
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows lastObject];
    [keyWindow addSubview:self.maskView];
    [keyWindow addSubview:self];
    
    self.center = CGPointMake(keyWindow.center.x, (keyWindow.frame.size.height - 216) * 0.5);
    self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    
    __weak typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        weakSelf.maskView.alpha = 1.f;
        weakSelf.alpha = 1.f;
        weakSelf.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf.pwdInputView becomeFirstResponder];
        }
    }];
}

#pragma mark - Privite

- (void)dismiss {
    [self.pwdInputView endEditing:YES];
    __weak typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        weakSelf.alpha = 0.f;
        weakSelf.maskView.alpha = 0.f;
        weakSelf.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    }completion:^(BOOL finished) {
        if (finished) {
            weakSelf.complete = NO;
            [weakSelf removeFromSuperview];
            [weakSelf.maskView removeFromSuperview];
        }
    }];
}

- (void)complete:(id)sender {
    if (_completeAction) {
        _completeAction(self.pwd);
    }
    [self dismiss];
}

- (void)cancel:(id)sender {
    [self dismiss];
}
- (void)foeget:(id)sender {
    if (_forget) {
        _forget(nil);
    }
    [self dismiss];
}

@end
