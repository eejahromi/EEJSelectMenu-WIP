//
//  EJMenuItem.h
//  EJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EJMenuItem;

@protocol EJMenuItemDelegate <NSObject>

@optional
-(void)EJMenuItemWasPressedWithButton:(EJMenuItem *)button andTitle:(NSString *)title;
-(void)EJMenuItemWasPressedWithTag:(long)tag;

@end
@interface EJMenuItem : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIColor *selectedStateColor;

@property (nonatomic,assign) id<EJMenuItemDelegate> delegate;

@end
