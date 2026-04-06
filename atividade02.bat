@echo off
color 0A


:inicio
cls
echo.
echo Carregando Jokenpo ...

set /p nome=Digite seu nome: 
set /a vitorias=0
set /a derrotas=0
set /a empates=0

:menu_principal
cls
set /a cpu_escolha=(%random% %%5) + 1
if %cpu_escolha%==1 set escolha_cpu=PEDRA
if %cpu_escolha%==2 set escolha_cpu=PAPEL
if %cpu_escolha%==3 set escolha_cpu=TESOURA
if %cpu_escolha%==4 set escolha_cpu=LAGARTO
if %cpu_escolha%==5 set escolha_cpu=SPOCK

echo.
echo 
echo     ESTATISTICAS: V:%vitorias% D:%derrotas% E:%empates%         
echo 
echo.
echo              
echo                JOKENPO  
echo                 %nome% vs CPU    
echo             
echo.
echo  [1] ✊ PEDRA     [2] ✋ PAPEL
echo  [3] ✂ TESOURA   [4] 🦎 LAGARTO  
echo  [5] 🖖 SPOCK
echo.
echo  [R] 📜 Regras    [S] 💾 Estatisticas    [X] ❌ Sair
echo.
echo ╔══════════════════════════════════════╗
set /p jogador=Sua jogada: 

if /i "%jogador%"=="R" goto regras
if /i "%jogador%"=="S" goto stats
if /i "%jogador%"=="X" exit
if "%jogador%"=="1" call :processa_jogada 1
if "%jogador%"=="2" call :processa_jogada 2
if "%jogador%"=="3" call :processa_jogada 3
if "%jogador%"=="4" call :processa_jogada 4
if "%jogador%"=="5" call :processa_jogada 5

echo.
echo  Jogada invalida! Tente novamente.
timeout /t 2 /nobreak >nul
goto menu_principal

:processa_jogada
set jogador_escolha=%1
call :define_nome_jogador %1
echo.
echo -----------------------------------------
echo    %nome%: %nome_jogador%              
echo    CPU: %escolha_cpu%                 
echo -----------------------------------------
call :verifica_vitoria %1 %cpu_escolha%
goto :eof

:define_nome_jogador
if %1==1 (set nome_jogador= PEDRA&goto:eof)
if %1==2 (set nome_jogador= PAPEL&goto:eof)
if %1==3 (set nome_jogador= TESOURA&goto:eof)
if %1==4 (set nome_jogador= LAGARTO&goto:eof)
if %1==5 (set nome_jogador= SPOCK&goto:eof)
goto:eof

:verifica_vitoria
set jog1=%1
set jog2=%2
if %jog1%==%jog2% (goto empate)
if %jog1%==1 if %jog2%==3 goto vitoria
if %jog1%==1 if %jog2%==4 goto vitoria
if %jog1%==1 if %jog2%==2 goto derrota
if %jog1%==1 if %jog2%==5 goto derrota

if %jog1%==2 if %jog2%==1 goto vitoria
if %jog1%==2 if %jog2%==5 goto vitoria
if %jog1%==2 if %jog2%==3 goto derrota
if %jog1%==2 if %jog2%==4 goto derrota

if %jog1%==3 if %jog2%==2 goto vitoria
if %jog1%==3 if %jog2%==4 goto vitoria
if %jog1%==3 if %jog2%==1 goto derrota
if %jog1%==3 if %jog2%==5 goto derrota

if %jog1%==4 if %jog2%==2 goto vitoria
if %jog1%==4 if %jog2%==5 goto vitoria
if %jog1%==4 if %jog2%==1 goto derrota
if %jog1%==4 if %jog2%==3 goto derrota

if %jog1%==5 if %jog2%==1 goto vitoria
if %jog1%==5 if %jog2%==3 goto vitoria
if %jog1%==5 if %jog2%==2 goto derrota
if %jog1%==5 if %jog2%==4 goto derrota
goto empate

:vitoria
set /a vitorias+=1
echo.
echo -----------------------------------------
echo ║          VOCE VENCEU!          ║
echo -----------------------------------------
goto proxima_rodada

:derrota
set /a derrotas+=1
echo.
echo -----------------------------------------
echo           VOCE PERDEU!            
echo -----------------------------------------
goto proxima_rodada

:empate
set /a empates+=1
echo.
echo ----------------------------------------
echo             EMPATE!              
echo ----------------------------------------
goto proxima_rodada

:proxima_rodada
set /p continuar=Jogar novamente? [S/N]: 
if /i "%continuar%"=="S" goto menu_principal
if /i "%continuar%"=="N" goto menu_principal
echo Opcao invalida!
goto proxima_rodada

:regras
cls
echo --------------------------------------------------------
echo |                     REGRAS                           |
echo ---------------------------------------------------------
echo.
echo PEDRA : Ganha de TESOURA  e LAGARTO 
echo PAPEL : Ganha de PEDRA  e SPOCK   
echo TESOURA : Ganha de PAPEL  e LAGARTO 
echo LAGARTO : Ganha de PAPEL  e SPOCK 
echo SPOCK : Ganha de PEDRA  e TESOURA 
echo.
pause
goto menu_principal

:stats
cls
set /a total= %vitorias% + %derrotas% + %empates%
set /a porcentagem=(%vitorias%*100)/%total%
echo ----------------------------------------
echo           ESTATISTICAS               
echo -----------------------------------------
echo.
echo Vitorias: %vitorias%  (%%porcentagem%%%)
echo Derrotas: %derrotas%
echo Empates:  %empates%
echo Total:    %total%
echo.
pause
goto menu_principal