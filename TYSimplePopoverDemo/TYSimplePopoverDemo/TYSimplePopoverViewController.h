//
//  TYSimplePopoverViewController.h
//  owe
//
//  Created by Tim Chen on 1/13/15.
//  Copyright (c) 2015 Tim Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectionHandler)(NSInteger selectedIndex);
typedef void (^ViewWillAppearHandler)(void);
typedef void (^ViewDidDismissHandler)(void);

@interface TYSimplePopoverViewController : UIViewController {
    SelectionHandler selectionHandler;
    UIGestureRecognizer * tapGestureRecognizer;
    BOOL hasDestructiveButton;
}

@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * fontName;
@property (nonatomic, strong) NSArray * buttonTitles;
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UIView * popoverView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic) CGFloat popoverHeight;
@property (nonatomic) NSInteger destructiveButtonIndex;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIColor * messageTextColor;
@property (nonatomic, strong) ViewWillAppearHandler viewWillAppearHandler;
@property (nonatomic, strong) ViewDidDismissHandler viewDidDismissHandler;

- (id)initWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles image:(UIImage *)image selectionHandler:(SelectionHandler)handler;
- (void)updatePopoverView;
- (void)show;
- (void)dismissWithIndex:(NSInteger)index;
- (void)dismiss;
- (void)buttonPressed:(id)sender;

@end
