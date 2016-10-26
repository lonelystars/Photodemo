//
//  Compress.h
//  photo
//
//  Created by Smile on 16/7/14.
//  Copyright © 2016年 Smile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Compress : NSObject
//压缩
- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;
@end
