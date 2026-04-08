local TweenService = game:GetService("TweenService")
local TweenHelper = {}

function TweenHelper:Play(object, properties, duration)
    local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, info, properties)
    tween:Play()
    return tween
end

return TweenHelper
