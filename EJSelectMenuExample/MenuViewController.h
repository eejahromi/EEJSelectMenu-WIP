//
//  MenuViewController.h
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@protocol EJMenuDelegate <NSObject>

@optional
-(void)buttonWasPressedWithTitle:(NSString *)title;
-(void)buttonWasPressedWithTag:(long)tag;

@end

@interface MenuViewController : UIViewController

@property (nonatomic,strong) UIColor *menuItemColor;
@property (nonatomic,strong) UIColor *menuBackgroundColor;
@property (nonatomic,strong) UIColor *selectedButtonColor;
@property (nonatomic,assign) long numberOfButtons;
@property (nonatomic,strong) NSArray *buttonNames;

//@property (nonatomic) enum AnimationStyle animationStyle;

@property (nonatomic,assign) id<EJMenuDelegate> delegate;

@end
