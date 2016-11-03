//
//  DPRContentHelper.h
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPRContentHelper : NSObject

// methods
- (NSString *)contentTextWithPageType:(NSString *)pageType;
- (NSAttributedString *)helpContent;

@end
