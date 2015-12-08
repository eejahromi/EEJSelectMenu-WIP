# EJSelectMenu

Beta testing. Coacoapod coming soon!

EJSelectMenu is a responsive single selection menu for iOS.  
Project allows for implementing a menu with different number of buttons and different animations for appearance.  
It will adjust the button sizes based on the device screen size!   
Just provide the names for the buttons and the menu will take care of the number and layout of the buttons!

![](demo.gif)



Usage
==================

Add the header file to your source code
```objective-c
#import "EJSelectMenu.h"
```

Create an instance of EJImageLiker
```objective-c
    EJSelectMenu *menu = [[EJSelectMenu alloc]initWithButtons:buttonNames 
                    animationStyle:EJAnimationStyleFadeIn andDelegate:self];
    [self presentViewController:menu animated:NO completion:nil];
    
    // OR
    
    EJSelectMenu *menu = [[EJSelectMenu alloc]init];
    menu.buttonNames = @[@"ONE",@"TWO",@"THREE",@"FOUR"];
    menu.animationStyle = EJAnimationStyleAlternate;
    menu.delegate = self;
    
    [self presentViewController:menu animated:NO completion:nil];
```

Set the AnimationStyle
```objective-c
    menu.animationStyle = EJAnimationStyleFadeIn; // default
    
    // Other animations available:
    EJAnimationStyleWiden
    EJAnimationStyleScale
    EJAnimationStyleMoveInFromLeft
    EJAnimationStyleMoveInFromRight
    EJAnimationStyleAlternate
```

-Delegate Methods
EJSelectMenu provides two delegate methods
```objective-c
    -(void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title;
    -(void)EJSelectMenuButtonWasPressedWithTag:(long)tag;
    
    // button tags start at 100 and increment by one for each
```

-Other configurations:

Change selected button color (default -> Purple)
```objective-c
    menu.selectedButtonColor = [UIColor blueColor];
```
Change menu background color (default -> White)
```objective-c
    menu.menuBackgroundColor = [UIColor redColor];
```


