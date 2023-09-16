return {
	description = {
		identifier = "brown_cloth", -- Sort of a bug work-around. We need a valid game-object identifier to harness the recipe to.
		name = "Cloth",
		plural = "Cloth",
		summary = "A refined textile, which can be used for further crafting."
	},
	components = {
		hs_craftable = {
			skill = "butchery",
			research = "butchery",
			tool = "butcher",

			action_sequence = "butcher",

			hs_output = {
				simple_output = {
					"brown_cloth",
					"brown_cloth"
				}
			},

			resources = {
				{
					resource = "woolskin",
					action = {
						action_type = "inspect",
						duration = 0.4,
						duration_without_skill = 15
					}
				}
			}
		}
	}
}