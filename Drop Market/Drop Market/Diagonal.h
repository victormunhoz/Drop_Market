//
//  Diagonal.h
//  teste2
//
//  Created by Victor Munhoz Theodoro on 17/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <uikit/UIGestureRecognizerSubclass.h>

@interface Diagonal : UIGestureRecognizer

@property float pontoXRef;
@property float pontoYRef;
@property float pontoXInicial;
@property float pontoYInicial;
@property float distancePoints;
@property CGRect tela;

@end
