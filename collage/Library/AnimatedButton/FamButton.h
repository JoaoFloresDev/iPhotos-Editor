//
//  FamButton.h
//  Photo Collage Maker
//
//  Created by Grapes Infosoft on 14/09/19.
//  Copyright © 2019 Grapes Infosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamButton : UIButton

-(void)setSelected:(BOOL)selected withAnimation:(BOOL)shouldAnimate;
-(void)setDefaultImageWithImageName:(NSString *)imageName;
-(void)setSelectedImageWithImageName:(NSString *)imageName andColor:(UIColor*)color;

@end
