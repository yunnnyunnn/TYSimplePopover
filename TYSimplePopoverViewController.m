//
//  TYSimplePopoverViewController.m
//  owe
//
//  Created by Tim Chen on 1/13/15.
//  Copyright (c) 2015 Tim Chen. All rights reserved.
//

#import "TYSimplePopoverViewController.h"

#define kPopoverWidth 263.0
#define kButtonHeight 49.0
#define kTitleMessageHeight 118.0
#define kPhotoTitleMessageHeight 193.0
#define kPhotoSize 95.0



@implementation TYSimplePopoverViewController

- (id)initWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles image:(UIImage *)image selectionHandler:(SelectionHandler)handler {
    
    self = [super init];
    if (self) {
        // Custom initialization
        
        // if in iOS7 this doesn't work, change the preseting viewController's modalPresentationStyle to UIModalPresentationCurrentContext
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        self.title = title;
        self.message = message;
        self.buttonTitles = buttonTitles;
        selectionHandler = handler;
        if (image) {
            self.imageView = [[UIImageView alloc] initWithImage:image];
        }
        
        self.viewWillAppearHandler = ^{
            
        };
        self.viewDidDismissHandler = ^{
            
        };
        self.fontName = @"HelveticaNeue-Light";
    
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.66];
    self.backgroundView.userInteractionEnabled = YES;
    [self.view addSubview:self.backgroundView];
    
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.backgroundView addGestureRecognizer:tapGestureRecognizer];
    
    [self updatePopoverView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.viewWillAppearHandler();
}

- (void)viewDidAppear:(BOOL)animated {
    

}

- (void)updatePopoverView {
    
    
    if (self.popoverView) {
        [self.popoverView removeFromSuperview];
    }
    
    self.popoverView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, kPopoverWidth, self.popoverHeight)];
    self.popoverView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    self.popoverView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.popoverView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 15.0, kPopoverWidth, 34.0)];
    self.titleLabel.text = self.title;
    self.titleLabel.textColor = [UIColor colorWithWhite:100.0/255.0 alpha:1.0];
    if (self.textColor) {
        self.titleLabel.textColor = self.textColor;
    }
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:self.fontName size:22.0];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    if (self.imageView) {
        self.titleLabel.font = [UIFont fontWithName:self.fontName size:22.0];
        self.titleLabel.frame = CGRectMake(0.0, 122.0, kPopoverWidth, 32.0);
    }
    [self.popoverView addSubview:self.titleLabel];
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 50.0, kPopoverWidth - 20.0, 55.0)];
    self.messageLabel.text = self.message;
    self.messageLabel.textColor = [UIColor colorWithWhite:80.0/255.0 alpha:1.0];
    if (self.textColor) {
        self.messageLabel.textColor = self.textColor;
    }
    if (self.messageTextColor) {
        self.messageLabel.textColor = self.messageTextColor;
    }
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 2;
    self.messageLabel.font = [UIFont fontWithName:self.fontName size:15.0];
    self.messageLabel.adjustsFontSizeToFitWidth = YES;
    self.messageLabel.backgroundColor = [UIColor clearColor];
    if (self.imageView) {
        self.messageLabel.font = [UIFont fontWithName:self.fontName size:15.0];
        self.messageLabel.frame = CGRectMake(10.0, 154.0, kPopoverWidth - 20.0, 22.0);
        self.messageLabel.numberOfLines = 1;
    }
    [self.popoverView addSubview:self.messageLabel];
    
    if (self.imageView) {
        self.imageView.frame = CGRectMake(0.0, 0.0, kPhotoSize, kPhotoSize);
        self.imageView.layer.cornerRadius = kPhotoSize/2;
        self.imageView.clipsToBounds = YES;
        self.imageView.center = CGPointMake(kPopoverWidth/2, 75.0);
        self.imageView.contentMode = UIViewContentModeCenter;
        [self.popoverView addSubview:self.imageView];
    }
    
    for (int i=0 ; i < self.buttonTitles.count ; i++) {
        // separator
        CGFloat separatorY = 0.0;
        if (self.imageView) {
            separatorY  = kPhotoTitleMessageHeight + (kButtonHeight * i);
        } else {
            separatorY  = kTitleMessageHeight + (kButtonHeight * i);

        }
        UIView * separator = [[UIView alloc] initWithFrame:CGRectMake(0.0, separatorY, kPopoverWidth, 0.5)];
        separator.backgroundColor = [UIColor colorWithWhite:185.0f/255.0f alpha:1.0];
        [self.popoverView addSubview:separator];
        
        // buttons
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, separatorY, kPopoverWidth, kButtonHeight)];
        //button.backgroundColor = [UIColor clearColor];
        [button setTitle:[self.buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:94.0/255.0 green:105.0/255.0 blue:247.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:94.0/255.0 green:105.0/255.0 blue:247.0/255.0 alpha:0.5] forState:UIControlStateHighlighted];
        if (hasDestructiveButton && i == self.destructiveButtonIndex) {
            [button setTitleColor:[UIColor colorWithRed:247.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:247.0/255.0 green:94.0/255.0 blue:94.0/255.0 alpha:0.5] forState:UIControlStateHighlighted];
        }
        [button.titleLabel setFont:[UIFont fontWithName:self.fontName size:20.0]];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.popoverView addSubview:button];
    }
}

- (void)show {
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.view];
    
}

- (void)dismissWithIndex:(NSInteger)index {
    [self dismissViewControllerAnimated:YES completion:^{
        selectionHandler(index);
        self.viewDidDismissHandler();
    }];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:^{
        self.viewDidDismissHandler();

    }];
}

- (void)buttonPressed:(id)sender {
    UIButton * button = (UIButton *)sender;
    [self dismissWithIndex:button.tag];
}

#pragma mark - Properties
#pragma mark -

- (CGFloat)popoverHeight {
    CGFloat height = 0.0;
    if (self.imageView) {
        height = kPhotoTitleMessageHeight + (kButtonHeight * self.buttonTitles.count);
    } else {
        height = kTitleMessageHeight + (kButtonHeight * self.buttonTitles.count);
    }
    return height;
}

- (void)setDestructiveButtonIndex:(NSInteger)destructiveButtonIndex {
    _destructiveButtonIndex = destructiveButtonIndex;
    hasDestructiveButton = YES;
    [self updatePopoverView];
}

- (void)setImageView:(UIImageView *)imageView {
    _imageView = imageView;
    [self updatePopoverView];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self updatePopoverView];
}

- (void)setMessageTextColor:(UIColor *)messageTextColor {
    _messageTextColor = messageTextColor;
    [self updatePopoverView];
}

- (void)setFontName:(NSString *)fontName {
    _fontName = fontName;
    [self updatePopoverView];
}

@end
