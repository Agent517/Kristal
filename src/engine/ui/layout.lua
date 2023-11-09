---@class Layout : Class
---
---@field parent Component|nil
local Layout = Class()

function Layout:init(options)
    options = options or {}
    self.gap = options.gap or 0
    self.align = options.align or "start"
end

function Layout:refresh()
    -- offset the children by the parent's padding and the child's margins
    for i, child in ipairs(self:getComponents()) do
        child.x = ({self.parent:getScaledPadding()})[1] + (child.margins and ({child:getScaledMargins()})[1] or 0)
        child.y = ({self.parent:getScaledPadding()})[2] + (child.margins and ({child:getScaledMargins()})[2] or 0)
    end
end

function Layout:getInnerArea()
    local width, height = self.parent:getSize()
    width = width - ({self.parent:getScaledPadding()})[1] - ({self.parent:getScaledPadding()})[3]
    height = height - ({self.parent:getScaledPadding()})[2] - ({self.parent:getScaledPadding()})[4]
    return width, height
end

function Layout:draw()

end

function Layout:getComponents()
    return self.parent:getComponents()
end


return Layout