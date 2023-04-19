local gen = {}

local woodTypes = {
	"aspen",
	"birch",

	"bamboo",

	"pine",

	"willow",
	"peach",
	"orange",
	"elderberry"
}

local function genObjectConfig(woodType)
	local identifier = woodType .. "_woodStock"
	return {
		description = {
			identifier = identifier,
			name = identifier,
			plural = identifier,
			summary = "woodStock_summary"
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "woodStock" -- Link to woodstsock resource, defined in its own config
			}
		}
	}
end

function gen:getObjectConfigs()
	local configs = {}
	for i, woodType in ipairs(woodTypes) do
		table.insert(configs, i, genObjectConfig(woodType))
	end
	return configs
end


return gen