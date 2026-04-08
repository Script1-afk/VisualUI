local VisualUI = {}
VisualUI.Core = require(script.Core.Window)
VisualUI.Theme = require(script.Core.Theme)
VisualUI.Utils = require(script.Utils.Tween)

function VisualUI:CreateWindow(config)
    return self.Core.new(config)
end

return VisualUI
