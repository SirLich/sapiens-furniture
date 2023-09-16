local data = mjrequire "furniture/data"

local function generateOutputByObject()
	local out = {}

	for i, color in ipairs(data.colors) do
		out[color .. "_dye"] = {
			color .. "_cloth"
		}
	end

	return out
end

return {
	description = {
		identifier = "red_cloth",
		name = "Dyed Cloth",
		plural = "Dyed Cloth",
		summary = "Apply dye bowls to cloth, to create beautiful textiles."
	},
	components = {
		hs_craftable = {
			skill = "spinning",
			research = "potteryFiring",

			build_sequence = "researchBuildSequence",

			hs_output = {
				output_by_object = generateOutputByObject()
			},

			resources = {
				{
					resource = "dye",
					action = {
						action_type = "patDown",
						duration = 0.4,
						duration_without_skill = 15
					}
				},
				{
					resource = "cloth",
					action = {
						action_type = "patDown",
						duration = 0.4,
						duration_without_skill = 15
					}
				}
			}
		}
	}
}