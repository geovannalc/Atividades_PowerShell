$escolha = 0
while ($escolha -ne 11) {
    Clear-Host
    Write-Host "======= Gerenciamento de Processos ========="
    Write-Host "1 - Abrir Programa Números Antecessor e Sucessor"
    Write-Host "2 - Abrir Programa Rendimento do Aluno"
    Write-Host "3 - Abrir Processos Customizados"
    Write-Host "4 - Listar Processos Customizados"
    Write-Host "5 - Iniciar o Navegador Edge"
    Write-Host "6 - Finalizar Processos por ID"
    Write-Host "7 - Finalizar Processor por Nome"
    Write-Host "8 - Verificar se um processo está rodando"
    Write-Host "9 - Listar Serviços do Sistema Operacional Parados"
    Write-Host "10 - Listar os 20 processos que ocupam mais RAM"
    Write-Host "11 - Sair do Script"
    Write-Host "============================================="

    $escolha = Read-Host "Selecione uma opção (1-11)"
     switch ($escolha) {
        1{
            $programa = "C:\Fatec\2°Semestre\Programa_ant_suc.ps1"
            try {
                Start-Process $programa -ErrorAction Stop
                Write-Host "'$programa iniciado!" -ForegroundColor Green
            } catch {
                Write-Host "Erro ao abrir o processo '$programa" -ForegroundColor Red
            }
            Star-Sleep -Second 3
        }
        2{
            $programa2 = "C:\Fatec\2°Semestre\programa_rendimento.ps1"
            try {
                Start-Process $programa2 -ErrorAction Stop
                Write-Host "'$programa2 iniciado!" -ForegroundColor Green
            } catch {
                Write-Host "Erro ao abrir o processo '$programa2" -ForegroundColor Red
            }
            Star-Sleep -Second 3

        }
        3{
            $novoproc = Read-Host "Digite o nome do processo"
            try {
                Start-Process $novoproc -ErrorAction Stop
                Write-Host "'$novoproc iniciado!" -ForegroundColor Green
            } catch {
                Write-Host "Erro ao abrir o processo '$novoproc" -ForegroundColor Red
            }
            Star-Sleep -Second 3
        }
        4{
            $filtro = Read-Host "Digite o nome do processo"
            Write-Host "Listando Processos..." -ForegroundColor Cyan
            Get-Process "$filtro*" | Select-Object Name, ID, CPU -First 10 | Format-Table -AutoSize
            Read-Host "Pressione Enter para retornar ao menu"
        }
        5{
            $edge = "msedge.exe"
            try {
                Start-Process $edge -ErrorAction Stop
                Write-Host "'$edge iniciado!" -ForegroundColor Green
            } catch {
                Write-Host "Erro ao abrir o processo '$edge" -ForegroundColor Red
            }
            Star-Sleep -Second 3
            
        }
        6{
            $ID = Read-Host "Digite o ID do Processo para Encerrar"
            if (Get-Process -Id $ID -ErrorAction Stop) {
                Stop-Process -Id $ID -Force
                Write-Host "'$ID' encerrado com sucesso!" -ForegroundColor Cyan
            } else {
                Write-Host "Processo não encontrado!" -ForegroundColor Red
            }
            Start-Sleep -Seconds 3
        }
        7{
            $nome = Read-Host "Digite o nome do Processo para Encerrar"
            if (Get-Process -Name $nome -ErrorAction Stop) {
            Stop-Process -Name $nome -Force
            Write-Host "'$nome encerrado com sucesso!" -ForegroundColor Cyan
            } else {
                Write-Host "'$nome do processo não encontrado!" -ForegroundColor Red
            }

            Start-Sleep -Seconds 3
        }
        8{
            $nome = Read-Host "Digite o nome do processo para verificar"

            $processo = Get-Process -Name $nome -ErrorAction Stop

            if ($processo) {
                Write-Host "O processo '$nome' está EM EXECUÇÃO" -ForegroundColor Green
            } else {
                Write-Host "O processo '$nome' NÃO está rodando" -ForegroundColor Red
            }

            Read-Host "Pressione Enter para voltar ao menu"
        }
        9{
            Write-Host "Serviços PARADOS:" -ForegroundColor Yellow

            Get-Service | Where-Object {$_.Status -eq "Stopped"} |
            Select-Object Name, ID, Status |
            Format-Table -AutoSize

            Read-Host "Pressione Enter para voltar ao menu"
        }
        10{
            Write-Host "Listando Processos..." -ForegroundColor Cyan
            Get-Process "$filtro*" | Select-Object Name, ID, CPU -First 20 | Format-Table -AutoSize
            Read-Host "Pressione Enter para retornar ao menu"
        }
        11{
             Write-Host "Encerrando o Script..." -ForegroundColor Magenta
             }
             Default{
                Write-Host "Opção invalida!!!" -ForegroundColor Red 
                Star-Sleep -Second 3
        }
    }
}