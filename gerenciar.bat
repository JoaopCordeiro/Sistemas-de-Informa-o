::linha para ocultar para o usuario
::tirar o echo off, mostra o que não se deve para o usuário
@echo off
rem coentario
::titulo no front
title Aula01 - Sistemas de informacao
::cor do front
color 08
:inicio
cls
::pular linhas
echo. 
echo            ( *    * )
echo  ______________________________
echo     Gerenciamento de Arquivos
echo  ______________________________
echo [G] Gerar arquivos
echo [O] Organizar arquivos
echo [R] Retornar ao menu
echo  ______________________________
:: criar uma variavel (entrada de dados pelo teclado), op é a variável
set /p op=Digite a opcao desejada : 
::condicionais
if /i %op% equ g (goto:gerar)
if /i %op% equ o (goto:organizar)
if /i %op% equ r (call aula01.bat) else (
    echo. 
    echo ______________________________
    echo       Opcao Invalida!!!
    echo ______________________________
    echo. 
    pause
    goto:inicio
)
:gerar
echo.
set /p nome=Digite o nome do arquivo : 
set /p qtde=Digite a quantidade de arquivos a serem gerados : 
set /p tipo=Digite o tipo do arquivo a ser gerado : 
:: estrutura de repetição
for /L %%n in (1,1,%qtde%) do (echo Fatec SCS > %nome%%%n.%tipo%)
echo.
echo ______________________________
echo Arquivos criados com suscesso
echo ______________________________
echo.
pause
goto:inicio

:organizar
echo.
set /p pasta=Digite o nome da pasta a ser criada : 
set /p tipo=Digite o tipo de arquivo a ser gerado : 
md %pasta%
move *.%tipo% C:\Users\aluno\Desktop\%pasta%\
echo.
echo ______________________________
echo arquivos organizados com suscesso
echo ______________________________
echo.
pause
goto:inicio
