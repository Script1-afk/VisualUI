local UserInputService = game:GetService("UserInputService")
local Window = {}
Window.__index = Window

function Window.new(config)
    local self = setmetatable({}, Window)
    self.Title = config.Title or "VisualUI"
    self.IsMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    
    print("Fenêtre " .. self.Title .. " initialisée. Mode Mobile : " .. tostring(self.IsMobile))
    return self
end

return Window
