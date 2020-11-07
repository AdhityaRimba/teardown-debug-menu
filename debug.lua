#include "game.lua"
#include "options.lua"
#include "score.lua"
#include "map.lua"
#include "about.lua"

function DebugMenuUI()
	local val = GetInt("options.gfx.debug")
	if val == 1 then
		UiPush()
    UiTranslate(5, 5)
		UiColor(0, 0, 0, 0.7)
		UiRect(100, 102)


		--Player Pos
		UiTranslate(8, 22)
    UiColor(1, 1, 1, 0.5)
    UiFont("font/bold.ttf", 22)
		UiText("Pos")

		UiTranslate(7, 25)
    UiColor(1, 0.5, 0.5, 1)
    UiAlign("center")
		UiText("X")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", tostring(GetPlayerPos()[1])))

		UiTranslate(-80, 22)
    UiColor(0.5, 1.0, 0.5)
    UiAlign("center")
		UiText("Y")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", tostring(GetPlayerPos()[2])))

		UiTranslate(-80, 22)
    UiColor(0.5, 0.5, 1)
    UiAlign("center")
    UiText("Z")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", tostring(GetPlayerPos()[3])))
    UiTranslate(-80, 0)
    UiAlign("left")



		--Look At (thanks to Rubikow)
		local maxDist = 500
		local plyTransform = GetPlayerTransform()
		local fwdPos = TransformToParentPoint(plyTransform, Vec(0, 0, maxDist * - 1))
		local direction = VecSub(fwdPos, plyTransform.pos)
		direction = VecNormalize(direction)



    --Player Rotation
    UiTranslate(90, -92)
		UiColor(0, 0, 0, 0.7)
		UiRect(100, 102)

		UiTranslate(8, 22)
    UiColor(1, 1, 1, 0.5)
    UiFont("font/bold.ttf", 22)
		UiText("Rotation")

		UiTranslate(7, 25)
    UiColor(1, 0.5, 0.5, 1)
    UiAlign("center")
		UiText("X")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", direction[1]*180))

		UiTranslate(-80, 22)
    UiColor(0.5, 1.0, 0.5)
    UiAlign("center")
		UiText("Y")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", direction[2]*180))

		UiTranslate(-80, 22)
    UiColor(0.5, 0.5, 1)
    UiAlign("center")
    UiText("Z")

    UiTranslate(80, 0)
    UiColor(1, 1, 1)
    UiAlign("right")
    UiText(string.format("%.2f", direction[3]*180))
    UiTranslate(-185, 1)
    UiAlign("left")









		local hit, dist = Raycast(plyTransform.pos, direction, maxDist)
		if hit then
      local hitPos = TransformToParentPoint(plyTransform, Vec(0, 0, dist * - 1))

      UiTranslate(-15, 15)
  		UiColor(0, 0, 0, 0.7)
  		UiRect(100, 102)

      UiTranslate(5, 22)
      UiColor(1, 1, 1, 0.5)
      UiFont("font/bold.ttf", 22)
      UiAlign("left")
  		UiText("Look")

      UiTranslate(10, 25)
      UiColor(1, 0.5, 0.5)
      UiAlign("center")
  		UiText("X")

      UiTranslate(80, 0)
      UiColor(1, 1, 1)
      UiAlign("right")
      UiText(string.format("%.2f", tostring(hitPos[1])))

  		UiTranslate(-80, 22)
      UiColor(0.5, 1.0, 0.5)
      UiAlign("center")
  		UiText("Y")

      UiTranslate(80, 0)
      UiColor(1, 1, 1)
      UiAlign("right")
      UiText(string.format("%.2f", tostring(hitPos[2])))

  		UiTranslate(-80, 22)
      UiColor(0.5, 0.5, 1)
      UiAlign("center")
      UiText("Z")

      UiTranslate(80, 0)
      UiColor(1, 1, 1)
      UiAlign("right")
      UiText(string.format("%.2f", tostring(hitPos[3])))
      UiTranslate(-80, 22)
		end

		UiPop()
	end
end
