//
//  AvatarButton.m
//  tyresize
//
//  Created by meng qian on 13-9-3.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "AvatarButton.h"
#import <QuartzCore/QuartzCore.h>
#import "GradientNormalLabel.h"

@interface AvatarButton()

@property(strong, nonatomic)UIImageView *avatarView;
@property(strong, nonatomic)UIImageView *iconView;
@property(strong, nonatomic)UILabel *nameLabel;
@property(strong, nonatomic)GradientNormalLabel *titleLabel;
@end


#define BUTTON_RADIUS   53.0f
#define BUTTON_SQUARE   80.0f
#define ICON_SQUARE     25.0f

#define CRICLE_SQUARE   90.0f
#define CRICLE_RADIUS   45.0f


@implementation AvatarButton

@synthesize avatarImage, iconImage;
@synthesize name,title;
@synthesize avatarView, iconView;
@synthesize nameLabel, titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.avatarView = [[UIImageView alloc]initWithFrame:
                           CGRectMake(0, 0, BUTTON_SQUARE, BUTTON_SQUARE)];
        
        self.iconView = [[UIImageView alloc]initWithFrame:
                         CGRectMake(BUTTON_SQUARE-ICON_SQUARE, 0 , ICON_SQUARE, ICON_SQUARE)];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50.0f, frame.size.width, 20)];
        
        self.titleLabel = [[GradientNormalLabel alloc]initWithFrame:
                           CGRectMake(0, BUTTON_SQUARE, frame.size.width, 20)];
        
        [self addSubview:self.avatarView];
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
//    [self.avatarView setImage:[UIImage imageNamed:@"mactive_avatar.png"]];
//    [self.iconView setImage:[UIImage imageNamed:@"designer_icon.png"]];
//    self.nameLabel.text = T(@"Mactive");
//    self.titleLabel.text = T(@"iOS Developer");
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        NSLog(@"selected");
        [self drawCricleLine];
    }
}

- (void)setAvatarImage:(UIImage *)_avatarImage
{
    [self.avatarView setImage:_avatarImage];
}

- (void)setIconImage:(UIImage *)_iconImage
{
    [self.iconView setImage:_iconImage];
}

- (void)setName:(NSString *)nameString
{
    self.nameLabel.text = nameString;
}

- (void)setTitle:(NSString *)titleString
{
    self.titleLabel.text = titleString;
}



- (void)drawCricleLine
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
