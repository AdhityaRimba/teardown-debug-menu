function init()
end

function tick()
end

function update()
end

function draw()
	DebugMenuUI()
end

function DebugMenuUI()


	-- position
	local pt = GetPlayerTransform()
	local ct = GetCameraTransform()

	local px = pt.pos[1]
	local py = pt.pos[2]
	local pz = pt.pos[3]

	-- lookAt
	local md = 500
	local f = TransformToParentPoint(ct, Vec(0, 0, md * - 1))
	local d = VecSub(f, ct.pos)
	d = VecNormalize(d)
	local hit, dist = QueryRaycast(ct.pos, d, md)
	local lookAt = Vec(0, 0, 0)
	if hit then
		lookAt = TransformToParentPoint(ct, Vec(0, 0, dist * - 1))
	end
	local lx = lookAt[1]
	local ly = lookAt[2]
	local lz = lookAt[3]

	-- rotation
	local rv = QuatToEulerAngles(ct.rot)
	local rx = rv[1]
	local ry = rv[2]
	local rz = rv[3]

	-- print clicked locations to console (disabled for normal use, enable if you have console)
	-- if InputPressed('lmb') then
	-- 	if lx == 0.0 and ly == 0.0 and lz == 0.0 then
	-- 		print('---')
	-- 	else
	-- 		print(string.format('<location pos="%.2f %.2f %.2f"/>', tostring(lx), tostring(ly), tostring(lz)))
	-- 	end
	-- end


	-- draw UI
	UiPush()
	UiTranslate(5, 5)
	UiColor(0, 0, 0, 0.7)
	UiImageBox("box-solid-10.png", 100, 102, 10, 10)


	--Player Pos
	UiTranslate(50, 22)
	UiColor(1, 1, 1, 0.5)
	UiFont("bold.ttf", 22)
	UiAlign("center")
	UiText("Position")
	UiTranslate(-43, 0)

	UiTranslate(7, 25)
	UiColor(1, 0.5, 0.5, 1)
	UiAlign("center")
	UiText("X")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", tostring(px)))

	UiTranslate(-80, 22)
	UiColor(0.5, 1.0, 0.5)
	UiAlign("center")
	UiText("Y")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", tostring(py)))

	UiTranslate(-80, 22)
	UiColor(0.5, 0.5, 1)
	UiAlign("center")
	UiText("Z")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", tostring(pz)))
	UiTranslate(-80, 0)
	UiAlign("left")

	--Player Rotation
	UiTranslate(90, - 91)
	UiColor(0, 0, 0, 0.7)
	UiImageBox("box-solid-10.png", 100, 102, 10, 10)

	UiTranslate(50, 22)
	UiColor(1, 1, 1, 0.5)
	UiFont("bold.ttf", 22)
	UiAlign("center")
	UiText("Rotation")
	UiTranslate(-43, 0)

	UiTranslate(7, 25)
	UiColor(1, 0.5, 0.5, 1)
	UiAlign("center")
	UiText("X")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", rx))

	UiTranslate(-80, 22)
	UiColor(0.5, 1.0, 0.5)
	UiAlign("center")
	UiText("Y")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", ry))

	UiTranslate(-80, 22)
	UiColor(0.5, 0.5, 1)
	UiAlign("center")
	UiText("Z")

	UiTranslate(80, 0)
	UiColor(1, 1, 1)
	UiAlign("right")
	UiText(string.format("%.2f", rz))
	UiTranslate(-185, 1)
	UiAlign("left")

	-- Player LookAt
	if hit then
		UiTranslate(-13, 15)
		UiColor(0, 0, 0, 0.7)
		UiImageBox("box-solid-10.png", 100, 102, 10, 10)

		UiTranslate(50, 22)
		UiColor(1, 1, 1, 0.5)
		UiFont("bold.ttf", 22)
		UiAlign("center")
		UiText("LookAt")
		UiTranslate(-46, 0)

		UiTranslate(10, 25)
		UiColor(1, 0.5, 0.5)
		UiAlign("center")
		UiText("X")

		UiTranslate(80, 0)
		UiColor(1, 1, 1)
		UiAlign("right")
		UiText(string.format("%.2f", tostring(lx)))

		UiTranslate(-80, 22)
		UiColor(0.5, 1.0, 0.5)
		UiAlign("center")
		UiText("Y")

		UiTranslate(80, 0)
		UiColor(1, 1, 1)
		UiAlign("right")
		UiText(string.format("%.2f", tostring(ly)))

		UiTranslate(-80, 22)
		UiColor(0.5, 0.5, 1)
		UiAlign("center")
		UiText("Z")

		UiTranslate(80, 0)
		UiColor(1, 1, 1)
		UiAlign("right")
		UiText(string.format("%.2f", tostring(lz)))
		UiTranslate(-80, 22)
	end

	UiPop()
end




local rad2Deg = 180 / math.pi
local half_pi = math.pi * 0.5
local two_pi = 2 * math.pi
local negativeFlip = -0.0001
local positiveFlip = two_pi - 0.0001


function SanitizeEuler(euler)
	if euler[1] < negativeFlip then
		euler[1] = euler[1] + two_pi
	elseif euler[1] > positiveFlip then
		euler[1] = euler[1] - two_pi
	end

	if euler[2] < negativeFlip then
		euler[2] = euler[2] + two_pi
	elseif euler[2] > positiveFlip then
		euler[2] = euler[2] - two_pi
	end

	if euler[3] < negativeFlip then
		euler[3] = euler[3] + two_pi
	elseif euler[3] > positiveFlip then
		euler[3] = euler[3] + two_pi
	end
end

function QuatToEulerAngles(quat)
	local x = quat[1]
	local y = quat[2]
	local z = quat[3]
	local w = quat[4]

	local check = 2 * (y * z - w * x)

	if check < 0.999 then
		if check > - 0.999 then
			local v = Vec( -math.asin(check),
				math.atan2(2 * (x * z + w * y), 1 - 2 * (x * x + y * y)),
			math.atan2(2 * (x * y + w * z), 1 - 2 * (x * x + z * z)))
			SanitizeEuler(v)
			v = VMul(v, rad2Deg)
			return v
		else
			local v = Vec(half_pi, math.atan2(2 * (x * y - w * z), 1 - 2 * (y * y + z * z)), 0)
			SanitizeEuler(v)
			v = VMul(v, rad2Deg)
			return v
		end
	else
		local v = Vec(-half_pi, math.atan2(-2 * (x * y - w * z), 1 - 2 * (y * y + z * z)), 0)
		SanitizeEuler(v)
		v = VMul(v, rad2Deg)
		return v
	end
end

function VMul(v, q)
	v[1] = v[1] * q
	v[2] = v[2] * q
	v[3] = v[3] * q

	return v
end