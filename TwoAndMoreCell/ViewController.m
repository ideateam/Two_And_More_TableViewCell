//
//  ViewController.m
//  TwoAndMoreCell
//
//  Created by Derek on 2017/4/28.
//  Copyright © 2017年 www.ioslover.club. All rights reserved.
//

#import "ViewController.h"
#import "First_TableViewCell.h"
#import "Second_TableViewCell.h"
#import "Third_TableViewCell.h"
#import "Fourth_TableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_F_dataArray;//第一个cell的数据
    NSMutableArray *_S_dataArray;//第二个cell的数据
    NSMutableArray *_T_dataArray;//第三个cell的数据
    NSMutableArray *_Four_dataArray;//第四个cell的数据
    NSArray * F_mark_num_array;//规定哪些cell展示第一个cell的内容
    NSArray * S_mark_num_array;//规定哪些cell展示第二个cell的内容
    NSArray * T_mark_num_array;//规定哪些cell展示第三个cell的内容
    NSArray * Four_mark_num_array;//规定哪些cell展示第三个cell的内容
    
    

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title=@"各种cell混排";
    
    //初始化数组
    _F_dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    _S_dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    _T_dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    _Four_dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    //初始化数组
    F_mark_num_array=[[NSArray alloc]init];
    S_mark_num_array=[[NSArray alloc]init];
    T_mark_num_array=[[NSArray alloc]init];
    Four_mark_num_array=[[NSArray alloc]init];
    
    //数据来源
     //第一个cell的数据
    [_F_dataArray addObject:@"first1.png"];
    [_F_dataArray addObject:@"first2.png"];
    [_F_dataArray addObject:@"first3.png"];
    //第二个cell的数据
    [_S_dataArray addObject:@"news_image.png"];
     //第三个cell的数据
    [_T_dataArray addObject:@"video_shortcut.png"];
    //第四个cell的数据
    [_Four_dataArray addObject:@"four_news.png"];
    
    
    //确定在哪个indexPath.row显示各自的cell
    F_mark_num_array=@[@"1",@"4",@"12",@"9",@"19"];
    
    S_mark_num_array=@[@"0",@"6",@"13",@"8",@"16"];

    T_mark_num_array=@[@"2",@"7",@"10",@"5",@"15",@"18"];
    
    Four_mark_num_array=@[@"3",@"11",@"14",@"17"];
    
    //表格视图
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [_tableView registerNib:[UINib nibWithNibName:@"First_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId_first"];
    [_tableView registerNib:[UINib nibWithNibName:@"Second_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId_second"];
    [_tableView registerNib:[UINib nibWithNibName:@"Third_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId_third"];
    [_tableView registerNib:[UINib nibWithNibName:@"Fourth_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId_Fourth"];
    
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //判断哪些cell的高度自定义height
    int judgeNum=0;
    
    for (int i=0; i<(int)F_mark_num_array.count; i++)
    {
        if ([F_mark_num_array[i] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            judgeNum=163;
        }
    }
    for (int j=0; j<(int)S_mark_num_array.count; j++)
    {
        if ([S_mark_num_array[j] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            judgeNum=119;
        }
    }
    for (int k=0; k<(int)T_mark_num_array.count; k++)
    {
        if ([T_mark_num_array[k] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            judgeNum=250;
        }
    }
    for (int m=0; m<(int)Four_mark_num_array.count; m++)
    {
        if ([Four_mark_num_array[m] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            judgeNum=119;
        }
    }
    
    return judgeNum;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;//也即是(F_mark_num_array.count+S_mark_num_array.cout+T_mark_num_array.count+Four_mark_num_array.count)
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //判断四种cell的数据加载在哪些自定义位置indexPath
    
    UITableViewCell *finalCell=[[UITableViewCell alloc]init];
    
    
    //第一种cell
    for (int i=0; i<(int)F_mark_num_array.count; i++)
    {
        if ([F_mark_num_array[i] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            
            First_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId_first"];
            
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"First_TableViewCell" owner:self options:nil]lastObject];
            }
            
            cell.first_lable_title.text=@"这是一个美好的时代，新的开始";
            cell.first_image_view_one.image=[UIImage imageNamed:_F_dataArray[0]];
            cell.first_image_view_sec.image=[UIImage imageNamed:_F_dataArray[1]];
            cell.first_image_view_th.image=[UIImage imageNamed:_F_dataArray[2]];
            
            finalCell=cell;

        }
    }
    
    //第二种cell
    for (int j=0; j<(int)S_mark_num_array.count; j++) {
        if ([S_mark_num_array[j] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            
            Second_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId_second"];
            
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"Second_TableViewCell" owner:self options:nil]lastObject];
            }
            
            cell.sec_image_view.image=[UIImage imageNamed:_S_dataArray[0]];
            cell.sec_lable_title_top.text=@"天舟一号完美升空，这是中国科技的发展创举";
            cell.sec_lable_title_bottom.text=@"天舟一号将承载14亿中国人民的梦铸就一个更加美好的中国未来，这是一个完美的科技创举，也是跻身世界前列的里程碑之一，期待后续的持续发展和规划";
            
            finalCell=cell;
        }
    }

    

    //第三种cell
    
    for (int k=0; k<(int)T_mark_num_array.count; k++) {
        if ([T_mark_num_array[k] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            
            Third_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId_third"];
            
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"Third_TableViewCell" owner:self options:nil]lastObject];
            }
            cell.third_lable_title.text=@"天将雄星获得100亿票房，这是我编的";
            cell.third_image_view.image=[UIImage imageNamed:_T_dataArray[0]];
            cell.play_video.image=[UIImage imageNamed:@"Video_play.png"];
            
            finalCell=cell;

        }
    }
    
    //第四种cell
    for (int m=0; m<(int)Four_mark_num_array.count; m++) {
        if ([Four_mark_num_array[m] isEqualToString:[NSString stringWithFormat:@"%d",(int)indexPath.row]]) {
            
            Fourth_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId_Fourth"];
            
            if (cell==nil) {
                cell=[[[NSBundle mainBundle]loadNibNamed:@"Fourth_TableViewCell" owner:self options:nil]lastObject];
            }
            cell.Title_table.text=@"美国总统特朗普断然拒绝与蔡英文通话提议 中方回应";
            cell.News_image_View.image=[UIImage imageNamed:_Four_dataArray[0]];
            cell.Short_Title_lable.text=@"台湾地区领导人蔡英文近期曾表示不排除和特朗普进行新一轮通话。特朗普总统昨天在接受采访时被问及此事，他表示对此不感兴趣，称这会给中国造成麻烦，也就是说，他断然拒绝了与蔡英文通话的提议";
            finalCell=cell;
            
        }
    }

    
    //返回
    
    return finalCell;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
