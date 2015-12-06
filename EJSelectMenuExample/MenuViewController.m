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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMenuItems];
}

-(void)setupMenuItems{
    
    [self setBackgroundColor:self.color];
    self.buttons = [NSMutableArray array];
    alternate = YES;
    self.numberOfButtons = self.buttonNames.count;
    
    CGFloat heightBasedOnNumberOfButtons = ((self.view.bounds.size.height - 20) / self.numberOfButtons) - 1.0;
    
    for (int i=0; i<self.numberOfButtons; i++) {
        self.item = [[MenuItem alloc]
                     initWithFrame:CGRectMake(1, 20 + (i * heightBasedOnNumberOfButtons) + i, self.view.bounds.size.width - 2, heightBasedOnNumberOfButtons)];
        self.item.title = self.buttonNames[i];
        // TODO: create a property for this
        self.item.backgroundColor = [UIColor orangeColor];
        // TODO: test selectedStateColor
        self.item.tag = 100 + i;
        self.item.delegate = self;
        // TODO: remove this line
        self.item.alpha = 0.0;
        
        
        [self.buttons addObject:self.item];
        [self.view addSubview:self.item];
    }
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
//    switch (self.animationStyle) {
//        case AnimationStyleFade:
//            [self expandAnimation];
//            break;
//        case AnimationStyleWiden:
//            [self expandAnimation];
//            break;
//            
//        default:
//            break;
//    }
    
    
    //    float delay = 0.0;
    //    for (MenuItem *menu in self.buttons) {
    //
    //        [self performSelector:@selector(showButton:) withObject:menu afterDelay:delay];
    //        delay += 0.15;
    //    }
    
    //    __block float delay = 0.0;
    //    [self.buttons enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        MenuItem *menu = (MenuItem *)obj;
    //        [self performSelector:@selector(showButton:) withObject:menu afterDelay:delay];
    //        delay += 0.1;
    //    }];
    
    [self expandAnimation];
}

-(void)expandAnimation{
    
    __block float delay = 0.0;
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MenuItem *menu = (MenuItem *)obj;
        [self performSelector:@selector(showButton:) withObject:menu afterDelay:delay];
        delay += 0.1;
    }];
}

-(void)expandAnimationReverse{
    
    __block float delay = 0.0;
    [self.buttons enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MenuItem *menu = (MenuItem *)obj;
        [self performSelector:@selector(showButton:) withObject:menu afterDelay:delay];
        delay += 0.1;
    }];
}


-(void)showButton:(MenuItem *)item{
    [UIView animateWithDuration:0.3 animations:^{
        //item.transform = CGAffineTransformMakeScale(1.0, 1.0);
        //item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
        item.alpha = 1.0;
    }];
}

//-(void)showButton:(MenuItem *)item{
//
//    if (alternate) {
//        if (even) {
//            even = !even;
//
//            // animate in from sides
//            item.frame = CGRectMake(-self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
//            [UIView animateWithDuration:0.3 animations:^{
//                //item.transform = CGAffineTransformMakeScale(1.0, 1.0);
//                item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
//
//
//                item.alpha = 1.0;
//            }];
//        }else{
//            even = !even;
//            // animate in from sides
//            item.frame = CGRectMake(self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
//            [UIView animateWithDuration:0.3 animations:^{
//                //item.transform = CGAffineTransformMakeScale(1.0, 1.0);
//                item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
//
//
//                item.alpha = 1.0;
//            }];
//
//        }
//
//    }else{
//            //item.layer.anchorPoint = CGPointMake(0.5, 0.5);
//
//            // Grow from middle animation
//            item.transform = CGAffineTransformMakeScale(0.0, 0.0);
//
//
//            // animate in from sides
//            //item.frame = CGRectMake(-self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
//
//            [UIView animateWithDuration:0.3 animations:^{
//                item.transform = CGAffineTransformMakeScale(1.0, 1.0);
//
//                //item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
//
//                item.alpha = 1.0;
//            }];
//    }
//}

-(void)setColor:(UIColor *)color{
    [self setBackgroundColor:color];
}

-(void)setBackgroundColor:(UIColor *)color{
    if (color) {
        self.view.backgroundColor = color;
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
}

-(void)itemWasPressedWithButton:(MenuItem *)button andTitle:(NSString *)title{
    [self selectedAnimation:button];
    
    if (self.delegate) {
        if([self.delegate respondsToSelector:@selector(buttonWasPressedWithTitle:)]){
            [self.delegate buttonWasPressedWithTitle:title];
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


//-(void)buttonPressed:(UIButton *)button{
//    //NSLog(@"Button %@",button.titleLabel.text);
//    if (self.delegate) {
//        if ([self.delegate respondsToSelector:@selector(buttonWasPressedWithTitle:)]) {
//            [self.delegate buttonWasPressedWithTitle:button.titleLabel.text];
//        }
//
//        if ([self.delegate respondsToSelector:@selector(buttonWasPressedWithTag:)]) {
//            [self.delegate buttonWasPressedWithTag:button.tag];
//        }
//        [self dismissViewControllerAnimated:YES completion:nil];
//
//    }
//}


-(BOOL)shouldAutorotate{
    return NO;
}

@end

