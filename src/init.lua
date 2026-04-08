local VisualUI = {}
VisualUI.Core = require(script.Core.Window)
VisualUI.Utils = require(script.Utils.Tween)

function VisualUI:CreateWindow(config)
    return self.Core.new(config)
end

return VisualUI
