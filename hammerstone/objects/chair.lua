local woodTypes = {
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

local function getRemaps(baseModel)
	local remapTable = {}
	for _, woodType in ipairs(woodTypes) do
		remapTable[woodType .. "_woodStock"] = woodType .. "_" .. baseModel -- 'aspen_woodStock' = 'aspen_chairBack' etc.
	end
	return remapTable
end

return {
	description = {
		identifier = "chair"
	},
	components = {
		hs_object = {
			model = "chair"
		},
		hs_buildable = {
			skill = "basicBuilding",
			build_sequence = "clearObjectsAndTerrainSequence",
			classification = "build",
			seat_type = "chair",
			resources = {
				{
					resource = "woodStock",
					count = 6
				}
			},
			model_placeholder = {
				{
					key = "woodStock_1",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = getRemaps("chairLeg")
				},
				{
					key = "woodStock_2",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = getRemaps("chairLeg")
				},
				{
					key = "woodStock_3",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = getRemaps("chairLeg")
				},
				{
					key = "woodStock_4",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = getRemaps("chairLeg")
				},
				{
					key = "woodStock_5",
					default_model = "chairSeat",
					resource = "woodStock",
					remaps = getRemaps("chairSeat")
				},
				{
					key = "woodStock_6",
					default_model = "chairBack",
					resource = "woodStock",
					remaps = getRemaps("chairBack")
				},
				{
					key = "woodStock_store",
					is_store = true
				}
			}
		}
	}
}
