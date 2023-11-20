
local mudBrickKilnSectionRemaps = {
	mudBrickDry_sand = "mudBrickKilnSection_sand",
	mudBrickDry_hay = "mudBrickKilnSection_hay",
	mudBrickDry_riverSand ="mudBrickKilnSection_riverSand",
	mudBrickDry_redSand = "mudBrickKilnSection_redSand",
}

return {
	description = {
		identifier = "well"
	},
	components = {
		hs_object = {
			model = "well"
		},
		hs_buildable = {
			skill = "mudBrickBuilding",
			build_sequence = "clearObjectsAndTerrainSequence",
			classification = "build",
			resources = {
				{
					resource = "branch",
					count = 4
				},
				{
					resource = "mudBrickDry",
					count = 4
				},
				{
					resource = "hay",
					count = 3
				}
			},
			model_placeholder = {
				{
					key = "mudBrickDry_1",
					default_model = "mudBrickKilnSection",
					resource = "mudBrickDry",
					remaps = mudBrickKilnSectionRemaps
				},
				{
					key = "mudBrickDry_2",
					default_model = "mudBrickKilnSection",
					resource = "mudBrickDry",
					remaps = mudBrickKilnSectionRemaps
				},
				{
					key = "mudBrickDry_3",
					default_model = "mudBrickKilnSection",
					resource = "mudBrickDry",
					remaps = mudBrickKilnSectionRemaps
				},
				{
					key = "mudBrickDry_4",
					default_model = "mudBrickKilnSectionWithOpening",
					resource = "mudBrickDry",
					remaps = mudBrickKilnSectionRemaps
				},


				{
					key = "branch_1",
					default_model = "birchBranch",
					resource = "branch"
				},
				{
					key = "branch_2",
					default_model = "birchBranch",
					resource = "branch"
				},
				{
					key = "branch_3",
					default_model = "birchBranchHalf",
					resource = "branch"
				},
				{
					key = "branch_4",
					default_model = "birchBranchHalf",
					resource = "branch"
				},


				{
					key = "hay_1",
					default_model = "thatchWideShort",
					resource = "hay"
				},
				{
					key = "hay_2",
					default_model = "thatchWideShort",
					resource = "hay"
				},
				{
					key = "hay_3",
					default_model = "thatchWideShort",
					resource = "hay"
				},


				{
					key = "mudBrickDry_store",
					is_store = true
				},
				{
					key = "branch_store",
					is_store = true
				},
				{
					key = "hay_store",
					is_store = true
				}
			}
		}
	}
}