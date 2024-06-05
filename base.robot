*** Settings ***

Library      AppiumLibrary
Library      DateTime

#Utils
Resource     android/utils/commons.robot
Resource     android/utils/config.robot

#Pages
Resource     android/page/GestaoDeProdutosPage.robot
Resource     android/page/BackupRestorePage.robot
Resource     android/page/ExportacaoDeDadosPage.robot
Resource     android/page/RelatoriosPage.robot
Resource     android/page/ImportacaodeDadosPage.robot