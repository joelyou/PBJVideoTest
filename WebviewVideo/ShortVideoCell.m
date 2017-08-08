//
//  ShortVideoCell.m
//  WebviewVideo
//
//  Created by liyy on 15/1/12.
//  Copyright (c) 2015年 liyy. All rights reserved.
//

#import "ShortVideoCell.h"

@implementation ShortVideoCell

- (void)awakeFromNib {
    self.videoPlayer = [[PBJVideoPlayerController alloc] init];
    self.videoPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.videoPlayer.view.frame = self.containerView.bounds;
    self.videoPlayer.muting = YES;
    [self.videoPlayer setPlaybackLoops:YES];
    [self.containerView addSubview:self.videoPlayer.view];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
