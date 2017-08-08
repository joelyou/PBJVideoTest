//
//  ViewController.m
//  WebviewVideo
//
//  Created by liyy on 15/1/9.
//  Copyright (c) 2015年 liyy. All rights reserved.
//

#import "ViewController.h"
#import "ShortVideoCell.h"
@import MediaPlayer;
@import AVFoundation;


@interface ViewController ()
@end

@implementation ViewController
{
    MPMoviePlayerController * _player;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.rowHeight = 230;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
//    // Do any additional setup after loading the view, typically from a nib.
//    
////
////    NSString* htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
////    
////    [self.webView loadHTMLString:htmlString baseURL:nil];
//    
//    NSString* path = [[NSBundle mainBundle]pathForResource:@"e38c9468e907feafbb43158c105781.mp4" ofType:nil];
//    NSURL* url = [NSURL fileURLWithPath:path];
//    _player = [[MPMoviePlayerController alloc] initWithContentURL: url];
//    [_player.view setFrame:CGRectMake(0, 0, 200, 150)];
//    _player.movieSourceType = MPMovieSourceTypeFile;
//    _player.repeatMode = MPMovieRepeatModeOne;
//    [self.view addSubview: _player.view];
//    [_player prepareToPlay];
//    [_player play];
//    
//    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
//    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
//    [audioSession setActive:NO error:nil];
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath: %d", indexPath.row);
    
    ShortVideoCell* cell = (ShortVideoCell*)[tableView dequeueReusableCellWithIdentifier:@"ShortVideoCell"];
    if (cell == nil) {
        
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"ShortVideoCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    
    NSInteger index = indexPath.row % 4;
    cell.label.text = [NSString stringWithFormat:@"row:%d,  %d.mp4", indexPath.row, index];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willDisplayCell: %d", indexPath.row);
    
    NSInteger index = indexPath.row % 4;
    NSString* path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%d.mp4", index+1] ofType:nil];
    
    ShortVideoCell* videoCell = (ShortVideoCell*)cell;
    videoCell.videoPlayer.videoPath = path;
    [videoCell.videoPlayer playFromCurrentTime];

}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    ShortVideoCell* videoCell = (ShortVideoCell*)cell;
    [videoCell.videoPlayer stop];
}

@end
