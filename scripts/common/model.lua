local shadow = mjrequire "hammerstone/utils/shadow"

local model = {
	loadOrder = 0 -- Run first
}

-- @shadow
function model:addModel(super, fileName, thirdArgument)
	if thirdArgument == nil then
		thirdArgument = "NIL"
	end

	mj:log("DEBUG PRINT: shadow:shadow variant of addModel called with: " .. thirdArgument)
	super(self, fileName, thirdArgument)
end

-- @shadow
function model:mjInit(super)
	super(self)

	-- Call 'addModel' to trigger a test case
	self:addModel('fake.fbx', "TEST")
end


return shadow:shadow(model)