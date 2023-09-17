local data = mjrequire "furniture/data"

local function getRemaps(direction)
	local remapTable = {}
	for _, color in ipairs(data.colors) do
		remapTable[color .. "_cloth"] = color .. "_" .. "_clothDoorSection_" .. direction
	end
	return remapTable
end

return {
	description = {
		identifier = "cloth_door",
		name = "Cloth Door",
		plural = "Cloth Door",
		summary = "A hanging cloth doorway, which will allow sapiens to pass through."
	},
	components = {
		hs_object = {
			model = "clothDoor"
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
					default_model = "clothDoorSection_left",
					resource = "cloth",
					remaps = getRemaps("left")
				},
				{
					key = "cloth_2",
					default_model = "clothDoorSection_right",
					resource = "cloth",
					remaps = getRemaps("right")
				},
				{
					key = "cloth_store",
					is_store = true
				}
			}
		}
	}
}