//
//  KSCollectionViewCell.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSCellProtocol.h"
#import "KSCollectionViewCellProtocol.h"

@interface KSCollectionViewCell : UICollectionViewCell <KSCellProtocol, KSCollectionViewCellProtocol>

@end
