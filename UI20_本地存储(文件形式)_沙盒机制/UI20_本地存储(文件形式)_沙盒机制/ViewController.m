//
//  ViewController.m
//  UI20_本地存储(文件形式)_沙盒机制
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ModelForPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark --- 知识点 1 APP 包路径

- (IBAction)findAPPPath:(id)sender {
    
    
   // NSBundle 类 路径
    
    // 获取 APP 包路径
    
 NSString *appPath =[[NSBundle mainBundle] resourcePath];
    
    NSLog(@"appPath:%@", appPath);
    
    // 获取 APP 包中的某一个资源路径
    
    NSString *resPath = [[NSBundle mainBundle] pathForResource:@"zhanghu" ofType:@"png"];
    
    NSLog(@"resPath:%@", resPath);
}

#pragma mark --- 知识点 2 沙盒 路径

- (IBAction)findsandBoxPath:(id)sender {
    
    
    // API: NSHomeDirectory 函数
    
   NSString *sandBoxPath = NSHomeDirectory();
    
   NSLog(@"sandBoxPath:%@", sandBoxPath);

}

#pragma mark --- 知识点 3 利用 API 快速获取沙盒中的个文件夹路径

- (IBAction)findPathForEveryOne:(id)sender {
    
    
    // API :  --->>>> NSSearchPathForDirectoriesInDomains
    
    /**
     * @brief 获取沙盒中 Document 文件夹路径
     *
     * @param directory 要查找的目录名(文件夹)
     * @param domainMask 在哪个 domain 中查找参数的目录名
     * @param BOOL expandTilde 是否展开波浪线 ~ NO (no 会精简路径用 ~ 替代之前的路径)
     * 例子
     * @return NSArray 将查找出来的目录路径放到一个数组中返回(因此可能会有多个相同的目录)
     *
     **/
    
    //NSDocumentDirectory 想找哪个文件夹 枚举 找document ,NSUserDomainMask 查找范围
    
NSString *docPath =  [NSSearchPathForDirectoriesInDomains ( NSDocumentDirectory,NSUserDomainMask, NO ) lastObject];
    
    NSLog(@"docPath:%@", docPath);
    
    
    /** 获取 Caches (缓存文件夹) 路径 */
    
    NSString *CachPath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"CachPath:%@", CachPath);
    
    
    /** 获取 tmp (临时文件夹)路径 */
    
    NSString *tmpPath  =  NSTemporaryDirectory ();
    NSLog(@"tmpPath :%@", tmpPath);
    
    /** 获取 Library (资源库) 路径 **/
    
    NSString *LibPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] ;
    
    NSLog(@"Library:%@", LibPath);
    
    /** 获取 library 文件夹下的 Preferences 文件夹路径 */
    
    NSString *PrePath = [LibPath stringByAppendingString:@"/Preferences"];
    NSLog(@"PrePath: %@", PrePath);
    
    /** 此方法 不需要加 竖杠| 此方法在拼接路径时常用*/
    NSString *PrePath2 = [LibPath stringByAppendingPathComponent:@"Preferences"];
    NSLog(@"PrePath2: %@", PrePath2);
    
    
    
}

#pragma mark -- 知识点 4 简单对象读写到本地

#pragma mark -- ** NSString 对象的读写

- (IBAction)handleNSStringWriteToDisk:(id)sender {
    
    // 沙盒路径
    NSLog(@"%@",NSHomeDirectory());
    
    /** 要保存的字符串对象 */
    NSString *str = @"iphone6";
    
    /** 文件保存路径 */
    NSString *docPath = [  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 拼接文件名
    NSString *file = [docPath stringByAppendingPathComponent:@"name.txt"];
    
    
    // 写入磁盘 disk
    [str writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    

    
}
/** 读取*/
- (IBAction)handlleNSStringReadFromDisk:(id)sender {
    
    
    /*文件所在的路径*/
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"name.txt"];
    
    /** 生成 NSString 对象 */
    NSString *readStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", readStr);
    
}


#pragma mark -- ** NSArry 对象的读写

- (IBAction)handleArrayWriteTODisk:(id)sender {
    
    NSArray *arr = @[@"zhang", @"wang", @"li"];
    
    NSLog(@"%@", NSHomeDirectory());
    
    
    //创建文件保存路径
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"array.plist"];
    
    
    // 写入数据 arr
    
    [arr writeToFile:file atomically:YES];
    
    
    
}
- (IBAction)handleNSArrayReadFromDisk:(id)sender {
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"array.plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:file];
    
    NSLog(@"%@", arr);
    
    
}

#pragma mark --- NSDictionary 对象的读写

// NSDictionary  对象写入

- (IBAction)handleDicWriteTodisk:(id)sender {
    
    
    NSLog(@"%@", NSHomeDirectory());
    
    NSDictionary *dic = @{@"name":@"zhang", @"sex":@"male"};
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
    
    [dic writeToFile:file atomically:YES];
    
}


// 本地读取 NSDictionary

- (IBAction)handleDicreadFromDisk:(id)sender {
    
    //路径
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"dic.plist"];
    
    
    //dic
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:file];
    
    NSLog(@"%@", dic);
    
    
    
}


#pragma mark ---NSData 对象

- (IBAction)handleDataWriteToDisk:(id)sender {
    
    
    //要存储的 data
    
    UIImage *image = [UIImage imageNamed:@"hai.jpg"];
    NSData *data = UIImageJPEGRepresentation(image, 1);
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hai.jpg"];
    
    //写入图片
    [data writeToFile:file atomically:YES];
    
}
- (IBAction)handleDataFromDisk:(id)sender {
    
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hai.jpg"];
    
    
    NSData *data = [NSData dataWithContentsOfFile:file];
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"%@", image);
    
    
    UIImage *image2 = [UIImage imageWithContentsOfFile:file];
    NSLog(@"%@", image2);


}



#pragma mark -- 知识点 5 复杂对象读写本地


- (IBAction)handleModelWriteTodisk:(id)sender {
    
    
    /** 要归档的 model 复杂对象 (!!!! 要归档的 model 类一定要实现 NSCoding 两个编码协议方法)*/
    
    ModelForPerson *per = [[ModelForPerson alloc] init];
    
    per.name = @"wangwu";
    per.sex = @"male";
    
    /** 创建归档时所需要得 Data 对象 */
    NSMutableData *data = [NSMutableData data];
    
    /** 归档类 */
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    /** 开始归档 */
    [archiver encodeObject:per forKey:@"per"];
    
    /** 归档结束 */
    [archiver finishEncoding];
    
    /** data 写入本地*/
    
    
    /** !!!!!!!!!!! 注意!!!!!!!!**/
    
    /**
     *  stringByAppendingPathComponent
     *
     *
     */
    
    
    
    //找路径
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    
    [data writeToFile:file atomically:YES];
    
    
}

/** 读取 */

- (IBAction)handleModleReadFromDisk:(id)sender {
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.da"];
    
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    /** 反归档类 **/
    NSKeyedUnarchiver *Unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    /** 解码 */
    ModelForPerson *per =  [Unarchiver decodeObjectForKey:@"per"];
    
    
    /** 反归档结束*/
    [Unarchiver finishDecoding];
    
    NSLog(@"%@, %@", per.name, per.sex);

}



#pragma mark - 知识点 6 NSFileManager 类 实现文件管理 

#pragma mark - 知识点 7 NSFileHandle 类









#pragma mark ---

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
