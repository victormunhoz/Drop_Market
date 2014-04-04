//
//  CircleCustomGesture.h
//  teste
//
//  Created by VICTOR MUNHOZ THEODORO on 10/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <uikit/UIGestureRecognizerSubclass.h>

@interface CircleCustomGesture : UIGestureRecognizer

@property int xInicial;
@property int yInicial;

@property int xFinal;
@property int yFinal;

@property int centroX;
@property int centroY;

@property int raioMaior;
@property int raioMenor;

@property UIView *largec;
@property UIView *smallc;

@end
