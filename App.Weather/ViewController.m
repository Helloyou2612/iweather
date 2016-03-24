//
//  ViewController.m
//  App.Weather
//
//  Created by Man Ngoc Lam on 12/9/15.
//  Copyright © 2015 Man Ngoc Lam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *temperatur;
@property (weak, nonatomic) IBOutlet UIImageView *iweatherphoto;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UIButton *btnTemperatur;

@end

@implementation ViewController
{
    NSArray* locations;
    NSArray* weatherphotos;
    NSArray* quotes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    quotes = @[@"Không có hoàn cảnh nào tuyệt vọng, chỉ có người tuyệt vọng vì hoàn cảnh.",@"Ta không được chọn nơi mình sinh ra. Nhưng ta được chọn cách mình sẽ sống.",@"Đừng so sánh mình với bất cứ ai trong thế giới này. Nếu bạn làm như vậy có nghĩa bạn đang sỉ nhục chính bản thân mình.",@"Đừng thở dài hãy vươn vai mà sống. Bùn dưới chân nhưng nắng ở trên đầu.",@"Hãy sống là chình mình, bình thường chứ không tầm thường.",@"Bạn sinh ra đã là một nguyên bản, đừng chết như một bản sao.",@"Đừng ngại thay đổi. Bạn có thể mất một cái gì đó tốt nhưng bạn có thể đạt được một cái gì đó còn tốt hơn.",@"Một câu niệm Phật, tiêu vạn tội. Hai chữ Từ bi, giải vạn sầu."];
    locations = @[@"Thuận Thành, Bắc Ninh", @"Yên Hoà, Cầu Giấy, Hà Nội", @"Sóc Sơn, Hà Nội", @"Bản Lác, Hoà Bình", @"Y Tý, Lào Cai", @"Q2, TP. Hồ Chí Minh", @"Phố Cổ Hội An, Đà Nẵng", @"Hạ Long, Quảng Ninh", @"Phú Quốc", @"Thành Nhà Hồ, Quảng Trị"];
    //weatherphotos = @[@"Clear", @"Clouds", @"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"SnowRain", @"SnowsClear", @"SnowsCloudy", @"StormRain", @"ThunderLightning", ];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

- (IBAction)btnUpdate:(id)sender {
    int quoteIndex = arc4random_uniform((int)quotes.count);
    int locationIndex = arc4random_uniform((int)locations.count);
    int temperatur ;
    
    NSString *buttonTitle = self.btnTemperatur.currentTitle;
    
    if([buttonTitle  isEqual: @"C"])
    {
        temperatur = [self getRandomNumberBetween:0 to:37];
        
        if(temperatur < 5)
        {
            weatherphotos = @[@"Cloudy", @"SnowRain", @"SnowsClear", @"SnowsCloudy"];
        }
        else if(temperatur < 20)
        {
            weatherphotos = @[@"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
        }
        else if(temperatur < 27)
        {
            weatherphotos = @[@"Clouds", @"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
        }
        else if(temperatur < 37)
        {
            weatherphotos = @[@"Clear", @"Clouds", @"FewClouds"];
        }
    }
    else{
        temperatur = [self getRandomNumberBetween:32 to:99];
        
        if(temperatur < 41)
        {
            weatherphotos = @[@"Cloudy", @"SnowRain", @"SnowsClear", @"SnowsCloudy"];
        }
        else if(temperatur < 68)
        {
            weatherphotos = @[@"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
        }
        else if(temperatur < 81)
        {
            weatherphotos = @[@"Clouds", @"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
        }
        else if(temperatur < 99)
        {
            weatherphotos = @[@"Clear", @"Clouds", @"FewClouds"];
        }
    }
    self.quote.text = quotes[quoteIndex];
    self.location.text = locations[locationIndex];
    self.temperatur.text = [NSString stringWithFormat: @"%d", temperatur];
    
    
    int weatherphotoIndex = arc4random_uniform((int)weatherphotos.count);
    self.iweatherphoto.image = [UIImage imageNamed:weatherphotos[weatherphotoIndex]];

    
}
- (IBAction)ConvertTemperatur:(id)sender {
    // Make sure it's a UIButton
    if (![sender isKindOfClass:[UIButton class]])
        return;
    //Get title of btn
    NSString *buttonTitle = [(UIButton *)sender currentTitle];
    //convert giá trị text sang int
    int temp = [self.temperatur.text intValue];
    
    if([buttonTitle  isEqual: @"C"])
    {
        [sender setTitle:@"F" forState:UIControlStateNormal];
        
        int temperaturF = (temp*1.8)+32;
        NSLog(@"temperaturF %d",(int)self.temperatur.text);
        NSLog(@"temperaturF %d",temperaturF);
        self.temperatur.text = [NSString stringWithFormat:@"%d", temperaturF];
    }
    else{
        [sender setTitle:@"C" forState:UIControlStateNormal];
        
        int temperaturC = (temp-32)/1.8;
        NSLog(@"temperaturC %d",(int)self.temperatur.text);
        NSLog(@"temperaturC %d",temperaturC);
        self.temperatur.text = [NSString stringWithFormat:@"%d", temperaturC];

    }
}

@end

