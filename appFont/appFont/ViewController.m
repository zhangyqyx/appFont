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
        _fontLists = [UIFont familyNames];
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
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        NSLog(@"familyNames = %@" , fontFamilyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            NSLog(@"  %@", fontName);
        }
        NSLog(@"---------");
    }
   
    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fontLists.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *fontFamily = self.fontLists[section];
    return [UIFont fontNamesForFamilyName:fontFamily].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSString *fontFamily = self.fontLists[indexPath.section];
    NSArray *fonts = [UIFont fontNamesForFamilyName:fontFamily];
    cell.textLabel.text = @"abc&123?ABC?字体!";
    cell.textLabel.font = [UIFont fontWithName:fonts[indexPath.row] size:17];
    cell.detailTextLabel.text = fonts[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
      NSString *fontFamily = self.fontLists[section];
    return fontFamily;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYFontViewController *fontVc = [[ZYFontViewController alloc] init];
    NSString *fontFamily = self.fontLists[indexPath.section];
    NSArray *fonts = [UIFont fontNamesForFamilyName:fontFamily];
    fontVc.fontStr = fonts[indexPath.row];
    [self.navigationController pushViewController:fontVc animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
