//
//  MenuViewController.h
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

typedef NS_OPTIONS(NSUInteger,AnimationStyle){
    AnimationStyleFadeIn = (1 << 0),
    AnimationStyleWiden = (1 << 1),
    AnimationStyleScale,
    AnimationStyleMoveInFromLeft,
    AnimationStyleMoveInFromRight,
    AnimationStyleAlternate
};

@protocol EJMenuDelegate <NSObject>

@optional
-(void)buttonWasPressedWithTitle:(NSString *)title;
-(void)buttonWasPressedWithTag:(long)tag;

@end

@interface MenuViewController : UIViewController

-(instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andDelegate:(id<EJMenuDelegate>)delegate;

@property (nonatomic,strong) UIColor *menuBackgroundColor;
@property (nonatomic,strong) UIColor *selectedButtonColor;
@property (nonatomic,assign) long numberOfButtons;
@property (nonatomic,strong) NSArray *buttonNames;

@property (nonatomic) enum AnimationStyle animationStyle;

@property (nonatomic,assign) id<EJMenuDelegate> delegate;



@end
