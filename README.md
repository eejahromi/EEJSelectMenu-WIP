# EJSelectMenu

Beta testing. CocoaPod coming soon!

EJSelectMenu is a responsive single selection menu for iOS.  
Project allows for implementing a menu with different number of buttons and different animations for appearance.  
It will adjust the button sizes based on the device screen size!   
Just provide the names for the buttons and the menu will take care of the number and layout of the buttons!

### Demo
###### Animation: FadeIn & Widen 
![](firstTwo.gif)

###### Animation: Scale & MoveInFromLeft 
![](secondTwo.gif)

###### Animation: MoveInFromRight & Alternate 
![](lastTwo.gif)

##### Version 0.10.0

Installation
==================
### CocoaPods
Coming Soon! 


### Files
Add the header file to your source code
```objective-c
#import "EJSelectMenu.h"
```


Getting Started
==================
Create an instance of EJSelectMenu and provide button names
```objective-c
    NSArray *buttonNames = @[@"ONE",@"TWO",@"THREE",@"FOUR"];
    EJSelectMenu *menu = [[EJSelectMenu alloc]initWithButtons:buttonNames 
                    animationStyle:EJAnimationStyleFadeIn andDelegate:self];
    [self presentViewController:menu animated:NO completion:nil];
```    
OR
```objective-c    
    EJSelectMenu *menu = [[EJSelectMenu alloc]init];
    menu.buttonNames = @[@"ONE",@"TWO",@"THREE",@"FOUR"];
    menu.animationStyle = EJAnimationStyleAlternate;
    menu.delegate = self;
    
    [self presentViewController:menu animated:NO completion:nil];
```

#### AnimationStyle
```objective-c
    menu.animationStyle = EJAnimationStyleFadeIn; // default
```

* `Other AnimationStyles Available:`
  - `EJAnimationStyleWiden`
  - `EJAnimationStyleScale`
  - `EJAnimationStyleMoveInFromLeft`
  - `EJAnimationStyleMoveInFromRight`
  - `EJAnimationStyleAlternate`


#### Delegate Methods
EJSelectMenu provides two delegate methods
```objective-c
    -(void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title;
    -(void)EJSelectMenuButtonWasPressedWithTag:(long)tag;
    
    // button tags start at 100 and increment by one for each
```

##### Other configurations:

Change selected button color (default -> Purple)
```objective-c
    menu.selectedButtonColor = [UIColor blueColor];
```
Change menu background color (default -> White)
```objective-c
    menu.menuBackgroundColor = [UIColor redColor];
```

#### Other configurations:
EJSelectMenu is released under the MIT license. See LICENSE for details.
