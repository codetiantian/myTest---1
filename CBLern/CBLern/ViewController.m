//
//  ViewController.m
//  CBLern
//
//  Created by Elaine on 15--5.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "ViewController.h"
//#import "NSNull+MyNull.h"
#import "NSString+StringToHexData.h"
#import "NSData+DataToHexString.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *arrayData;

@end

@implementation ViewController

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray arrayWithObjects:@"毛玻璃效果", @"创建按钮", @"弹出动画", @"输入表情测试", @"测试TableView拉伸", @"尺子测量", @"测试", @"CollectionView", @"转场动画", @"CAShapeLayer", nil];
    }
    
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //  测试艾康
    
    
    NSString *strBloodKetoneResult = [NSString stringWithFormat:@"%.2f", 283 / 18.00 + 0.05];
    
    NSArray *arrayResult =  [strBloodKetoneResult componentsSeparatedByString:@"."];
    NSString *strHead = arrayResult[0];
    NSString *strFoot = arrayResult[1];
    NSString *strFootResult = [strFoot substringWithRange:NSMakeRange(0, 1)];
    NSString *strMyResult = [NSString stringWithFormat:@"%@.%@", strHead, strFootResult];
    
    NSLog(@"----%@", strMyResult);
    
    NSArray *array1 = @[[NSNull null]];
    
    NSString *str1 = [array1[0] firstObject];
    
    NSLog(@"-----%@", str1);
    
    [self jisuan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellIndex = @"CellIndex";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellIndex];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellIndex];
    }
    
    cell.textLabel.text = self.arrayData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self turnToVCWithIndex:indexPath];
}

