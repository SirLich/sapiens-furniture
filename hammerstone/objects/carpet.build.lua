local data = mjrequire "furniture/data"

local function getRemaps()
	local remapTable = {}
	for _, color in ipairs(data.colors) do
		remapTable[color .. "_cloth"] = color .. "_" .. "carpetSection" -- 'red_cloth' = 'red_carpetSection' etc.
	end
	return remapTable
end

return {
	description = {
		identifier = "carpet"
	},
	components = {
		hs_object = {
			model = "carpet"
		},
		hs_buildable = {
			skill = "basicBuilding",
			build_sequence = "researchBuildSequence",
			classification = "build",
			seat_type = "carpet",
			resources = {
				{
					resource = "cloth",
					count = 4
				}
			},
			model_placeholder = {
				{
					key = "cloth_1",
					default_model = "carpetSection",
					resource = "cloth",
					remaps = getRemaps()
				},
				{
					key = "cloth_2",
					default_model = "carpetSection",
					resource = "cloth",
					remaps = getRemaps()
				},
				{
					key = "cloth_3",
					default_model = "carpetSection",
					resource = "cloth",
					remaps = getRemaps()
				},
				{
					key = "cloth_4",
					default_model = "carpetSection",
					resource = "cloth",
					remaps = getRemaps()
				},
				{
					key = "cloth_store",
					is_store = true
				}
			}
		}
	}
}