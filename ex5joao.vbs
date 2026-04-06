' JOGO DE ADIVINHAÇÃO DE PALAVRAS - VERSÃO CORRIGIDA
Dim palavras(19), ordemPalavras(19), indice, acertos, erros, pulou, jogando
Dim opcao, chute, resposta

' Lista fixa de 20 palavras únicas
palavras(0)="casa":palavras(1)="carro":palavras(2)="livro":palavras(3)="mesa"
palavras(4)="cadeira":palavras(5)="janela":palavras(6)="porta":palavras(7)="cachorro"
palavras(8)="gato":palavras(9)="flor":palavras(10)="arvore":palavras(11)="rio"
palavras(12)="montanha":palavras(13)="sol":palavras(14)="lua":palavras(15)="estrela"
palavras(16)="nuvem":palavras(17)="chuva":palavras(18)="computador":palavras(19)="telefone"

Sub Embaralhar()
    Dim i,j,temp,k
    Randomize Timer
    For i=0 To 19
        ordemPalavras(i)=i
    Next
    For i=0 To 19
        j=Int(Rnd*20)
        temp=ordemPalavras(i)
        ordemPalavras(i)=ordemPalavras(j)
        ordemPalavras(j)=temp
    Next
End Sub

Sub MostrarPalavra()
    MsgBox " PALAVRA ATUAL: " & UCase(palavras(ordemPalavras(indice))),64,"OUÇA!"
End Sub

Sub JogoPrincipal()
    Do While jogando
        Do
            opcao=InputBox("=== JOGO DE PALAVRAS ===" & vbCrLf & vbCrLf & _
                          "Palavra #" & (indice+1) & "/20" & vbCrLf & vbCrLf & _
                          "[1] Ouvir novamente" & vbCrLf & _
                          "[2] Pular palavra (1x)" & vbCrLf & _
                          "[3] Chutar palavra" & vbCrLf & vbCrLf & _
                          "Digite: 1, 2 ou 3","MENU", "3")
        Loop While opcao="" Or (opcao<>"1" And opcao<>"2" And opcao<>"3")
        
        Select Case opcao
            Case "1"
                MostrarPalavra
                
            Case "2"
                If pulou Then
                    MsgBox " Já pulou 1 vez!",48,"ERRO"
                Else
                    pulou=True
                    indice=indice+1
                    If indice>=20 Then Call FimJogo: Exit Sub
                    MsgBox "⏭ PULOU! Palavra #" & (indice+1),64,"OK"
                    MostrarPalavra
                End If
                
            Case "3"
                chute=UCase(Trim(InputBox(" Digite a palavra:","CHUTE","")))
                If chute= UCase(palavras(ordemPalavras(indice))) Then
                    acertos=acertos+1
                    MsgBox " ACERTOU! ",64,"CORRETO!"
                    indice=indice+1
                    If indice>=20 Then Call FimJogo: Exit Sub
                Else
                    erros=erros+1
                    MsgBox " ERROU!" & vbCrLf & vbCrLf & _
                          "Era: " & UCase(palavras(ordemPalavras(indice))) & vbCrLf & _
                          "Você: " & chute,16,"GAME OVER"
                    Call FimJogo
                    Exit Sub
                End If
        End Select
    Loop
End Sub

Sub FimJogo()
    jogando=False
    If acertos=20 Then
        MsgBox " VITÓRIA PERFEITA! " & vbCrLf & _
               "20/20 acertos!",64," PARABÉNS!"
    Else
        MsgBox "=== RESULTADO ===" & vbCrLf & _
               "Acertos: " & acertos & "/20" & vbCrLf & _
               "Erros: " & erros & vbCrLf & _
               "Pulou: " & IIf(pulou,"Sim","Não"),64,"FIM"
    End If
    
    resposta=MsgBox(" Jogar novamente?","Sim","Não",4+32)
    If resposta=6 Then 'vbYes
        IniciarJogo
    End If
End Sub

Sub IniciarJogo()
    indice=0: acertos=0: erros=0: pulou=False: jogando=True
    Embaralhar
    MsgBox " NOVO JOGO!" & vbCrLf & vbCrLf & _
           "• 20 palavras únicas" & vbCrLf & _
           "• 1 pulo por jogo" & vbCrLf & _
           "• Acertar TODAS para vencer!" & vbCrLf & vbCrLf & _
           "Palavra #1:",64,"INSTRUÇÕES"
    MostrarPalavra
    JogoPrincipal
End Sub

' === INÍCIO DO PROGRAMA ===
Call IniciarJogo