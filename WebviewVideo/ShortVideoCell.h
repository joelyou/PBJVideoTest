//
//  ShortVideoCell.h
//  WebviewVideo
//
//  Created by liyy on 15/1/12.
//  Copyright (c) 2015年 liyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBJVideoPlayerController.h"

@interface ShortVideoCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIView* containerView;
@property (nonatomic, weak) IBOutlet UILabel* label;
@property (nonatomic, strong) PBJVideoPlayerController* videoPlayer;

@end
