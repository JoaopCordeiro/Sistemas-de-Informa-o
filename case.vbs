Dim cor, cores, resp
call chamar_entrada
function chamar_entrada()
    cores = cint(inputbox("Cores do Semaforo" + vbnewline &_
                            "[1] Verde" + vbnewline &_
                            "[2] Amarelo" + vbnewline &_
                            "[3] vermelho" + vbnewline &_ 
                            "[0 ou 10] Encerrar Programa"))
    Select case cores
        case 1:
            frase = "Verde - Siga em Frente"
        
        case 2:
            frase = "Amarelo - Atenção"
        
        case 3:
            frase =  "Vermelho - Pare"
        
        case 0,10:
           resp = msgbox("Deseaja sair?", vbquestion + vbyesno, "AVISO")
           if resp = vbyes then
                wscript.quit
           else
                call chamar_entrada
           end if

        case else:
            msgbox("Opção invalida!"), vbexclamation + vbokonly, "ATENÇÃO"
            call chamar_entrada
    end Select
    msgbox ("" & frase & ""), vbinformation + vbokonly, "CORES DO SEMAFORO"
    call chamar_entrada
end function