#pragma mark - 跳转页面
- (void)turnToVCWithIndex:(NSIndexPath *)indexPath
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    switch (indexPath.row) {
        case 0:         //  毛玻璃效果
        {
            [self performSegueWithIdentifier:@"turnToDimVC" sender:self];
        }
            break;
            
        case 1:
        {
            [self performSegueWithIdentifier:@"turnToCreateButtonVC" sender:self];
        }
            break;
            
        case 2:
        {
            [self performSegueWithIdentifier:@"turnToPopVC" sender:self];
        }
            break;
            
        case 3:
        {
            [self performSegueWithIdentifier:@"CBImputVC" sender:self];
        }
            break;
            
        case 4:
        {
            [self performSegueWithIdentifier:@"StrectchVC" sender:self];
        }
            break;
            
        case 5:
        {
            [self performSegueWithIdentifier:@"meansVC" sender:self];
        }
            break;
            
        case 6:
        {
            [self performSegueWithIdentifier:@"turnToTestVC" sender:self];
        }
            break;
            
        case 7:
        {
            [self performSegueWithIdentifier:@"trunToCollectionVC" sender:self];
        }
            break;
            
        case 8:
        {
            [self performSegueWithIdentifier:@"turnToCB" sender:self];
        }
            break;
            
        case 9:
        {
            [self performSegueWithIdentifier:@"CBShapeLayerVC" sender:self];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 计算
- (void)jisuan
{
//    NSData *data = @();
//    Byte * byte = (Byte *)[data bytes];
//    NSString *hexStr=@"";
//    NSMutableArray * array = [NSMutableArray array];
//    for(int i=0;i<[data length];i++)
//    {
//        NSString *newHexStr = [NSString stringWithFormat:@"%x",byte[i]&0xff]; ///16进制数
//        if([newHexStr length]==1)
//        {
//            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
//            [array addObject:[NSString stringWithFormat:@"0%@",newHexStr]];
//        }
//        else
//        {
//            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
//            [array addObject:newHexStr];
//        }
//    }
//    YNLog(@"bytes 的16进制数为:%@",hexStr);
    //    NSArray * array = @[@"87",@"00",@"00",@"DD",@"07",@"0A",@"19",@"13",@"32",@"24",@"00",@"00",@"37",@"C0",@"11"];
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"07", @"00", @"00", @"d9", @"07", @"0c", @"02", @"02", @"2c", @"00", @"00", @"00", @"f0", @"07", @"11", nil];
    
    if (array.count == 15) {
        NSString * str1 = array[array.count - 2];
        NSString * str2 = array[array.count - 3];
        
        NSString *strHex = [NSString stringWithFormat:@"%@%@",str2, str1];
        NSString *strResult = [self getBinaryByhex:strHex];
        
        NSString *strM = [strHex substringWithRange:NSMakeRange(1, 3)];
        NSString *strN = [strResult substringWithRange:NSMakeRange(0, 4)];
        NSLog(@"---%@", strResult);
        
        unsigned long resultM = [self getLongIntWithString:strM];
        unsigned long resultN = [self getIntWithString:strN];
        
        float myResultValue = resultM;
        float resultP = powl(10, (16 - resultN));
        
        float resultBlood = myResultValue / resultP;
        NSLog(@"%.1f", resultBlood);
        
        
        NSString * indexStr = [str1 substringToIndex:1];
        NSString * hexStr = [NSString stringWithFormat:@"%@%@",[str1 substringFromIndex:str1.length - 1],str2];
        
        unsigned long result = strtoul([hexStr UTF8String],0,16);
        unsigned long index = strtoul([indexStr UTF8String], 0, 16);
        int realIndex = -(16 - index);
        long double realResult = result * powl(10, realIndex) * 1000;
        if (realResult < 1.1) {
//            self.messageStateLabel.text = @"你的血糖低于检测范围";
//            self.changeImageView.image = [UIImage imageNamed:@"check_invalidValue"];
        }else if (realResult > 33.3)
        {
//            self.messageStateLabel.text = @"你的血糖高于检测范围";
//            self.changeImageView.image = [UIImage imageNamed:@"check_invalidValue"];
        }else
        {
//            self.changeImageView.hidden = YES;
//            self.valueView.hidden = NO;
//            self.checkValue = [NSString stringWithFormat:@"%.1f",((int)(realResult * 10)) / 10.0];
//            self.messageStateLabel.text = MessageResult;
//            if (self.check) {
//                [self postServerAndSaveSQLite];
//            }
//            self.valueLabel.text = self.checkValue;
            
        }
//        self.finishBtn.enabled = YES;
    }

}

#pragma mark - 二进制转变成十进制
- (unsigned long)getIntWithString:(NSString *)hex
{
    unsigned long resultValue = 0;
    
    for (NSInteger j = 0; j < hex.length; j++) {
        char value = [hex characterAtIndex:j];
        NSInteger i = hex.length - 1 - j;
        if (value == '0') {
            resultValue += 0 * powl(2, i);
        } else if (value == '1') {
            resultValue += 1 * powl(2, i);
        }
    }
    
    return resultValue;
}

#pragma mark - 十六进制转变成十进制
- (unsigned long)getLongIntWithString:(NSString *)hex
{
    unsigned long resultValue = 0;
    
    for (NSInteger j = 0; j < hex.length; j++) {
        char value = [hex characterAtIndex:j];
        NSInteger i = hex.length - 1 - j;
        
        NSInteger valueR = [self charToInt:value];
        resultValue += valueR * powl(16, i);
    }
    return resultValue;
}

- (NSInteger)charToInt:(char)value
{
    if (value == '0') {
        return 0;
    } else if (value == '1') {
        return 1;
    } else if (value == '2') {
        return 2;
    } else if (value == '3') {
        return 3;
    } else if (value == '4') {
        return 4;
    } else if (value == '5') {
        return 5;
    } else if (value == '6') {
        return 6;
    } else if (value == '7') {
        return 7;
    } else if (value == '8') {
        return 8;
    } else if (value == '9') {
        return 9;
    } else if (value == 'a') {
        return 10;
    } else if (value == 'A') {
        return 10;
    } else if (value == 'b') {
        return 11;
    } else if (value == 'B') {
        return 11;
    } else if (value == 'c') {
        return 12;
    } else if (value == 'C') {
        return 12;
    } else if (value == 'd') {
        return 13;
    } else if (value == 'D') {
        return 13;
    } else if (value == 'e') {
        return 14;
    } else if (value == 'E') {
        return 14;
    } else if (value == 'f') {
        return 15;
    } else if (value == 'F') {
        return 15;
    }
    
    return 0;
}


//将16进制转化为二进制
-(NSString *)getBinaryByhex:(NSString *)hex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    [hexDic setObject:@"0000" forKey:@"0"];
    
    [hexDic setObject:@"0001" forKey:@"1"];
    
    [hexDic setObject:@"0010" forKey:@"2"];
    
    [hexDic setObject:@"0011" forKey:@"3"];
    
    [hexDic setObject:@"0100" forKey:@"4"];
    
    [hexDic setObject:@"0101" forKey:@"5"];
    
    [hexDic setObject:@"0110" forKey:@"6"];
    
    [hexDic setObject:@"0111" forKey:@"7"];
    
    [hexDic setObject:@"1000" forKey:@"8"];
    
    [hexDic setObject:@"1001" forKey:@"9"];
    
    [hexDic setObject:@"1010" forKey:@"A"];
    
    [hexDic setObject:@"1011" forKey:@"B"];
    
    [hexDic setObject:@"1100" forKey:@"C"];
    
    [hexDic setObject:@"1101" forKey:@"D"];
    
    [hexDic setObject:@"1110" forKey:@"E"];
    
    [hexDic setObject:@"1111" forKey:@"F"];
    
    [hexDic setObject:@"1010" forKey:@"a"];
    
    [hexDic setObject:@"1011" forKey:@"b"];
    
    [hexDic setObject:@"1100" forKey:@"c"];
    
    [hexDic setObject:@"1101" forKey:@"d"];
    
    [hexDic setObject:@"1110" forKey:@"e"];
    
    [hexDic setObject:@"1111" forKey:@"f"];
    
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[hex length]; i++) {
        
        NSRange rage;
        
        rage.length = 1;
        
        rage.location = i;
        
        NSString *key = [hex substringWithRange:rage];
        
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]);
        
        binaryString = [NSString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
        
    }
    
    //NSLog(@"转化后的二进制为:%@",binaryString);
    
    return binaryString;
    
}

@end
