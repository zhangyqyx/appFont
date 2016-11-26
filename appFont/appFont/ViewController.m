//
//  ViewController.m
//  appFont
//
//  Created by 张永强 on 16/11/25.
//  Copyright © 2016年 LDWL. All rights reserved.
//

#import "ViewController.h"
#import "ZYFontViewController.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
/**所有字体*/
@property (nonatomic, strong)NSArray *fontLists;

@end

@implementation ViewController

- (NSArray *)fontLists {
    if (!_fontLists) {
        NSString *path  = [[NSBundle mainBundle]pathForResource:@"FontList.plist" ofType:nil];
        _fontLists = [NSArray arrayWithContentsOfFile:path];
    }
   return  _fontLists;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 70;
    tableView.sectionHeaderHeight = 40;
    [self.view addSubview:tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fontLists.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.fontLists[section];
    NSArray *fonts = dic[@"fonts"];
    return fonts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.fontLists[indexPath.section];
    NSArray *fonts = dic[@"fonts"];
    cell.textLabel.text = @"abc&123?ABC?字体!";
    cell.textLabel.font = [UIFont fontWithName:fonts[indexPath.row] size:17];
    cell.detailTextLabel.text = fonts[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = self.fontLists[section];
    return dic[@"fontFamily"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYFontViewController *fontVc = [[ZYFontViewController alloc] init];
    NSDictionary *dic = self.fontLists[indexPath.section];
    NSArray *fonts = dic[@"fonts"];
    fontVc.fontStr = fonts[indexPath.row];
    [self.navigationController pushViewController:fontVc animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
