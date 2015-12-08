//
//  MenuViewController.h
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EJMenuItem.h"

typedef NS_OPTIONS(NSUInteger,AnimationStyle){
    EJAnimationStyleFadeIn = (1 << 0),
    EJAnimationStyleWiden = (1 << 1),
    EJAnimationStyleScale,
    EJAnimationStyleMoveInFromLeft,
    EJAnimationStyleMoveInFromRight,
    EJAnimationStyleAlternate
};

@protocol EJSelectMenuDelegate <NSObject>

@optional
-(void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title;
-(void)EJSelectMenuButtonWasPressedWithTag:(long)tag;

@end

@interface EJSelectMenu : UIViewController

-(instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andDelegate:(id<EJSelectMenuDelegate>)delegate;

@property (nonatomic,strong) UIColor *menuBackgroundColor;
@property (nonatomic,strong) UIColor *selectedButtonColor;
@property (nonatomic,assign) long numberOfButtons;
@property (nonatomic,strong) NSArray *buttonNames;

@property (nonatomic) enum AnimationStyle animationStyle;

@property (nonatomic,assign) id<EJSelectMenuDelegate> delegate;



@end
