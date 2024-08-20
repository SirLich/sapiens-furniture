--- Furniture: data.lua
--- @author SirLich

local data = {
	dyeIngredients = {
		red_dye = {
			"poppyFlower",
			"beetroot",
			"raspberry"
		},
		orange_dye = {
			"pumpkin",
			"orange",
		},
		yellow_dye = {
			"marigoldFlower",
			"turmericRoot"
		},
		green_dye = {
			"aloeLeaf"
		},
		blue_dye ={
			"flax"
		},
		purple_dye ={
			"elderberry"
		},
		pink_dye ={
			"echinaceaFlower"
		},
	},

	colors = {
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"purple",
		"pink",
		"brown"
	},

	woodTypes = {
		"aspen",
		"birch",
	
		"bamboo",
		"coconut",
	
		"pine",
	
		"willow",
		"peach",
		"orange",
		"apple",
		"elderberry"
	}
}

function data:getRemaps(baseModel, underscore)
	local remapTable = {}
	for _, woodType in ipairs(data.woodTypes) do
		if underscore then
			remapTable[woodType .. "_woodStock"] = woodType .. "_" .. baseModel -- 'aspen_woodStock' = 'aspen_chairBack' etc.
		else
			remapTable[woodType .. "_woodStock"] = woodType .. baseModel -- 'aspen_woodStock' = 'aspenChairBack' etc.
		end
	end
	return remapTable
end

return data