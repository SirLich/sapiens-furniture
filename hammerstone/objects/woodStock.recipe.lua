local branchTypes = {
	"aspen",
	"birch",
	"bamboo", -- Only branches
	"pine",
	"willow",
	"peach",
	"orange",
	"apple",
	"elderberry"
}

local bambooLog = {
	"aspen",
	"birch",
	"coconut", -- Only logs
	"pine",
	"willow",
	"peach",
	"orange",
	"apple",
	"elderberry"
}

local function getOutputByObject()
	local outTable = {}

	for _, branchType in ipairs(branchTypes) do
		outTable[branchType .. "Branch"] = {
			branchType .. "_woodStock"
		}
	end

	-- Drop x4 as many resources, for logs
	for _, logType in ipairs(bambooLog) do
		outTable[logType .. "Log"] = {
			logType .. "_woodStock",
			logType .. "_woodStock",
			logType .. "_woodStock",
			logType .. "_woodStock"
		}
	end

	return outTable
end


return {
	description = {
		identifier = "woodStock",
		summary = "woodStock_summary",
	},
	components = {
		hs_craftable = {
			skill = "woodWorking",
			tool = "carving",
			action_sequence = "scrapeWood",
			display_object = "birch_woodStock",
			hs_output = {
				output_by_object = getOutputByObject()
			},
			resources = {
				{
					resource_group = "woodStock_ingredients",
					count = 1,
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