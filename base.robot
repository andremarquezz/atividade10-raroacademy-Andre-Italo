*** Settings ***

Library      AppiumLibrary

#Utils
Resource     android/utils/commons.robot
Resource     android/utils/config.robot

#Pages
Resource     android/page/GestaoDeProdutosPage.robot
Resource     android/page/BackupRestorePage.robot
Resource     android/page/ExportacaoDeDadosPage.robot
Resource     android/page/RelatoriosPage.robot