-- taken from http://www.coronalabs.com/blog/2012/12/11/device-detection-on-steroids/
local cacharro = {
	isApple = false,
	isAndroid = false,
	isGoogle = false,
	isKindleFire = false,
	isNook = false,
	is_iPad = false,
	isTall = false,
	isSimulator = false,
	store = nil
}

local model = system.getInfo("model")

if "simulator" == system.getInfo("environment") then
	cacharro.isSimulator = true
	cacharro.store = ''
else
	if string.sub( model, 1, 2 ) == "iP" then
		cacharro.isApple = true
		cacharro.store = "iOS"

		if string.sub( model, 1, 4 ) == "iPad" then
			cacharro.is_iPad = true
		end

	else
		cacharro.isAndroid = true
		cacharro.isGoogle = true
		cacharro.store = "Play"

		-- All of the Kindles start with "K", although Corona builds before #976 returned
		-- "WFJWI" instead of "KFJWI" (this is now fixed, and our clause handles it regardless)
		if model == "Kindle Fire" or model == "WFJWI" or string.sub( model, 1, 2 ) == "KF" then
			cacharro.isKindleFire = true
			cacharro.isGoogle = false
			cacharro.store = "Kindle"
		end

		if string.sub( model, 1 ,4 ) == "Nook" or string.sub( model, 1, 4 ) == "BNRV" then
			cacharro.isNook = true
			cacharro.isGoogle = false
			cacharro.store = "Nook"
		end

	end
end

if (display.pixelHeight/display.pixelWidth) > 1.5 then
	cacharro.isTall = true
end

return cacharro