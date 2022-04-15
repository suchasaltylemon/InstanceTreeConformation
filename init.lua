local InstanceHasShape = function(instance, shape)
	local success = true
	
	-- Verify instance has children
	for name in pairs(shape) do
		if (type(name) ~= "string") then
			return false
		end
		if instance:FindFirstChild(name) == nil then
			return false
		end
	end
	
	local children = instance:GetChildren()

	local EnsureChildrenFollowShape = function(child)
		local instanceName = child.Name
		local targetShape = shape[instanceName]

		if targetShape ~= nil then
			-- Check if shape has descendants
			if type(targetShape) == "table" then
				local _binding = targetShape

				local correctParentType = _binding[1]
				local shapeOfChildren = _binding[2]

				if not child:IsA(correctParentType) then
					success = false
				else
					success = InstanceHasShape(child, shapeOfChildren)
				end

			else
				if not child:IsA(targetShape) then
					success = false
				end
			end
		end
	end
	
	for _, child in ipairs(children) do
		EnsureChildrenFollowShape(child)
	end
	
	return success
end

return InstanceHasShape
