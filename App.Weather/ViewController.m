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
    int quoteIndex = arc4random_uniform(quotes.count);
    int locationIndex = arc4random_uniform(locations.count);
    int temperatur = [self getRandomNumberBetween:0 to:40];
    
    self.quote.text = quotes[quoteIndex];
    self.location.text = locations[locationIndex];
    self.temperatur.text = [NSString stringWithFormat: @"%d", temperatur];
    
    if(temperatur < 40 || temperatur > 27)
    {
        weatherphotos = @[@"Clear", @"Clouds", @"FewClouds"];
    }
    if(temperatur < 27 || temperatur > 20)
    {
        weatherphotos = @[@"Clouds", @"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
    }
    if(temperatur < 20 || temperatur > 5)
    {
        weatherphotos = @[@"Cloudy", @"FewClouds", @"HeavyRain", @"SmallRain", @"StormRain", @"ThunderLightning"];
    }
    if(temperatur < 5)
    {
        weatherphotos = @[@"Cloudy", @"SnowRain", @"SnowsClear", @"SnowsCloudy"];
    }
    
    int weatherphotoIndex = arc4random_uniform(weatherphotos.count);
    self.iweatherphoto.image = [UIImage imageNamed:weatherphotos[weatherphotoIndex]];

    
}

@end

