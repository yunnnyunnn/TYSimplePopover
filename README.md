# TYSimplePopover

Simple Popover to replace native UIAlertView.

<img src="https://raw.githubusercontent.com/yunnnyunnn/TYSimplePopover/master/demo.gif" alt=“demo” width=“202” height=“306” />

## Requirements
* Xcode 6 or higher
* Apple LLVM compiler
* iOS 6.0 or higher
* ARC

## Demo

Build and run the `TYSimplePopoverDemo` project in Xcode.

## Installation

Drag `TYSimplePopoverViewController.h` and `TYSimplePopoverViewController.m` files into your project, and add `#import "TYSimplePopoverViewController.h"` to the top of classes that will use it.

## Example Usage

Put the following codes at anywhere you want to present the popover in your view controller:

``` objective-c
// Create the popover
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

// set destructive button index (optional)
simplePopover.destructiveButtonIndex = 2;

// Present it
[self presentViewController:simplePopover animated:YES completion:nil];

```

With Image:

```objective-c
TYSimplePopoverViewController * simplePopoverWithImage = [[TYSimplePopoverViewController alloc] initWithTitle:@"TYSimplePopover"
                                                         message:@"This is where the message shows."
                                                    buttonTitles:[NSArray arrayWithObjects:@"Yes", @"No", nil]
                                                           image:[UIImage imageNamed:@“YOURIMAGENAME”]
                                                selectionHandler:^(NSInteger selectedIndex) {

    if (selectedIndex == 0) {

         NSLog(@"YES");

    } else {

         NSLog(@"No");

    }

}];
```

### Add additional code to TYSimplePopover’s life cycle

``` objective-c

simplePopover.viewWillAppearHandler = ^{
            
            NSLog(@"popover will appear");
            
        };
simplePopover.viewDidDismissHandler = ^{
            
            NSLog(@"popover dismissed");
            
        };

``` 



## Customization

You can customize the following properties of `TYSimplePopover`:

``` objective-c
@property (nonatomic, strong) NSString * fontName;
@property (nonatomic) NSInteger destructiveButtonIndex;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIColor * messageTextColor;
@property (nonatomic, strong) ViewWillAppearHandler viewWillAppearHandler;
@property (nonatomic, strong) ViewDidDismissHandler viewDidDismissHandler;
```

## Discussion

Pros and Cons on selectedIndex method (in Chinese):
https://www.facebook.com/groups/iostw/permalink/1033589010001781/


## Contact

Tim Chen

- https://www.linkedin.com/in/timychen12
- https://facebook.com/yunnnyunnn
- https://twitter.com/timychen12
- timychen12@gmail.com

## License

TYSimplePopover is available under the MIT license.

Copyright © 2015 Ting Yang Chen.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
