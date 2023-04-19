local woodStockGen = {}

local woodTypes = {
	"aspen",
	"birch",
	"bamboo",
	-- "pine",
	"willow",
	"peach",
	-- "orange",
	"elderberry"
}

local function generateConfig(woodType)
	local identifier = woodType .. "_woodStock"
	return {
		description = {
			identifier = identifier
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "woodCraftingSupplies"
			}
		}
	}
end

function woodStockGen:getConfigs()
	local configs = {}
	for i, woodType in ipairs(woodTypes) do
		table.insert(configs, i, generateConfig(woodType))
	end
	return configs
end


return woodStockGen