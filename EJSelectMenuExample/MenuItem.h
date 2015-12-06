//
//  MenuItem.h
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItem;

@protocol MenuItemDelegate <NSObject>

@optional
-(void)itemWasPressedWithButton:(MenuItem *)button andTitle:(NSString *)title;
-(void)itemWasPressedWithTag:(long)tag;

@end
@interface MenuItem : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIColor *selectedStateColor;

@property (nonatomic,assign) id<MenuItemDelegate> delegate;

@end
