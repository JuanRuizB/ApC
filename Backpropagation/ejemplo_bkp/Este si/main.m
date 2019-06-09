clear all, close all, clc;

[WX,yW_,BX,yB_] = preprocesado();

error_MinimoWINE = k_CV(WX,yW_,30);

error_MinimoBANK = k_CV(BX,yB_,30);