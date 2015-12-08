//
//  MenuViewController.m
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController () <MenuItemDelegate>
@property (strong,nonatomic) MenuItem *item;
@property (strong,nonatomic) NSMutableArray *buttons;

@end

@implementation MenuViewController{
    BOOL even;
    BOOL alternate;
}

-(instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andDelegate:(id<EJMenuDelegate>)delegate{
    self = [super init];
    if (self) {
        self.buttonNames = buttons;
        self.animationStyle = style;
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMenuItems];
}

-(void)setupMenuItems{
    
    [self setBackgroundColor:self.menuBackgroundColor];
    self.buttons = [NSMutableArray array];
    alternate = YES;
    self.numberOfButtons = self.buttonNames.count;
    
    CGFloat heightBasedOnNumberOfButtons = ((self.view.bounds.size.height - 20) / self.numberOfButtons) - 1.0;
    
    for (int i=0; i<self.numberOfButtons; i++) {
        self.item = [[MenuItem alloc]
                     initWithFrame:CGRectMake(1, 20 + (i * heightBasedOnNumberOfButtons) + i, self.view.bounds.size.width - 2, heightBasedOnNumberOfButtons)];
        self.item.title = self.buttonNames[i];

        self.item.backgroundColor = [UIColor colorWithRed:88/255.0 green:115/255.0 blue:160/255.0 alpha:1.0];
        self.item.selectedStateColor = self.selectedButtonColor;
        self.item.tag = 100 + i;
        self.item.delegate = self;
        
        
        [self.buttons addObject:self.item];
        [self.view addSubview:self.item];
    }
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    __block float delay = 0.0;
    NSEnumerationOptions enumOption = 0;
    
    switch (self.animationStyle) {
    
        case AnimationStyleFadeIn:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(fadeInAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            
            break;
        case AnimationStyleWiden:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(widenAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
        
        case AnimationStyleScale:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(scaleAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case AnimationStyleMoveInFromLeft:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(moveInFromLeftAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case AnimationStyleMoveInFromRight:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(moveInFromRightAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case AnimationStyleAlternate:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MenuItem *menu = (MenuItem *)obj;
                [self performSelector:@selector(alternateAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Animations

-(void)fadeInAnimation:(MenuItem *)item{
    [UIView animateWithDuration:0.3 animations:^{
        item.alpha = 1.0;
    }];
}

-(void)widenAnimation:(MenuItem *)item{
    // Grow from middle animation
    item.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:0.3 animations:^{
        item.transform = CGAffineTransformMakeScale(1.0, 1.0);
        item.alpha = 1.0;
    }];
}

-(void)scaleAnimation:(MenuItem *)item{
    // zoom out from middle animation
    item.transform = CGAffineTransformMakeScale(5.0, 5.0);
    [UIView animateWithDuration:0.3 animations:^{
        item.transform = CGAffineTransformMakeScale(1.0, 1.0);
        item.alpha = 1.0;
    }];
}

-(void)moveInFromLeftAnimation:(MenuItem *)item{
    // animate in from sides
    item.frame = CGRectMake(-self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
        item.alpha = 1.0;
    }];
}

-(void)moveInFromRightAnimation:(MenuItem *)item{
    // animate in from sides
    item.frame = CGRectMake(self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
        item.alpha = 1.0;
    }];
}

-(void)alternateAnimation:(MenuItem *)item{
    CGFloat xPosition;
    if (even) {
        even = !even;
        xPosition = -self.view.bounds.size.width;
    }else{
        even = !even;
        xPosition = self.view.bounds.size.width;
    }
    
    // animate in from sides
    item.frame = CGRectMake(xPosition, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
        item.alpha = 1.0;
    }];
}

#pragma mark - Colors

-(void)setColor:(UIColor *)color{
    [self setBackgroundColor:color];
}

-(void)setBackgroundColor:(UIColor *)color{
    
    self.view.backgroundColor = color ? color : [UIColor whiteColor];
}

-(void)setMenuItemColor:(UIColor *)menuItemColor{
    [self setItemColor:menuItemColor];
}

-(void)setItemColor:(UIColor *)color{
    
    self.item.backgroundColor = color ? color : [UIColor orangeColor];
}

#pragma mark - item delegation and animation

-(void)itemWasPressedWithButton:(MenuItem *)button andTitle:(NSString *)title{
    [self selectedAnimation:button];

    if (self.delegate) {
        if([self.delegate respondsToSelector:@selector(buttonWasPressedWithTitle:)]){
            [self.delegate buttonWasPressedWithTitle:title];
        }
        
        if([self.delegate respondsToSelector:@selector(buttonWasPressedWithTag:)]){
            [self.delegate buttonWasPressedWithTag:button.tag];
        }
    }
}

-(void)selectedAnimation:(MenuItem *)button{
    
    for (MenuItem *btn in self.buttons) {
        if (btn.tag == button.tag){
            continue;
        }
        [UIView animateWithDuration:0.3 animations:^{
            btn.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    }
    
}

#pragma mark - Display configurations
-(BOOL)shouldAutorotate{
    return NO;
}

@end

