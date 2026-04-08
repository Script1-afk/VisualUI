local UserInputService = game:GetService("UserInputService")
local Window = {}
Window.__index = Window

function Window.new(config)
    local self = setmetatable({}, Window)
    self.Title = config.Title or "VisualUI"
    self.IsMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    
    -- Logique de création de la ScreenGui ici...
    print("Fenêtre " .. self.Title .. " créée ! Mode Mobile : " .. tostring(self.IsMobile))
    
    return self
end

return Window
