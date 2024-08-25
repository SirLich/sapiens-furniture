local data = mjrequire "furniture/data"

local function getOutputByObject()
	local outTable = {}

	for _, stoneType in ipairs(data.stoneTypes) do
		outTable[stoneType] = {
			stoneType .. "_stoneStock"
		}
	end

	return outTable
end


return {
	description = {
		identifier = "stoneStock",
		summary = "stoneStock_summary",
	},
	components = {
		hs_craftable = {
			skill = "chiselStone",
			tool = "softChiselling",
			action_sequence = "scrapeWood",
			display_object = "rock_stoneStock",
			hs_output = {
				output_by_object = getOutputByObject()
			},
			resources = {
				{
					resource_group = "rockAny",
					count = 2,
					action = {
						action_type = "knap",
						duration = 0.5,
						duration_without_skill = 15
					}
				}
			}
		}
	}
}