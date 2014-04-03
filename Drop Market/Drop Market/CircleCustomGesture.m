//
//  CircleCustomGesture.m
//  teste
//
//  Created by VICTOR MUNHOZ THEODORO on 10/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "CircleCustomGesture.h"

@implementation CircleCustomGesture

-(id)initWithTarget:(id)target action:(SEL)action{
    
    if (self = [super initWithTarget:target action:action]) {
        
        if (self) {
            self.largec = [[UIView alloc]init];
            self.smallc = [[UIView alloc]init];
        }
        
    }
    return self;
}

-(void)reset{
    
    [super reset];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    [self setXInicial: [touch locationInView:self.view].x];
    [self setYInicial: [touch locationInView:self.view].y];
    
    [self setXFinal: [touch locationInView:self.view].x];
    [self setYFinal: [touch locationInView:self.view].y];
    
    [self setCentroX:[touch locationInView:self.view].x + 100];
    [self setCentroY:[touch locationInView:self.view].y];
    
   
    [self setRaioMenor: 30];
    [self setRaioMaior: 100];
    
    [[self largec]setFrame:CGRectMake([self centroX] - [self raioMaior], [self centroY] - [self raioMaior], [self raioMaior]*2, [self raioMaior]*2)];
    [self.largec setBackgroundColor: [UIColor grayColor]];
    [self.view addSubview: self.largec];
    self.largec.layer.cornerRadius = [self raioMaior];
    self.largec.alpha = 0.1;
    
    
    [[self smallc]setFrame:CGRectMake([self centroX] - [self raioMenor], [self centroY] -[self raioMenor], [self raioMenor]* 2, [self raioMenor]*2)];
    [self.view addSubview: self.smallc];
       [self.smallc setBackgroundColor: [UIColor orangeColor]];
    self.smallc.alpha = 0.1;
    self.smallc.layer.cornerRadius = [self raioMenor];
   
    
    NSLog(@"circle - gesture begins");
    
    [[self smallc]setHidden:NO];
    [[self largec]setHidden:NO];
    
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if ( pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) < pow([self raioMaior], 2)  &&
        // (x - xo)^2 + (y - yo)^2 < r2
        
        pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) > pow([self raioMenor], 2) ) {
        
        
    }
    
    else{
        NSLog(@"circle - saiu da area de tolerancia");
        self.state = UIGestureRecognizerStateFailed;
    }
    
    NSLog(@"circle - gesture moved");
    
    
    [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (pow( ([touch locationInView:self.view].x - [self xFinal]), 2) +
        pow( ([touch locationInView:self.view].y - [self yFinal]), 2) > pow([self raioMenor], 2) ){
        
        
        self.state = UIGestureRecognizerStateRecognized;
        
        [[self largec]setHidden:YES];
        [[self smallc]setHidden:YES];
    }
    
    else{
        NSLog(@"circle - gesture falhou");
        self.state = UIGestureRecognizerStateFailed;
    }
    NSLog(@"circle - gesture ended");
    
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.state = UIGestureRecognizerStateCancelled;
    [super touchesCancelled:touches withEvent:event];
    
}

@end
