-- Configurações
local NOME_DA_TOOL = "SpeedJumpBoost"
local VELOCIDADE_FIXA = 57
local PULO_FIXO = 87
local VELOCIDADE_PADRAO = 16
local PULO_PADRAO = 50

local Player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local minhaTool = nil

-- Função Segura para criar a Tool SEM HANDLE
local function criarTool()
    local sucesso = pcall(function()
        local tool = Instance.new("Tool")
        tool.Name = NOME_DA_TOOL
        tool.RequiresHandle = false -- AGORA NÃO PRECISA DE BLOCO/HANDLE
        tool.CanBeDropped = false

        tool.Parent = Player:WaitForChild("Backpack")
        minhaTool = tool
    end)
    return sucesso
end

-- Tenta criar a tool inicial
criarTool()

-- Loop de Alta Frequência (Heartbeat) com Proteção Total
RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = Player.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            
            -- Se a Tool sumiu, recria
            if not minhaTool or not minhaTool.Parent then
                criarTool()
            end

            if humanoid then
                humanoid.UseJumpPower = true

                if minhaTool.Parent == char then
                    -- EQUIPADO: Trava Velocidade e Pulo
                    if humanoid.WalkSpeed ~= VELOCIDADE_FIXA then
                        humanoid.WalkSpeed = VELOCIDADE_FIXA
                    end
                    if humanoid.JumpPower ~= PULO_FIXO then
                        humanoid.JumpPower = PULO_FIXO
                    end
                else
                    -- DESEQUIPADO: Volta ao Normal
                    if humanoid.WalkSpeed ~= VELOCIDADE_PADRAO then
                        humanoid.WalkSpeed = VELOCIDADE_PADRAO
                    end
                    if humanoid.JumpPower ~= PULO_PADRAO then
                        humanoid.JumpPower = PULO_PADRAO
                    end
                end
            end

            -- Garante que a Tool não suma do inventário
            if minhaTool.Parent ~= Player.Backpack and minhaTool.Parent ~= char then
                minhaTool.Parent = Player.Backpack
            end
        end
    end)
end)

-- Proteção extra contra deleção
pcall(function()
    minhaTool.AncestryChanged:Connect(function()
        pcall(function()
            if not minhaTool or minhaTool.Parent == nil then
                task.wait(0.1)
                criarTool()
            end
        end)
    end)
end)

print("Script Ultra-Leve Ativado: Sem Handle, Sem Lag!")
