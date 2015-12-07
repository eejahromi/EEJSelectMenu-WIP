//
//  MenuItem.m
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem{
    UIButton *button;
}
// TODO: take care of all initializers
-(instancetype)init{
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.0;
        [self setButtonTitle:self.title];
        button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.userInteractionEnabled = YES;
        [self addSubview:button];
    }
    
    return self;
}

-(void)setTitle:(NSString *)title{
    [self setButtonTitle:title];
}


-(void)setButtonTitle:(NSString *)title{
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }else{
        [button setTitle:@"Button" forState:UIControlStateNormal];
    }
    
}

-(void)expandAnimation{
    [UIView animateWithDuration:0.7 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)buttonPressed:(UIButton *)buttonItem{

    buttonItem.backgroundColor = self.selectedStateColor ? self.selectedStateColor : [UIColor purpleColor];
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(itemWasPressedWithButton:andTitle:)]) {
            [self.delegate itemWasPressedWithButton:self andTitle:buttonItem.titleLabel.text];
        }
        

    }
}

@end

