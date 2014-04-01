//
//  tryWalmart.m
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 28/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryWalmart.h"

@implementation tryWalmart

+(id)criarClasse{
    static tryWalmart *singleton = nil;
    if (!singleton) {
        singleton = [[super allocWithZone:nil] init];
    }
    
    return singleton;
    
}

+(id) allocWithZone:(struct _NSZone *)zone{
    return [self criarClasse];
}
- (id)init {
    self = [super init];
    
    if (!self.walmartURl) {
        self.walmartURl = [[NSMutableString alloc]init];
    }
    
    if (!self.jsonData){
        self.jsonData= [[NSMutableData alloc]init];
    }
    if(!self.jsonSerialized){
        self.jsonSerialized = [[NSMutableDictionary alloc]init];
    }
    if (!self.items){
        self.items = [[NSMutableArray alloc]init];
    }
    if (!self.itemGeral) {
        self.itemGeral = [[NSMutableArray alloc]init];
    }
    if(!self.itemSelected){
        self.itemSelected = [[NSMutableDictionary alloc]init];
    }
    if (!self.produtoNome) {
        self.produtoNome = [[NSMutableString alloc]init];
    }
    if (!self.price) {
        self.price = [[NSMutableString alloc]init];
    }
    if (!self.especificacaoTexto) {
        self.especificacaoTexto = [[NSMutableString alloc]init];
    }
    
    if (!self.descriptionDetail) {
        self.descriptionDetail = [[NSMutableArray alloc]init];
    }
    if(!self.description){
        self.description = [[NSMutableDictionary alloc]init];
    }
    
    
    
    
    return self;
}

-(NSData *)walmartJson:(NSString *)busca{
   
    self.walmartURl = [NSMutableString stringWithFormat:@"http://walmartlabs.api.mashery.com/v1/search?query=%@&format=json&apiKey=cnwrz6w9sqxgkjr7qsfk2vgv", busca];
    
    self.jsonData = [[self jsonData]initWithContentsOfURL:[NSURL URLWithString:self.walmartURl]];
    
    
    
    return [self jsonData];
    
}

-(NSString *) returnData: (NSString *)caracteristics{
    
    NSError *error;
    
    if (!self.jsonData) {
        return @"error";
    }
    
    
    self.jsonSerialized = [NSJSONSerialization JSONObjectWithData:self.jsonData options:NSJSONReadingMutableContainers error:&error];
    
    self.itemGeral = [self.jsonSerialized objectForKey:@"items"];
    
    NSLog(@"%@", self.itemGeral);
    
    for (id d in self.itemGeral) {
        
      //  self.itemSelected = [d objectForKey:@"items"];
        
        NSLog(@"%@", [d objectForKey:@"name"]);
        NSLog(@"%@", [d objectForKey:@"salePrice"]);
        
        /*
        if ([caracteristics isEqual:@"name"]) {
            self.produtoNome = [self.itemSelected objectForKey:@"name"];
            NSLog(@"%@", self.produtoNome);
            return self.produtoNome;
        }
        
        if ([caracteristics isEqual:@"price"]) {
            self.price = [self.itemSelected objectForKey:@"price"];
            NSLog(@"%@", self.price);
            return self.price;
        }
        
        if([caracteristics isEqual:@"Image"]){
            self.imagemMiniatura = [self.itemSelected objectForKey:@"thumbnailImage"];
            NSLog(@"%@", self.imagemMiniatura);
            return self.imagemMiniatura;
        }
        */
    }
    return @"nada";
    
}


@end
