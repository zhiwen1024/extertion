//
//  HMTableViewController.m
//
//
//  Created by apple on 13/12/12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HMTableViewController.h"
#import "HMWeibo.h"
#import "HMWeiboCell.h"
#import "HMWeiboFrame.h"
@interface HMTableViewController ()

// 存放微博数据
//@property (nonatomic, strong) NSArray *weibos;

@property (nonatomic, strong) NSArray *weiboFrames;


@end

@implementation HMTableViewController

/************************************ 懒加载微博数据 ************************************/
- (NSArray *)weiboFrames
{
    if (_weiboFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayTmp = [NSArray arrayWithContentsOfFile:path];

        NSMutableArray *arrayFrameModels = [NSMutableArray array];
        
        for (int i = 0; i<arrayTmp.count; i++) {
            HMWeibo *model = [HMWeibo weiboWithDict:arrayTmp[i]];
            
            HMWeiboFrame *frameModel = [[HMWeiboFrame alloc] init];
            // 在setWeibo方法中实现计算坐标
            frameModel.weibo = model;
            
            [arrayFrameModels addObject:frameModel];
        }
        _weiboFrames = arrayFrameModels;

    }
    return _weiboFrames;
}



/************************************ 隐藏状态栏 ************************************/
- (BOOL)prefersStatusBarHidden
{
    return YES;
}





- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/****************************** 数据源方法 ******************************/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiboFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 获取带Frame的model
    HMWeiboFrame *model = self.weiboFrames[indexPath.row];
    
    
    // 2. 创建单元格
    static NSString *ID = @"weibo_cell";
    HMWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HMWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 3. 设置单元格数据
    cell.weiboFrame = model;
    
    // 4. 返回单元格
    return cell;
}


/****************************** 代理方法: 设置每行的高度都不同 ******************************/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.weiboFrames[indexPath.row] cellHeight];
}













@end
