local builder = {}

local data = mjrequire "furniture/data"

local mainTapestry = "alpaca"
local tapestryVariations = {
	"sapiens"
}

local function getVariations(isMain)
	if isMain then
		local results = {}
		for _, variation in ipairs(tapestryVariations) do
			table.insert(results, variation .. "_tapestry")
			return results
		end
	end

	return nil
end


local function getRemaps(type)
	local remapTable = {}
	for _, color in ipairs(data.colors) do
		remapTable[color .. "_cloth"] = color .. "_" .. type
	end
	return remapTable
end

local function generateObject(type, isMain)
	local identifier = type .. "_tapestry"
	local baseModelName = "tapestryBase_" .. type
	local hangingModelName = "tapestryHangings"

	local result = {
		description = {
			identifier = identifier,
			name = identifier .. "_name",
			plural = "Tapestries",
			summary = "Decorative wall hanging."
		},
		components = {
			hs_object = {
				model = identifier
			},
			hs_buildable = {
				skill = "basicBuilding",
				build_sequence = "researchBuildSequence",
				classification = "build",

				variation_name = "Tapestries",
				variations = getVariations(),
				hidden = not isMain,

				resources = {
					{
						resource = "cloth",
						count = 2
					}
				},
				model_placeholder = {
					{
						key = "cloth_1",
						default_model = baseModelName,
						resource = "cloth",
						remaps = getRemaps(baseModelName)
					},
					{
						key = "cloth_2",
						default_model = hangingModelName,
						resource = "cloth",
						remaps = getRemaps(hangingModelName)
					},
					{
						key = "cloth_store",
						is_store = true
					}
				}
			}
		}
	}

	return result
end

function builder:getObjectConfigs()
	local configs = {}
	for _, statueType in ipairs(tapestryVariations) do
		table.insert(configs, generateObject(statueType, false))
	end
	table.insert(configs, generateObject(mainTapestry, true))

	return configs
end

return builder
