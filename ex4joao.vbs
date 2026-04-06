' Programa de Cálculo de Folha de Pagamento
' Referência Salário Mínimo: R$ 1.621,00

Dim salarioBruto, inss, salarioLiquido, salarioMinimo
salarioMinimo = 1621.00

' Entrada de dados
salarioBruto = InputBox("Digite a quantidade de salários do funcionário (base: R$ " & salarioMinimo & "):", "Cálculo de Folha de Pagamento")
salarioBruto = CDbl(salarioBruto) * salarioMinimo

' Cálculo do INSS baseado na tabela
If salarioBruto <= 1502.84 Then
    inss = salarioBruto * 0.09
ElseIf salarioBruto <= 2907.65 Then
    inss = salarioBruto * 0.09
ElseIf salarioBruto <= 4354.27 Then
    inss = salarioBruto * 0.12
Else
    inss = salarioBruto * 0.14
End If

' Cálculo do salário líquido
salarioLiquido = salarioBruto - inss

' Saída de dados formatada
MsgBox "=== FOLHA DE PAGAMENTO ===" & vbCrLf & _
       "Salário Bruto: R$ " & FormatNumber(salarioBruto, 2) & vbCrLf & _
       "INSS (" & (inss/salarioBruto)*100 & "%): R$ " & FormatNumber(inss, 2) & vbCrLf & _
       "Salário Líquido: R$ " & FormatNumber(salarioLiquido, 2) & vbCrLf & _
       "========================", _
       vbInformation, "Resultado do Cálculo"