//
//  Diagonal.m
//  teste2
//
//  Created by Victor Munhoz Theodoro on 17/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "Diagonal.h"

@implementation Diagonal

-(id)initWithTarget:(id)target action:(SEL)action{
    
    if (self = [super initWithTarget:target action:action]) {
        
        if (self) {
            self.tela = [[UIScreen mainScreen]bounds];
            self.pontoXRef = self.tela.size.width;
            self.pontoYRef = self.tela.size.height;
            
        }
        
    }

    return self;
}

-(void)reset{
    
    [super reset];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    self.pontoXInicial = [touch locationInView:self.view].x;
    self.pontoYInicial = [touch locationInView:self.view].y;
    
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    self.distancePoints = sqrt(pow([touch locationInView:self.view].x - self.pontoXInicial, 2) + pow([touch locationInView:self.view].y - self.pontoYInicial, 2));
    
    if ([touch locationInView:self.view].x > [self pontoXInicial] && [touch locationInView:self.view].x < [self pontoXRef] && [touch locationInView:self.view].y < [self pontoYInicial]) {
        
        NSLog(@"gesture moving, %f",_distancePoints);
        
    }
    
    else{
        NSLog(@"saiu da área");
    }
    
    [super touchesBegan:touches withEvent:event];

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    
    if ([touch locationInView:self.view].x > [self pontoXInicial] && [touch locationInView:self.view].x < [self pontoXRef] && [touch locationInView:self.view].y < [self pontoYInicial] && _distancePoints >= 170) {
        
        NSLog(@"gesture moving, %f",_distancePoints);
        self.state = UIGestureRecognizerStateRecognized;
    }

    else{
        NSLog(@"gesture falhou");
        self.state = UIGestureRecognizerStateFailed;
    }
    NSLog(@"gesture ended");
    
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.state = UIGestureRecognizerStateCancelled;
    [super touchesCancelled:touches withEvent:event];
}






@end
