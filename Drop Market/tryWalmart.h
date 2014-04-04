//
//  tryWalmart.h
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 28/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface tryWalmart : NSObject

@property NSMutableArray *items;
@property NSMutableData *jsonData;
@property NSMutableDictionary *jsonSerialized;
@property NSMutableString *walmartURl;
@property NSMutableArray *itemGeral;
@property NSMutableDictionary *itemSelected;
@property NSMutableDictionary *description;
@property NSMutableArray *descriptionDetail;


@property    NSMutableString *produtoNome;
@property    NSMutableString *price;
@property    NSMutableString *imagemMiniatura;
@property    NSMutableString *especificacaoTexto;


@property double valorAPAGAR;

-(NSString *) returnData: (NSString *)caracteristics;
-(NSData *)walmartJson:(NSString *)busca;

+(id)criarClasse;
@end
