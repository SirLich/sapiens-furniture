local data = mjrequire "furniture/data"

local function getRemaps(type)
	local remapTable = {}
	for _, color in ipairs(data.colors) do
		remapTable[color .. "_cloth"] = color .. "_" .. type
	end
	return remapTable
end

return {
	description = {
		identifier = "alpaca_tapestry",
		name = "Alpaca Tapestry",
		plural = "Alpaca Tapestry",
		summary = "A decorative wall hanging,"
	},
	components = {
		hs_object = {
			model = "alpaca_banner"
		},
		hs_buildable = {
			skill = "basicBuilding",
			build_sequence = "researchBuildSequence",
			classification = "build",
			resources = {
				{
					resource = "cloth",
					count = 2
				}
			},
			model_placeholder = {
				{
					key = "cloth_1",
					default_model = "tapestry",
					resource = "cloth",
					remaps = getRemaps("tapestry")
				},
				{
					key = "cloth_2",
					default_model = "tapestryHangings",
					resource = "cloth",
					remaps = getRemaps("tapestryHangings")
				},
				{
					key = "cloth_store",
					is_store = true
				}
			}
		}
	}
}