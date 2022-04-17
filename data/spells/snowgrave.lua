local spell, super = Class(Spell, "snowgrave")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "SnowGrave"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Fatal"
    -- Menu description
    self.description = "Deals the fatal damage to\nall of the enemies."

    -- TP cost
    self.cost = 200

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"

    -- Tags that apply to this spell
    self.tags = {"ice", "fatal", "damage"}
end

function spell:onCast(user, target)
    local object = SnowGraveSpell(user)
    object.damage = math.ceil(((user.chara:getStat("magic") * 40) + 600))
    object.layer = BATTLE_LAYERS["above_ui"]
    Game.battle:addChild(object)

    return false
end

return spell