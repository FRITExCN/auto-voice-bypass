local CoreGui = game:GetService("CoreGui")
local VoiceChatService = game:GetService("VoiceChatService")
local StarterGui = game:GetService("StarterGui")

local lastState = nil

while true do
    local toggleMicMuteFound = false

    local success, toggleMicMute = pcall(function()
        return CoreGui:FindFirstChild("toggle_mic_mute", true)
    end)

    if success and toggleMicMute and toggleMicMute:IsA("GuiObject") then
        toggleMicMuteFound = true
    end

    if toggleMicMuteFound then
        if lastState ~= "voice_on" then
            StarterGui:SetCore("SendNotification", {
                Title = "FRITE HUB",
                Text = "Voice On 🎤",
                Duration = 7
            })
            lastState = "voice_on"
        end
    else
        if lastState ~= "voice_banned" then
            StarterGui:SetCore("SendNotification", {
                Title = "FRITE HUB",
                Text = "Voice Banned 🚫",
                Duration = 7
            })

            pcall(function()
                VoiceChatService:joinVoice()
            end)

            StarterGui:SetCore("SendNotification", {
                Title = "FRITE HUB",
                Text = "VC Bypass ON ✅",
                Duration = 7
            })

            lastState = "voice_banned"
        end
    end

    task.wait(0.5)
end
