//
//  ViewController.m
//  TYSimplePopoverDemo
//
//  Created by Tim Chen on 4/8/15.
//  Copyright (c) 2015 Timy Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView * backgroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [backgroundImage setImage:[UIImage imageNamed:@"buble"]];
    [self.view addSubview:backgroundImage];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectMake(0.0, 0.0, 200.0, 40.0);
    self.button1.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/3);
    [self.button1 setTitle:@"Show" forState:UIControlStateNormal];
    [self.button1.titleLabel setFont:[UIFont systemFontOfSize:22.0]];
    [self.button1 setTitleColor:[UIColor colorWithWhite:120.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor colorWithWhite:50.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [self.button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.button1.tag = 1;
    [self.view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(0.0, 0.0, 200.0, 40.0);
    self.button2.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height*(1.0/2.0));
    [self.button2 setTitle:@"Show with image" forState:UIControlStateNormal];
    [self.button2.titleLabel setFont:[UIFont systemFontOfSize:22.0]];
    [self.button2 setTitleColor:[UIColor colorWithWhite:120.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.button2 setTitleColor:[UIColor colorWithWhite:50.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [self.button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.button2.tag = 2;
    [self.view addSubview:self.button2];
    
    
}

- (void)buttonPressed:(id)sender {
    
    UIButton * button = (UIButton *)sender;
    
    if (button.tag == 1) { // show with text only
        
        
        
        TYSimplePopoverViewController * simplePopover = [[TYSimplePopoverViewController alloc] initWithTitle:@"TYSimplePopover"
                                                                                                     message:@"This is where the message shows."
                                                                                                buttonTitles:[NSArray arrayWithObjects:@"Yes", @"No", @"Destructive", nil]
                                                                                                       image:nil
                                                                                            selectionHandler:^(NSInteger selectedIndex) {
                                                                                                if (selectedIndex == 0) {
                                                                                                    
                                                                                                    NSLog(@"YES");
                                                                                                    
                                                                                                } else if (selectedIndex == 1){
                                                                                                    NSLog(@"No");
                                                                                                }
                                                                                                else {
                                                                                                    NSLog(@"Destructive");
                                                                                                }
                                                                                            }];
        
        
        simplePopover.destructiveButtonIndex = 2;
        
        simplePopover.viewWillAppearHandler = ^{
            
            NSLog(@"popover will appear");
            
        };
        simplePopover.viewDidDismissHandler = ^{
            
            NSLog(@"popover dismissed");
            
        };
        
        
        [self presentViewController:simplePopover animated:YES completion:nil];
        
        
    } else if (button.tag == 2){ // show with image
        
        
        TYSimplePopoverViewController * simplePopoverWithImage = [[TYSimplePopoverViewController alloc] initWithTitle:@"TYSimplePopover"
                                                                                                              message:@"This is where the message shows."
                                                                                                         buttonTitles:[NSArray arrayWithObjects:@"Yes", @"No", nil]
                                                                                                                image:[UIImage imageNamed:@"buble"]
                                                                                                     selectionHandler:^(NSInteger selectedIndex) {
                                                                                                         if (selectedIndex == 0) {
                                                                                                             
                                                                                                             NSLog(@"YES");
                                                                                                             
                                                                                                         } else {
                                                                                                             NSLog(@"No");
                                                                                                         }
                                                                                                     }];
        
        
        //simplePopover.messageTextColor = [UIColor colorWithWhite:140.0/255.0 alpha:1.0];
        
        simplePopoverWithImage.viewWillAppearHandler = ^{
            
            NSLog(@"popover will appear");
            
        };
        simplePopoverWithImage.viewDidDismissHandler = ^{
            
            NSLog(@"popover dismissed");
            
        };
        
        
        [self presentViewController:simplePopoverWithImage animated:YES completion:^{
            
        }];
        
        
        
    }
    else {
        NSLog(@"unexpected tag for button");
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
