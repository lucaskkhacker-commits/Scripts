-- CONFIGURAÇÕES
local VELO = 65
local PULO = 93
local NOME_DA_TOOL = "GhostTest"

local Player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local minhaTool = nil

-- Função para criar a Tool
local function criarTool()
    pcall(function()
        local tool = Instance.new("Tool")
        tool.Name = NOME_DA_TOOL
        tool.RequiresHandle = false
        tool.Parent = Player:WaitForChild("Backpack")
        minhaTool = tool
    end)
end

criarTool()

-- LOOP DE FUNCIONAMENTO (O que deu certo!)
RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = Player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            
            -- Recria se sumir
            if not minhaTool or not minhaTool.Parent then criarTool() end

            if minhaTool.Parent == char then
                -- APLICA VELO E PULO
                if hum then
                    hum.WalkSpeed = VELO
                    hum.JumpPower = PULO
                    hum.UseJumpPower = true
                end

                -- NOCLIP QUE FUNCIONOU
                for _, parte in pairs(char:GetChildren()) do
                    if parte:IsA("BasePart") then
                        parte.CanCollide = false
                    end
                end
            else
                -- RESET AO DESEQUIPAR
                if hum and hum.WalkSpeed == VELO then
                    hum.WalkSpeed = 16
                    hum.JumpPower = 50
                    for _, parte in pairs(char:GetChildren()) do
                        if parte:IsA("BasePart") then
                            parte.CanCollide = true
                        end
                    end
                end
            end

            -- Mantém a tool sempre com você
            if minhaTool.Parent ~= Player.Backpack and minhaTool.Parent ~= char then
                minhaTool.Parent = Player.Backpack
            end
        end
    end)
end)

print("GhostTool Finalizada: 100% Funcional e Estável!")
