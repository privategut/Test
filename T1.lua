warn("Process - System S")
if game:GetService("Workspace"):FindFirstChild("AAAAAAAAAAAAAAAASSSSSSSSSSSSSSSSSSSSSSDFFFFFFFFFFFFFFFGHJJJJJJJJJJJJJJJJJJJJJJJJJJJJJKKKKKKKKKKKKKKK") then
	pcall(function() game:GetService("Workspace").AAAAAAAAAAAAAAAASSSSSSSSSSSSSSSSSSSSSSDFFFFFFFFFFFFFFFGHJJJJJJJJJJJJJJJJJJJJJJJJJJJJJKKKKKKKKKKKKKKK:Destroy(); end);
end;
if game:GetService("Workspace"):FindFirstChild("KLOOOP") then
    pcall(function() game:GetService("Workspace").KLOOOP:Destroy(); end);
end;
if game:GetService("CoreGui"):FindFirstChild("Loader") then
	pcall(function() game:GetService("CoreGui").Loader:Destroy(); end);
end;
if game:GetService("CoreGui"):FindFirstChild("StartUpScreen") then
	pcall(function() game:GetService("CoreGui").StartUpScreen:Destroy(); end);
end;
if game:GetService("CoreGui"):FindFirstChild("InputPcToMobile") then
	pcall(function() game:GetService("CoreGui"):FindFirstChild("InputPcToMobile"):Destroy(); end);
end;

loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Asset/main/metsys_yek.lua"))();
repeat task.wait() until game:GetService("CoreGui"):FindFirstChild("KeySystem");
local TTJY_API = "https://ezcrack.netlify.app/.netlify/functions/";
function JSONEncode(tbl)
	local function escape_str(str)
		str = string.gsub(str, "([\"\\])", "\\%1");
		str = string.gsub(str, "[\b]", "\\b");
		str = string.gsub(str, "[\f]", "\\f");
		str = string.gsub(str, "[\n]", "\\n");
		str = string.gsub(str, "[\r]", "\\r");
		str = string.gsub(str, "[\t]", "\\t");
		return str;
	end;

	local function recurse(tbl)
		local json = "";
		local t = type(tbl);

		if t == "table" then
			json = json .. "{";
			local isFirst = true;
			for k, v in pairs(tbl) do task.wait();
				if not isFirst then
					json = json .. ",";
				end;
				isFirst = false;
				json = json .. "\"" .. escape_str(tostring(k)) .. "\":";
				json = json .. recurse(v);
			end;
			json = json .. "}";
		elseif t == "string" then
			json = json .. "\"" .. escape_str(tbl) .. "\"";
		elseif t == "number" or t == "boolean" then
			json = json .. tostring(tbl);
		else
			json = json .. "null";
		end;

		return json;
	end;

	return recurse(tbl);
end;


function JSONDecode(jsonString)
	local index = 1;
	local parseObject;
	local parseNumber;
	local parseArray;
	local parseString;

	local function skipWhitespace()
		while index <= #jsonString do
			local char = jsonString:sub(index, index);

			if char ~= ' ' and char ~= '\t' and char ~= '\n' and char ~= '\r' then
				break;
			end;

			index = index + 1;
		end;
	end;

	local function parseValue()
		skipWhitespace();

		local char = jsonString:sub(index, index);

		if char == '{' then

			return parseObject();
		elseif char == '[' then

			return parseArray();
		elseif char == '"' then

			return parseString();
		elseif char == '-' or tonumber(char) then

			return parseNumber();
		elseif jsonString:sub(index, index + 3) == "true" then

			index = index + 4;
			return true;
		elseif jsonString:sub(index, index + 4) == "false" then

			index = index + 5;
			return false;
		elseif jsonString:sub(index, index + 3) == "null" then

			index = index + 4;
			return nil;
		else
			error("Invalid JSON");
		end;
	end;

	parseObject = function()
		local obj = {};
		index = index + 1;
		while true do task.wait();
			skipWhitespace();

			local char = jsonString:sub(index, index);

			if char == '}' then

				index = index + 1;
				break;
			elseif char == ',' then

				index = index + 1;
			else
				local key = parseString();

				skipWhitespace();

				if jsonString:sub(index, index) ~= ':' then
					error("Invalid JSON");
				end;

				index = index + 1;

				local value = parseValue();

				obj[key] = value;
			end;
		end;

		return obj;
	end;

	parseArray = function()
		local arr = {};

		index = index + 1;

		while true do task.wait();

			skipWhitespace();

			local char = jsonString:sub(index, index);

			if char == ']' then

				index = index + 1;
				break;
			elseif char == ',' then

				index = index + 1;
			else

				local value = parseValue();

				table.insert(arr, value);
			end;
		end;

		return arr;
	end;

	parseString = function()
		index = index + 1;

		local endIndex = jsonString:find('"', index, true);

		if not endIndex then

			error("Invalid JSON: Unterminated string");
		end

		local str = jsonString:sub(index, endIndex - 1);

		index = endIndex + 1;

		return str;
	end;

	parseNumber = function()
		local start = index;

		local char = jsonString:sub(index, index);

		if char == '-' then
			index = index + 1;
		end;

		while tonumber(jsonString:sub(index, index)) do task.wait();
			index = index + 1;
		end;

		local numStr = jsonString:sub(start, index - 1);

		return tonumber(numStr);
	end;

	return parseValue();
end;

local function from_base64(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
	data = string.gsub(data, '[^'..b..'=]', '');
	return (data:gsub('.', function(x)
		if (x == '=') then
			return '';
		end;

		local r,f='',(b:find(x)-1);
		for i=6,1,-1 do
			r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0');
		end;
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then
			return '';
		end;
		local c=0;

		for i=1,8 do
			c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0);

		end;

		return string.char(c);
	end));
end;

local function CAT_SUS_HASH(txt)
		return string.gsub(txt,'.',function(hex)
				return tostring((string.byte(hex) - 5));
		end);
end;

local function AuthString(str,key)
		local result = "";
		local num = 1;

		result = str:gsub('.',function(char)

		local keyChar = key:sub(1,1);
		local encodedChar = string.char(bit32.bxor(char:byte() , keyChar:byte()));

			return encodedChar;
		end);

		return result:reverse();
end;

function randomString(length)
	local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	local randomStringloader = "";

	for i = 1, length do task.wait()
		local randomIndex = math.random(1, #charset);
		randomStringloader = randomStringloader .. string.sub(charset, randomIndex, randomIndex);
	end;

	return randomStringloader;
end;
local LocalPlayer = game:GetService("Players").LocalPlayer;
local AuthKey = "EZ_CRACK_IS_NOOB";
local WhitelistKey = "panda_auth_suck";
local ServiceName = "TTJYHub";
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
local WhitelistUrl = TTJY_API.."blacklist";
local CheckKeyUrl = TTJY_API.."iplogger";
local HWID = game:GetService('RbxAnalyticsService').GetClientId(game:GetService('RbxAnalyticsService'));
local HttpService = game:GetService("HttpService");
setclipboard("https://pandadevelopment.net/getkey?service=TTJYHub&hwid="..tostring(HWID));
local function WhiteListCheck()
	local WhiteListresponse = httprequest({
		Url = WhitelistUrl;
		Method = "POST";
	});
	
	local WhiteList = JSONDecode(from_base64(AuthString(WhiteListresponse.Body,WhitelistKey)));
	
	if WhiteList.Auth == "VERIFY" or WhiteList.STATUS == CAT_SUS_HASH("WHITELIST") then
		return WhiteList.Message;
	end;

	return false;
end;
local function VerifyKey(Key)
	local HidenKey = randomString(8);
	local ex_data = {
		ClientKey = tostring(Key);
		HardwareId = tostring(HWID);
		ResponseKey = tostring(HidenKey);
	};

	local Encode = JSONEncode(ex_data);
	local encrypt = AuthString(Encode,AuthKey);

	local req = httprequest({
		Url = CheckKeyUrl;
		Method = "POST";
		Headers = {
			['Content-Type'] = 'application/json';
		};
		Body = HttpService:JSONEncode({
			AUTH = tostring(encrypt)
		});
	});

	local bodyback = req.Body;

	local value,call = pcall(function()

		local dec = HttpService:JSONDecode(bodyback);
		local content = dec.content;
		local decrypt = AuthString(content,HidenKey);

		local decodedecrypt = JSONDecode(decrypt);

		if tostring(decodedecrypt.IsVerify) == "true" then
			return true;
		end;

		return false;
	end);

	pcall(function()
		if coroutine.status(req) or typeof(req) == 'thread' then
			LocalPlayer:Kick("Hook HttpRequest Detection: you nigger like 'jerome' on discord");
			return false;
		end;
	end);

	if value then
		return call;
	end;

	return false;
end;
local Luraph = WhiteListCheck();
if Luraph then
	LocalPlayer:Kick("Banned: "..tostring(Luraph));
	return;
end;
getgenv().KEY = nil;
local AllowToLoad2 = false;
if isfile("TTJYHubPandaKey.txt") then
	warn(VerifyKey(tostring(readfile("TTJYHubPandaKey.txt"))));
end;
if isfile("TTJYHubPandaKey.txt") then
	local A = readfile("TTJYHubPandaKey.txt");
	if A and VerifyKey(tostring(A)) then
		AllowToLoad2 = true;
		game:GetService("CoreGui"):FindFirstChild("KeySystem").Enabled = false;
	else
		game:GetService("CoreGui"):FindFirstChild("KeySystem").Enabled = true;
		game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"]:GetPropertyChangedSignal("Text"):Connect(function()
			print("Text changed to:", game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"].Text);
			getgenv().KEY = game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"].Text;
		end);
	end;
else
	game:GetService("CoreGui"):FindFirstChild("KeySystem").Enabled = true;
	game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"]:GetPropertyChangedSignal("Text"):Connect(function()
		print("Text changed to:", game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"].Text);
		getgenv().KEY = game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"].Text;
	end);
end;

game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextButton"].MouseButton1Click:Connect(function()
	if VerifyKey(tostring(getgenv().KEY)) then
        game:GetService("CoreGui"):FindFirstChild("KeySystem").Enabled = false;
        AllowToLoad2 = true;
        writefile("TTJYHubPandaKey.txt", tostring(getgenv().KEY));
    else
        game:GetService("CoreGui"):FindFirstChild("KeySystem")["Frame"]["TextBox"].Text = "Invalid Key/Key Expire";
    end;
end);
warn("Process - System F");

repeat task.wait() until AllowToLoad2

if game:GetService("CoreGui"):FindFirstChild("KeySystem") then
	game:GetService("CoreGui"):FindFirstChild("KeySystem"):Destroy();
end;

coroutine.wrap(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Asset/main/ReadyToLoad.lua"))();
end)();

Premium = false;
TextStatus = "???";
loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Asset/main/redaol"))();
if not Premium then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Asset/main/esitrevda"))();
end;
repeat task.wait() until game:GetService("CoreGui"):FindFirstChild("Loader") and not game:GetService("CoreGui"):FindFirstChild("Advertising")
game:GetService("CoreGui").Loader.Enabled = true;
local Front = game:GetService("CoreGui"):FindFirstChild("Loader"):WaitForChild("Frame"):WaitForChild("Frontground");
local Status = game:GetService("CoreGui"):FindFirstChild("Loader"):WaitForChild("Frame"):WaitForChild("Status");
local Num = 0.06;
local forcebreakendload = false;
coroutine.wrap(function()
    pcall(function()
        repeat
            if forcebreakendload then break end;
            if Num < 0.97 then
                Num = Num + 0.01;
                Status.Text = TextStatus;
                Front.Size = UDim2.new(Num, 0, 0.015, 0);
            end;
            task.wait(0.15);
            Status.Text = "Almost Finish";
        until getgenv().ReadyToLoad
    end);
end)();
local Window;
local RunServiceWindow;
RunServiceWindow = game:GetService("RunService").Heartbeat:Connect(function()
	if Window and Window.Root and Window.Root.Parent then
		Window.Root.Parent.Name = "TTJY Hub Fluent UI";
		Window.Minimized = false;
		Window.Root.Visible = false;
	end;
end);
warn("Process - Process S");
if getgenv().LoadingProcess == nil then
    getgenv().LoadingProcess = false;
end;
if getgenv().LoadingProcess == true then
    repeat task.wait(); until not getgenv().LoadingProcess
end;
if getgenv().LoadingProcess == false then
    getgenv().LoadingProcess = true;
    task.wait(5);
    getgenv().LoadingProcess = false;
end;
warn("Process - Process F");
task.wait();
warn("Process - Debris S");
local UI, UIF = nil;
repeat task.wait(1);
    pcall(function()
        UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/NewCMain/main/UiLibrary.ttjyhub"))();
        UIF = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))();
    end);
until UI ~= nil and UIF ~= nil
repeat task.wait(1);
    pcall(function()
        Window = UI:CreateWindow({
            Title = "Bloxfruit [OPsXs]";
            SubTitle = "by TTJY";
            TabWidth = 100;
            Size = UDim2.fromOffset(470, 380);
            Acrylic = false;
            Theme = "Dark";
            MinimizeKey = Enum.KeyCode.LeftControl
        });
    end);
until Window ~= nil

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" });
    Players = Window:AddTab({ Title = "Player", Icon = "user" });
    AutoFarmTab = Window:AddTab({ Title = "Auto Farm", Icon = "gauge" });
    Raid = Window:AddTab({ Title = "Raid", Icon = "swords" });
    Tp = Window:AddTab({ Title = "Teleport", Icon = "map" });
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-bag" });
    Fruit = Window:AddTab({ Title = "Fruit", Icon = "apple" });
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" });
	Update = Window:AddTab({ Title = "Updates", Icon = "wrench" });
	Credits = Window:AddTab({ Title = "Credits", Icon = "book" });
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
};

local Options = Fluent.Options;

local a, b, c = game:GetService("Workspace"), game:GetService("Players"), game:GetService("CoreGui");
local d, e, f = game:GetService("Lighting"), game:GetService("ReplicatedStorage"), game:GetService("UserInputService");
local g, h, i = game:GetService("TweenService"), game:GetService("RunService"), game:GetService("HttpService");
local j, k, l = game:GetService("StarterGui"), game:GetService('VirtualInputManager'), game:GetService("VirtualUser");
local Debris = game:GetService("Debris");
local cmdm = b.LocalPlayer:GetMouse();
local TargetMobName = nil;
local CommE, CommF = e.Remotes.CommE, e.Remotes.CommF_;
local selff, pGui = b.LocalPlayer, b.LocalPlayer:WaitForChild("PlayerGui");
local speedofthefly = 1;
local speedofthevfly = 1;
local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};
local Setting;
local FruitList = {
    "Bomb-Bomb", "Spike-Spike","Chop-Chop", "Spring-Spring",
    "Kilo-Kilo", "Spin-Spin", "Bird: Falcon", "Smoke-Smoke",
    "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark",
    "Revive-Revive", "Diamond-Diamond", "Light-Light", "Love-Love",
    "Rubber-Rubber", "Barrier-Barrier", "Magma-Magma", "Door-Door",
    "Quake-Quake", "Human-Human: Buddha", "String-String", "Bird-Bird: Phoenix",
    "Rumble-Rumble", "Paw-Paw", "Gravity-Gravity", "Dough-Dough",
    "Venom-Venom", "Shadow-Shadow", "Control-Control", "Soul-Soul",
    "Dragon-Dragon", "Leopard-Leopard"
};

local function DebrisItem(obj, int, Parent)
	Debris:AddItem(obj, int);
    obj.Parent = Parent;
end;
local screenGui2 = Instance.new("ScreenGui");
DebrisItem(screenGui2, 9999999999999999999, c);
screenGui2.Name = "InputPcToMobile";
local buttonSize = UDim2.new(0.05, 0, 0.05, 0);
local function createButton(key, position)
	local button = Instance.new("TextButton");
	DebrisItem(button, 9999999999999999999, screenGui2);
	button.Name = key;
	button.Text = key;
	button.Size = buttonSize;
	button.Position = position;
	button.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5);
	local isPressed = false;
	button.MouseButton1Down:Connect(function()
		isPressed = true;
		if key == "W" then CONTROL.F = speedofthefly;
		elseif key == "S" then CONTROL.B = -speedofthefly;
		elseif key == "A" then CONTROL.L = -speedofthefly;
		elseif key == "D" then CONTROL.R = speedofthefly end;
	end);
	button.MouseButton1Up:Connect(function()
		isPressed = false;
		if key == "W" then CONTROL.F = 0;
		elseif key == "S" then CONTROL.B = 0;
		elseif key == "A" then CONTROL.L = 0;
		elseif key == "D" then CONTROL.R = 0; end;
	end);
end;

local DEJ, FEZ = pcall(function()
	if not isfolder("Setting") then
		makefolder("Setting");
	end;
	if isfolder("Setting") and not isfile("Setting/BloxFruit.json") then
		Setting = {
            ["FastAttack"] = false; ["BringMob"] = false;
			["AutoFarmLevel"] = false;
            ["AutoFarmPosX"] = 0; ["AutoFarmPosY"] = 35; ["AutoFarmPosZ"] = 0;
            ["TeleportSpeedAutoFarm"] = 2;
            ["AutoFarmAura"] = false;
            ["SelectMob"] = nil; ["SelectBoss"] = nil;
            ["AutoFarmSelectMob"] = false; ["AutoFarmSelectBoss"] = false;
            ["StatsValue"] = 5; ["MeleeStats"] = false; ["DefenseStats"] = false; 
            ["SwordStats"] = false; ["GunStats"] = false; ["BloxFruitStats"] = false;
            ["AutoSaber"] = false; ["AutoSaberHop"] = false;
            ["AutoRandomFruit"] = false;  
            ["FruitToSnipe"] = nil; ["AutoSnipeFruit"] = false;
            ["FruitToStore"] = {}; ["AutoStoreSelectFruit"] = false;
            ["UIXLock"] = true; ["AlwaysOnTopX"] = false;
		};
		allowtoserialized = true;
	elseif isfolder("Setting") and isfile("Setting/BloxFruit.json") then
		task.wait();
		Setting = i:JSONDecode(readfile("Setting/BloxFruit.json"));
	end;
end);
if not DEJ then
	print(FEZ);
end;
local YEM, OML = pcall(function()
	if rawget(Setting, "aaa") == nil then
		Setting = {
            ["FastAttack"] = false; ["BringMob"] = false;
			["AutoFarmLevel"] = false;
            ["AutoFarmPosX"] = 0; ["AutoFarmPosY"] = 35; ["AutoFarmPosZ"] = 0;
            ["TeleportSpeedAutoFarm"] = 2; ["Stackable"] = false;
            ["AutoFarmAura"] = false;
            ["SelectMob"] = nil; ["SelectBoss"] = nil;
            ["AutoFarmSelectMob"] = false; ["AutoFarmSelectBoss"] = false;
            ["AutoFarmAllBoss"] = false;
            ["StatsValue"] = 5; ["MeleeStats"] = false; ["DefenseStats"] = false; 
            ["SwordStats"] = false; ["GunStats"] = false; ["BloxFruitStats"] = false;
            ["AutoSaber"] = false; ["AutoSaberHop"] = false;
            ["AutoRandomFruit"] = false;  
            ["FruitToSnipe"] = nil; ["AutoSnipeFruit"] = false;
            ["FruitToStore"] = {}; ["AutoStoreSelectFruit"] = false;
            ["UIXLock"] = true; ["AlwaysOnTopX"] = false;
		};
		allowtoserialized = true;
		j:SetCore("SendNotification", {Title = "Script Data",Text = "Error at finding AutoCollectTempLuck.Value",Duration = 5});
		j:SetCore("SendNotification", {Title = "Script Data",Text = "Reseting...",Duration = 5});
		j:SetCore("SendNotification", {Title = "Script Data",Text = "Finish",Duration = 5});
	end;
end);
if not YEM then
	print(OML)
	j:SetCore("SendNotification", {
		Title = "Script Data Failed";
		Text = tostring(OML);
		Duration = 5
	});
end;
Folder = Instance.new("Folder");
DebrisItem(Folder, 9999999999999999999, workspace);
Folder.Name = "AAAAAAAAAAAAAAAASSSSSSSSSSSSSSSSSSSSSSDFFFFFFFFFFFFFFFGHJJJJJJJJJJJJJJJJJJJJJJJJJJJJJKKKKKKKKKKKKKKKKKKKKKKKKKK";
TTJYFold = Folder;
createButton("W", UDim2.new(0.05, 0, 0.1, 0));
createButton("A", UDim2.new(0, 0, 0.2, 0));
createButton("S", UDim2.new(0.05, 0, 0.3, 0));
createButton("D", UDim2.new(0.1, 0, 0.2, 0));
TTJYMobileIn = c:WaitForChild("InputPcToMobile");

placeId = game.PlaceId
WorldCheck = {["First Sea"]=false,["Second Sea"]=false,["Third Sea"]=false}
if placeId == 2753915549 then
    WorldCheck["First Sea"] = true
elseif placeId == 4442272183 then
    WorldCheck["Second Sea"] = true
elseif placeId == 7449423635 then
    WorldCheck["Third Sea"] = true
end
function dist(position)
    return selff:DistanceFromCharacter(position);
end;function Tp2(xyz)
    if selff.Character:FindFirstChild("HumanoidRootPart") then
        selff.Character.HumanoidRootPart.CFrame = xyz;
    end;
end;function Tp(a, b, c, speedoftpNTP)
    KLLOP = selff.Character.HumanoidRootPart;
    pKLLOP = KLLOP.Position;
    cpKLLOP = Vector3.new(pKLLOP.x, pKLLOP.y, pKLLOP.z);
	tpKLOOP, sdKLOOp, saveAlKLOOP, svetarKLLOP = nil
	if typeof(a) == "number" then
    	tpKLOOP = Vector3.new(a, b, c); sdKLOOp = speedoftpNTP;
        saveAlKLOOP = CFrame.new(a, b, c);
        svetarKLLOP = CFrame.new(a, b, c);
	elseif typeof(a) == "CFrame" then
		tpKLOOP = a.Position; sdKLOOp = b;
        saveAlKLOOP = a
        svetarKLLOP = a
	end;
    dtnKLOOP = (tpKLOOP - cpKLLOP).Unit;
    dceKLLOP = (tpKLOOP - cpKLLOP).Magnitude;
    ssKLLOP = math.floor(dceKLLOP / sdKLOOp);
    if not selff.Character:FindFirstChild("Humanoid") then
        repeat task.wait(0.175); until selff.Character:FindFirstChild("Humanoid")
    end;
    for i = 1, ssKLLOP do
        if Setting.BREAKALLTHISSHITHAHAHAHAHA then break; end;
        if dist(saveAlKLOOP.Position) then Tp2(svetarKLLOP) end;
        cpKLLOP = cpKLLOP + dtnKLOOP * sdKLOOp;
        selff.Character.HumanoidRootPart.CFrame = CFrame.new(cpKLLOP);
        task.wait();
    end;
end;
JKLL, JKLLJ = pcall(function() require(e.Util.CameraShaker):Stop() end);
function CheckLevel()
    Lv = selff.Data.Level.Value;
    CommF = e.Remotes.CommF_;
    if WorldCheck["First Sea"] then
        if ((Lv == 1 or Lv <= 9) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Bandit" and not Setting.AutoFarmLevel) then
            return {
                [1] = "Bandit [Lv. 5]";
                [2] = "BanditQuest1";
                [3] = 1;
                [4] = "Bandit";
                [5] = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875);
                [6] = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
            }
        elseif ((Lv == 10 or Lv <= 14) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Monkey") then
            return {
                [1] = "Monkey [Lv. 14]";
                [2] = "JungleQuest";
                [3] = 1;
                [4] = "Monkey";
                [5] = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102);
                [6] = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
            }
        elseif ((Lv == 15 or Lv <= 29) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Gorilla") then
            return {
                [1] = "Gorilla [Lv. 20]";
                [2] = "JungleQuest";
                [3] = 2;
                [4] = "Gorilla";
                [5] = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102);
                [6] = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
            }
        elseif ((Lv == 30 or Lv <= 39) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Pirate") then
            return {
                [1] = "Pirate [Lv. 35]";
                [2] = "BuggyQuest1";
                [3] = 1;
                [4] = "Pirate";
                [5] = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188);
                [6] = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
            }
        elseif ((Lv == 40 or Lv <= 59) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Brute") then 
            return {
                [1] = "Brute [Lv. 45]";
                [2] = "BuggyQuest1";
                [3] = 2;
                [4] = "Brute";
                [5] = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188);
                [6] = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
            }
        elseif ((Lv == 60 or Lv <= 74) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Desert Bandit") then 
            return {
                [1] = "Desert Bandit [Lv. 60]";
                [2] = "DesertQuest";
                [3] = 1;
                [4] = "Desert Bandit";
                [5] = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625);
                [6] = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
            }
        elseif ((Lv == 75 or Lv <= 89) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Desert Officer") then 
            return {
                [1] = "Desert Officer [Lv. 70]";
                [2] = "DesertQuest";
                [3] = 2;
                [4] = "Desert Officer";
                [5] = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625);
                [6] = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
            }
        elseif ((Lv == 90 or Lv <= 99) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Snow Bandit") then 
            return {
                [1] = "Snow Bandit [Lv. 90]";
                [2] = "SnowQuest";
                [3] = 1;
                [4] = "Snow Bandit";
                [5] = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156);
                [6] = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
            }
        elseif ((Lv == 100 or Lv <= 119) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Snowman") then 
            return {
                [1] = "Snowman [Lv. 100]";
                [2] = "SnowQuest";
                [3] = 2;
                [4] = "Snowman";
                [5] = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156);
                [6] = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
            }
        elseif ((Lv == 120 or Lv <= 149) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Chief Petty Officer") then 
            return {
                [1] = "Chief Petty Officer [Lv. 120]";
                [2] = "MarineQuest2";
                [3] = 1;
                [4] = "Chief Petty Officer";
                [5] = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313);
                [6] = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
            }
        elseif ((Lv == 150 or Lv <= 174) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Sky Bandit") then 
            if Setting.AutoFarmLevel and (CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance", CFrame.new(-4607.82275390625, 874.3905029296875, -1667.556884765625));
            end;
            return {
                [1] = "Sky Bandit [Lv. 150]";
                [2] = "SkyQuest";
                [3] = 1;
                [4] = "Sky Bandit";
                [5] = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438);
                [6] = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
            }         
        elseif ((Lv == 175 or Lv <= 189) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Dark Master") then 
            if Setting.AutoFarmLevel and (CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance", CFrame.new(-4607.82275390625, 874.3905029296875, -1667.556884765625));
            end;
            return {
                [1] = "Dark Master [Lv. 175]";
                [2] = "SkyQuest";
                [3] = 2;
                [4] = "Dark Master";
                [5] = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438);
                [6] = CFrame.new(-5357.3515625, 449.032958984375, -2265.667236328125)
            }
        elseif ((Lv == 190 or Lv <= 209) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Prisoner") then 
            return {
                [1] = "Prisoner [Lv. 190]";
                [2] = "PrisonerQuest";
                [3] = 1;
                [4] = "Prisoner";
                [5] = CFrame.new(5308.98828125, 1.7804901599884033, 475.06048583984375);
                [6] = CFrame.new(5164.1083984375, 15.778244972229004, 489.6533508300781)
            }
        elseif ((Lv == 210 or Lv <= 249) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Dangerous Prisoner") then 
            return {
                [1] = "Dangerous Prisoner [Lv. 210]";
                [2] = "PrisonerQuest";
                [3] = 2;
                [4] = "Dangerous Prisoner";
                [5] = CFrame.new(5308.98828125, 1.7804901599884033, 475.06048583984375);
                [6] = CFrame.new(5564.0322265625, 15.759016036987305, 682.16455078125)
            }
        elseif ((Lv == 250 or Lv <= 274) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Toga Warrior") then 
            return {
                [1] = "Toga Warrior [Lv. 250]";
                [2] = "ColosseumQuest";
                [3] = 1;
                [4] = "Toga Warrior";
                [5] = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188);
                [6] = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
            }
        elseif ((Lv == 275 or Lv <= 299) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Gladiator") then 
            return {
                [1] = "Gladiator [Lv. 275]";
                [2] = "ColosseumQuest";
                [3] = 2;
                [4] = "Gladiator";
                [5] = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188);
                [6] = CFrame.new(-1324.32666015625, 58.49076843261719, -3242.227294921875)
            }
        elseif ((Lv == 300 or Lv <= 329) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Military Soldier") then 
            return {
                [1] = "Military Soldier [Lv. 300]";
                [2] = "MagmaQuest";
                [3] = 1;
                [4] = "Military Soldier";
                [5] = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625);
                [6] = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
            }
        elseif ((Lv == 330 or Lv <= 374) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Military Spy") then 
            return {
                [1] = "Military Spy [Lv. 325]";
                [2] = "MagmaQuest";
                [3] = 2;
                [4] = "Military Spy";
                [5] = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625);
                [6] = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
            }
        elseif ((Lv == 375 or Lv <= 399) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Fishman Warrior") then 
            if Setting.AutoFarmLevel and (CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(61163.8515625, 11.6796875, 1819.7841796875));
            end;
            return {
                [1] = "Fishman Warrior [Lv. 375]";
                [2] = "FishmanQuest";
                [3] = 1;
                [4] = "Fishman Warrior";
                [5] = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
                [6] = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            }
        elseif ((Lv == 400 or Lv <= 449) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Fishman Commando") then 
            
            if Setting.AutoFarmLevel and (CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(61163.8515625, 11.6796875, 1819.7841796875));
            end;
            return {
                [1] = "Fishman Commando [Lv. 400]";
                [2] = "FishmanQuest";
                [3] = 2;
                [4] = "Fishman Commando";
                [5] = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
                [6] = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            }
        elseif ((Lv == 450 or Lv <= 474) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "God's Guard") then 
            if Setting.AutoFarmLevel and (CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(-4607.82275, 872.54248, -1667.55688));
            end;
            return {
                [1] = "God's Guard [Lv. 450]";
                [2] = "SkyExp1Quest";
                [3] = 1;
                [4] = "God's Guard";
                [5] = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234);
                [6] = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            }
        elseif ((Lv == 475 or Lv <= 524) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Shanda") then 
            if Setting.AutoFarmLevel and (CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703) - selff.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
            end;
            return {
                [1] = "Shanda [Lv. 475]";
                [2] = "SkyExp1Quest";
                [3] = 2;
                [4] = "Shanda";
                [5] = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703);
                [6] = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            }
        elseif ((Lv == 525 or Lv <= 549) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Royal Squad") then 
            return {
                [1] = "Royal Squad [Lv. 525]";
                [2] = "SkyExp2Quest";
                [3] = 1;
                [4] = "Royal Squad";
                [5] = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125);
                [6] = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
            }
        elseif ((Lv == 550 or Lv <= 624) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Royal Soldier") then 
            return {
                [1] = "Royal Soldier [Lv. 550]";
                [2] = "SkyExp2Quest";
                [3] = 2;
                [4] = "Royal Soldier";
                [5] = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125);
                [6] = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
            }
        elseif ((Lv == 625 or Lv <= 649) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Galley Pirate") then 
            return {
                [1] = "Galley Pirate [Lv. 625]";
                [2] = "FountainQuest";
                [3] = 1;
                [4] = "Galley Pirate";
                [5] = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
                [6] = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
            }
        elseif (Lv >= 650 and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Galley Captain") then 
            return {
                [1] = "Galley Captain [Lv. 650]";
                [2] = "FountainQuest";
                [3] = 2;
                [4] = "Galley Captain";
                [5] = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
                [6] = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
            }
        end
    elseif WorldCheck["Second Sea"] then
        if ((Lv == 700 or Lv <= 724) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Raider") then 
            return {
                [1] = "Raider [Lv. 700]";
                [2] = "Area1Quest";
                [3] = 1;
                [4] = "Raider";
                [5] = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531);
                [6] = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
            }
        elseif ((Lv == 725 or Lv <= 774) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Mercenary") then 
            return {
                [1] = "Mercenary [Lv. 725]";
                [2] = "Area1Quest";
                [3] = 2;
                [4] = "Mercenary";
                [5] = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531);
                [6] = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
            }
        elseif ((Lv == 775 or Lv <= 799) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Swan Pirate") then 
            return {
                [1] = "Swan Pirate [Lv. 775]";
                [2] = "Area2Quest";
                [3] = 1;
                [4] = "Swan Pirate";
                [5] = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
                [6] = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
            }
        elseif ((Lv == 800 or Lv <= 874) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Factory Staff") then 
            return {
                [1] = "Factory Staff [Lv. 800]";
                [2] = "Area2Quest";
                [3] = 2;
                [4] = "Factory Staff";
                [5] = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
                [6] = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
            }
        elseif ((Lv == 875 or Lv <= 899) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Marine Lieutenant") then 
            return {
                [1] = "Marine Lieutenant [Lv. 875]";
                [2] = "MarineQuest3";
                [3] = 1;
                [4] = "Marine Lieutenant";
                [5] = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531);
                [6] = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
            }
        elseif ((Lv == 900 or Lv <= 949) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Marine Captain") then 
            return {
                [1] = "Marine Captain [Lv. 900]";
                [2] = "MarineQuest3";
                [3] = 2;
                [4] = "Marine Captain";
                [5] = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531);
                [6] = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
            }
        elseif ((Lv == 950 or Lv <= 974) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Zombie") then 
            return {
                [1] = "Zombie [Lv. 950]";
                [2] = "ZombieQuest";
                [3] = 1;
                [4] = "Zombie";
                [5] = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281);
                [6] = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
            }
        elseif ((Lv == 975 or Lv <= 999) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Vampire") then 
            return {
                [1] = "Vampire [Lv. 975]";
                [2] = "ZombieQuest";
                [3] = 2;
                [4] = "Vampire";
                [5] = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281);
                [6] = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
            }
        elseif ((Lv == 1000 or Lv <= 1049) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Snow Trooper") then 
            return {
                [1] = "Snow Trooper [Lv. 1000]";
                [2] = "SnowMountainQuest";
                [3] = 1;
                [4] = "Snow Trooper";
                [5] = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875);
                [6] = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
            }
        elseif ((Lv == 1050 or Lv <= 1099) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Winter Warrior") then 
            return {
                [1] = "Winter Warrior [Lv. 1050]";
                [2] = "SnowMountainQuest";
                [3] = 2;
                [4] = "Winter Warrior";
                [5] = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875);
                [6] = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
            }
        elseif ((Lv == 1100 or Lv <= 1124) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Lab Subordinate") then 
            return {
                [1] = "Lab Subordinate [Lv. 1100]";
                [2] = "IceSideQuest";
                [3] = 1;
                [4] = "Lab Subordinate";
                [5] = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188);
                [6] = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
            }
        elseif ((Lv == 1125 or Lv <= 1174) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Horned Warrior") then 
            return {
                [1] = "Horned Warrior [Lv. 1125]";
                [2] = "IceSideQuest";
                [3] = 2;
                [4] = "Horned Warrior";
                [5] = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188);
                [6] = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
            }
        elseif ((Lv == 1175 or Lv <= 1199) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Magma Ninja") then 
            return {
                [1] = "Magma Ninja [Lv. 1175]";
                [2] = "FireSideQuest";
                [3] = 1;
                [4] = "Magma Ninja";
                [5] = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813);
                [6] = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
            }
        elseif ((Lv == 1200 or Lv <= 1249) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Lava Pirate") then 
            return {
                [1] = "Lava Pirate [Lv. 1200]";
                [2] = "FireSideQuest";
                [3] = 2;
                [4] = "Lava Pirate";
                [5] = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813);
                [6] = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
            }
        elseif ((Lv == 1250 or Lv <= 1274) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ship Deckhand") then 
            if Setting.AutoFarmLevel and (CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625) - selff.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(923.21252441406, 126.9760055542, 32852.83203125));
            end;
            return {
                [1] = "Ship Deckhand [Lv. 1250]";
                [2] = "ShipQuest1";
                [3] = 1;
                [4] = "Ship Deckhand";
                [5] = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
                [6] = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            }
        elseif ((Lv == 1275 or Lv <= 1299) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ship Engineer") then 
            if Setting.AutoFarmLevel and (CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625) - selff.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(923.21252441406, 126.9760055542, 32852.83203125));
            end;
            return {
                [1] = "Ship Engineer [Lv. 1275]";
                [2] = "ShipQuest1";
                [3] = 2;
                [4] = "Ship Engineer";
                [5] = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
                [6] = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            }
        elseif ((Lv == 1300 or Lv <= 1324) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ship Steward") then 
            if Setting.AutoFarmLevel and (CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625) - selff.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(923.21252441406, 126.9760055542, 32852.83203125));
            end;
            return {
                [1] = "Ship Steward [Lv. 1300]";
                [2] = "ShipQuest2";
                [3] = 1;
                [4] = "Ship Steward";
                [5] = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
                [6] = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            }
        elseif ((Lv == 1325 or Lv <= 1349) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ship Officer") then 
            if Setting.AutoFarmLevel and (CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625) - selff.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(923.21252441406, 126.9760055542, 32852.83203125));
            end;
            return {
                [1] = "Ship Officer [Lv. 1325]";
                [2] = "ShipQuest2";
                [3] = 2;
                [4] = "Ship Officer";
                [5] = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
                [6] = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            }
        elseif ((Lv == 1350 or Lv <= 1374) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Arctic Warrior") then 
            if Setting.AutoFarmLevel and (CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375) - selff.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                CommF:InvokeServer("requestEntrance",CFrame.new(-6508.5581054688, 89.034996032715, -132.83953857422));
            end;
            return {
                [1] = "Arctic Warrior [Lv. 1350]";
                [2] = "FrostQuest";
                [3] = 1;
                [4] = "Arctic Warrior";
                [5] = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375);
                [6] = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            }
        elseif ((Lv == 1375 or Lv <= 1424) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Snow Lurker") then 
            return {
                [1] = "Snow Lurker [Lv. 1375]";
                [2] = "FrostQuest";
                [3] = 2;
                [4] = "Snow Lurker";
                [5] = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375);
                [6] = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
            }
        elseif ((Lv == 1425 or Lv <= 1449) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Sea Soldier") then 
            return {
                [1] = "Sea Soldier [Lv. 1425]";
                [2] = "ForgottenQuest";
                [3] = 1;
                [4] = "Sea Soldier";
                [5] = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063);
                [6] = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
            }
        elseif (Lv >= 1450 and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Water Fighter") then 
            return {
                [1] = "Water Fighter [Lv. 1450]";
                [2] = "ForgottenQuest";
                [3] = 2;
                [4] = "Water Fighter";
                [5] = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063);
                [6] = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
            }
        end
    elseif WorldCheck["Third Sea"] then
        if ((Lv == 1500 or Lv <= 1524) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Pirate Millionaire") then 
            return {
                [1] = "Pirate Millionaire [Lv. 1500]";
                [2] = "PiratePortQuest";
                [3] = 1;
                [4] = "Pirate Millionaire";
                [5] = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313);
                [6] = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
            }
        elseif ((Lv == 1525 or Lv <= 1574) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Pistol Billionaire") then 
            return {
                [1] = "Pistol Billionaire [Lv. 1525]";
                [2] = "PiratePortQuest";
                [3] = 2;
                [4] = "Pistol Billionaire";
                [5] = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313);
                [6] = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
            }
        elseif ((Lv == 1575 or Lv <= 1599) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Dragon Crew Warrior") then 
            return {
                [1] = "Dragon Crew Warrior [Lv. 1575]";
                [2] = "AmazonQuest";
                [3] = 1;
                [4] = "Dragon Crew Warrior";
                [5] = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375);
                [6] = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
            }
        elseif ((Lv == 1600 or Lv <= 1624) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Dragon Crew Archer") then 
            return {
                [1] = "Dragon Crew Archer [Lv. 1600]";
                [2] = "AmazonQuest";
                [3] = 2;
                [4] = "Dragon Crew Archer";
                [5] = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375);
                [6] = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
            }
        elseif ((Lv == 1625 or Lv <= 1649) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Female Islander") then 
            return {
                [1] = "Female Islander [Lv. 1625]";
                [2] = "AmazonQuest2";
                [3] = 1;
                [4] = "Female Islander";
                [5] = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
                [6] = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
            }
        elseif ((Lv == 1650 or Lv <= 1699) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Giant Islander") then 
            return {
                [1] = "Giant Islander [Lv. 1650]";
                [2] = "AmazonQuest2";
                [3] = 2;
                [4] = "Giant Islander";
                [5] = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
                [6] = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
            }
        elseif ((Lv == 1700 or Lv <= 1724) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Marine Commodore") then 
            return {
                [1] = "Marine Commodore [Lv. 1700]";
                [2] = "MarineTreeIsland";
                [3] = 1;
                [4] = "Marine Commodore";
                [5] = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
                [6] = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
            }
        elseif ((Lv == 1725 or Lv <= 1774) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Marine Rear Admiral") then 
            return {
                [1] = "Marine Rear Admiral [Lv. 1725]";
                [2] = "MarineTreeIsland";
                [3] = 2;
                [4] = "Marine Rear Admiral";
                [5] = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
                [6] = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
            }
        elseif ((Lv == 1775 or Lv <= 1799) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Fishman Raider") then 
            return {
                [1] = "Fishman Raider [Lv. 1775]";
                [2] = "DeepForestIsland3";
                [3] = 1;
                [4] = "Fishman Raider";
                [5] = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625);
                [6] = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
            }
        elseif ((Lv == 1800 or Lv <= 1824) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Fishman Captain") then 
            return {
                [1] = "Fishman Captain [Lv. 1800]";
                [2] = "DeepForestIsland3";
                [3] = 2;
                [4] = "Fishman Captain";
                [5] = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875);
                [6] = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
            }
        elseif ((Lv == 1825 or Lv <= 1849) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Forest Pirate") then 
            return {
                [1] = "Forest Pirate [Lv. 1825]";
                [2] = "DeepForestIsland";
                [3] = 1;
                [4] = "Forest Pirate";
                [5] = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938);
                [6] = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
            }
        elseif ((Lv == 1850 or Lv <= 1899) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Mythological Pirate") then 
            return {
                [1] = "Mythological Pirate [Lv. 1850]";
                [2] = "DeepForestIsland";
                [3] = 2;
                [4] = "Mythological Pirate";
                [5] = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938);
                [6] = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
            }
        elseif ((Lv >= 1900 and Lv <= 1924) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Jungle Pirate") then 
            return {
                [1] = "Jungle Pirate [Lv. 1900]";
                [2] = "DeepForestIsland2";
                [3] = 1;
                [4] = "Jungle Pirate";
                [5] = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375);
                [6] = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
            }
        elseif ((Lv >= 1925 and Lv <= 1974) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Musketeer Pirate") then 
            return {
                [1] = "Musketeer Pirate [Lv. 1925]";
                [2] = "DeepForestIsland2";
                [3] = 2;
                [4] = "Musketeer Pirate";
                [5] = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375);
                [6] = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
            }
        elseif ((Lv >= 1975 and Lv <= 1999) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Reborn Skeleton") then 
            return {
                [1] = "Musketeer Pirate [Lv. 1925]";
                [2] = "DeepForestIsland2";
                [3] = 2;
                [4] = "Musketeer Pirate";
                [5] = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375);
                [6] = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
            }
        elseif ((Lv >= 2000 and Lv <= 2024) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Living Zombie") then 
            return {
                [1] = "Living Zombie [Lv. 2000]";
                [2] = "HauntedQuest1";
                [3] = 2;
                [4] = "Living Zombie";
                [5] = CFrame.new(-9480.80762, 142.130661, 5566.37305);
                [6] = CFrame.new(-10103.7529, 238.565979, 6179.75977)
            }
        elseif ((Lv >= 2025 and Lv <= 2049) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Demonic Soul") then 
            return {
                [1] = "Demonic Soul [Lv. 2025]";
                [2] = "HauntedQuest1";
                [3] = 1;
                [4] = "Demonic Souls";
                [5] = CFrame.new(-9515.39551, 172.266037, 6078.89746);
                [6] = CFrame.new(-9709.30762, 204.695892, 6044.04688)
            }
        elseif ((Lv >= 2050 and Lv <= 2074) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Posessed Mummy") then 
            return {
                [1] = "Posessed Mummy [Lv. 2050]";
                [2] = "HauntedQuest2";
                [3] = 2;
                [4] = "Posessed Mummys";
                [5] = CFrame.new(-9515.39551, 172.266037, 6078.89746);
                [6] = CFrame.new(-9554.11035, 65.6141663, 6041.73584)
            }
        elseif ((Lv >= 2075 and Lv <= 2099) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Peanut Scout") then 
            return {
                [1] = "Peanut Scout [Lv. 2075]";
                [2] = "PeanutQuest1";
                [3] = 1;
                [4] = "Peanut Scout";
                [5] = CFrame.new(-2104.453125, 38.129974365234, -10194.0078125);
                [6] = CFrame.new(-2068.0949707031, 76.512603759766, -10117.150390625)
            }
        elseif ((Lv >= 2100 and Lv <= 2124) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Peanut President") then 
            return {
                [1] = "Peanut President [Lv. 2100]";
                [2] = "PeanutQuest2";
                [3] = 2;
                [4] = "Peanut Presidents";
                [5] = CFrame.new(-2104.453125, 38.129974365234, -10194.0078125);
                [6] = CFrame.new(-2067.33203125, 90.557350158691, -10552.051757812)
            }
        elseif ((Lv >= 2125 and Lv <= 2149) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ice Cream Chef") then 
            return {
                [1] = "Ice Cream Chef [Lv. 2125]";
                [2] = "IceCreamQuest1";
                [3] = 1;
                [4] = "	Ice Cream Chefs";
                [5] = CFrame.new(-821.35913085938, 65.845329284668, -10965.2578125);
                [6] = CFrame.new(-796.37261962891, 110.95275878906, -10847.473632812)
            }
        elseif ((Lv >= 2150 and Lv <= 2200) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Ice Cream Commander") then 
            return {
                [1] = "Ice Cream Commander [Lv. 2150]";
                [2] = "IceCreamIslandQuest";
                [3] = 2;
                [4] = "Ice Cream Commanders";
                [5] = CFrame.new(-821.35913085938, 65.845329284668, -10965.2578125);
                [6] = CFrame.new(-697.65338134766, 174.48368835449, -11218.38671875)
            }
        elseif ((Lv >= 2200 and Lv <= 2250) and not Setting.AutoFarmSelectMob) or (Setting.AutoFarmSelectMob and tostring(Setting.SelectMob) == "Cookie Crafter") then 
            return {
                [1] = "Cookie Crafter [Lv. 2200]";
                [2] = "CakeQuest1";
                [3] = 1;
                [4] = "Cookie Crafters";
                [5] = CFrame.new(-2017.4874267578125, 36.85276412963867, -12027.53515625);
                [6] = CFrame.new(-2358.5791015625, 36.85615539550781, -12111.052734375)
            }
        end;
    end;
end;
DamageAura = true
Fast = Setting.FastAttack
NeedAttacking = false
if JKLL then
	getHits = function(Size)
		local Hits = {};
		if nearbymon then
			local Enemies = a.Enemies:GetChildren();
			local Characters = a.Characters:GetChildren();
			for i=1,#Enemies do local v = Enemies[i];
				local Human = v:FindFirstChildOfClass("Humanoid");
				if Human and Human.RootPart and Human.Health > 0 and dist(Human.RootPart.Position) < Size+5 then
					table.insert(Hits,Human.RootPart);
				end;
			end;
			for i=1,#Characters do local v = Characters[i];
				if v ~= selff.Character then
					local Human = v:FindFirstChildOfClass("Humanoid");
					if Human and Human.RootPart and Human.Health > 0 and dist(Human.RootPart.Position) < Size+5 then
						table.insert(Hits,Human.RootPart);
					end;
				end;
			end;
		end;
		return Hits;
	end;
	local CollectionService = game:GetService("CollectionService");
	local CurrentAllMob = {};
	local canHits = {}  ;
	require(e.Util.CameraShaker):Stop();
	PC = require(selff.PlayerScripts.CombatFramework.Particle);
	RL = require(e.CombatFramework.RigLib);
	DMG = require(selff.PlayerScripts.CombatFramework.Particle.Damage);
	RigC = getupvalue(require(selff.PlayerScripts.CombatFramework.RigController),2);
	Combat =  getupvalue(require(selff.PlayerScripts.CombatFramework),2);
	task.spawn(function()
		local stacking = 0;
		local printCooldown = 0;
		while task.wait(.075) do
			nearbymon = false;
			table.clear(CurrentAllMob);
			table.clear(canHits);
			local mobs = CollectionService:GetTagged("ActiveRig");
			for i=1,#mobs do local v = mobs[i];
				Human = v:FindFirstChildOfClass("Humanoid");
				if Human and Human.Health > 0 and Human.RootPart and v ~= Char then
					local IsPlayer = b:GetPlayerFromCharacter(v);
					local IsAlly = IsPlayer and CollectionService:HasTag(IsPlayer,"Ally"..selff.Name);
					if not IsAlly then
						CurrentAllMob[#CurrentAllMob + 1] = v;
						if not nearbymon and (selff.Character:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
							nearbymon = true;
						end;
					end;
				end;
			end;
			if nearbymon then
				local Enemies = a.Enemies:GetChildren()
				local Players = b:GetPlayers()
				for i=1,#Enemies do local v = Enemies[i]
					local Human = v:FindFirstChildOfClass("Humanoid");
					if Human and Human.RootPart and Human.Health > 0 and (selff.Character:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
						canHits[#canHits+1] = Human.RootPart;
					end;
				end;
				for i=1,#Players do local v = Players[i].Character;
					if not Players[i]:GetAttribute("PvpDisabled") and v and v ~= selff.Character then
						local Human = v:FindFirstChildOfClass("Humanoid");
						if Human and Human.RootPart and Human.Health > 0 and (selff.Character:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
							canHits[#canHits+1] = Human.RootPart;
						end;
					end;
				end;
			end;
		end;
	end);
	local shared = getgenv();
	local Data = Combat;
	local Blank = function() end;
	local RigEvent = e.RigControllerEvent;
	local Validator = e.Remotes.Validator;
	local Animation = Instance.new("Animation");
	local RecentlyFired = 0;
	local AttackCD = 0;
	local Controller;
	local lastFireValid = 0;
	local MaxLag = 350;
	fucker = 0.07;
	TryLag = 0;
	local resetCD = function()
		local WeaponName = Controller.currentWeaponModel.Name;
		local Cooldown = {
			combat = 0.07
		};
		AttackCD = tick() + (fucker and Cooldown[WeaponName:lower()] or fucker or 0.285) + ((TryLag/MaxLag)*0.3);
		RigEvent.FireServer(RigEvent,"weaponChange",WeaponName);
		TryLag = TryLag + 1;
		task.delay((fucker or 0.285) + (TryLag+0.5/MaxLag)*0.3,function()
			TryLag = TryLag - 1;
		end);
	end;
	if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end;
	if not shared.cpc then shared.cpc = PC.play end;
	if not shared.dnew then shared.dnew = DMG.new end;
	if not shared.attack then shared.attack = RigC.attack end;
	RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
		if not getgenv().FastZure then
			PC.play = shared.cpc;
			return shared.orl(a,b,c,65,func);
		end;
		local Radius = (getgenv().FastZure and getgenv().FastZureRadius) or 65;
		if canHits and #canHits > 0 then
			PC.play = function() end;
			a:Play(0.01,0.01,0.01);
			func(canHits);
			task.wait(a.length * 0.5);
			a:Stop();
		end;
	end;

    -- RL??? PC???? DMG???? --

	task.spawn(function()
		local Data = Combat;
		local Blank = function() end;
		local RigEvent = e.RigControllerEvent;
		local Animation = Instance.new("Animation");
		local RecentlyFired = 0;
		local AttackCD = 0;
		local Controller;
		local lastFireValid = 0;
		local MaxLag = 350;
		fucker = 0.07;
		TryLag = 0;
		local resetCD = function()
			local WeaponName = Controller.currentWeaponModel.Name;
			local Cooldown = {
				combat = 0.07;
			}
			AttackCD = tick() + (fucker and Cooldown[WeaponName:lower()] or fucker or 0.285) + ((TryLag/MaxLag)*0.3);
			RigEvent.FireServer(RigEvent,"weaponChange",WeaponName);
			TryLag = TryLag + 1;
			task.delay((fucker or 0.285) + (TryLag+0.5/MaxLag)*0.3,function()
				TryLag = TryLag - 1;
			end);
		end;
		if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end;
		if not shared.cpc then shared.cpc = PC.play end;
		if not shared.dnew then shared.dnew = DMG.new end;
		if not shared.attack then shared.attack = RigC.attack end;
		RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
			if not NeedAttacking then
				PC.play = shared.cpc;
				return shared.orl(a,b,c,65,func);
			end;
			local Radius = (DamageAura and DamageAuraRadius) or 65;
			if canHits and #canHits > 0 then
				PC.play = function() end;
				a:Play(0.00075,0.01,0.01);
				func(canHits);
				task.wait(a.length * 0.5);
				a:Stop();
			end;
		end;
		while h.Stepped:Wait() do
			if #canHits > 0 then
				Controller = Data.activeController;
				if NormalClick then
					pcall(task.spawn,Controller.attack,Controller);
				end;
				if Controller and Controller.equipped and Controller.currentWeaponModel then
					if (NeedAttacking and DamageAura) then
						if Fast and tick() > AttackCD and not DisableFastAttack then
							resetCD();
						end
						if tick() - lastFireValid > 0.5 or not Fast then
							Controller.timeToNextAttack = 0;
							Controller.hitboxMagnitude = 65;
							pcall(task.spawn,Controller.attack,Controller);
							lastFireValid = tick();
						end;
						local AID3 = Controller.anims.basic[3];
						local AID2 = Controller.anims.basic[2];
						local ID = AID3 or AID2;
						Animation.AnimationId = ID;
						local Playing = Controller.humanoid:LoadAnimation(Animation);
						Playing:Play(0.00075,0.01,0.01);
						RigEvent.FireServer(RigEvent,"hit",canHits,AID3 and 3 or 2,"");
						-- AttackSignal:Fire();
						delay(.5,function()
							Playing:Stop();
						end);
					end;
				end;
			end;
		end;
	end);
else
    if not getgenv().Dev then
        selff:Kick("Unsupported Executor .. We are trying our best to make this support every executor. Thank you for using TTJY Hub.");
    end;
end;function EquipWeapon(Name)
    if selff.Backpack:FindFirstChild(Name) then
        ToolJKNLL = selff.Backpack:FindFirstChild(Name);
        task.wait(0.02);
        selff.Character.Humanoid:EquipTool(ToolJKNLL);
        task.wait(0.5);
    end;
end;function UnEquipWeapon(Weapon)
    if selff.Character:FindFirstChild(Weapon) then
        task.wait(0.5);
        selff.Character:FindFirstChild(Weapon).Parent = selff.Backpack;
        task.wait(0.1);
    end;
end;function EquipWeapon2(Name)
    for i, v in pairs(selff.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == Name then
                selff.Character.Humanoid:EquipTool(v);
            end;
        end;
    end;
end;function UnEquipWeapon2(Name)
    for i, v in pairs(selff.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v.ToolTip == Name then
                selff.Character:FindFirstChild(Weapon).Parent = selff.Backpack;
            end;
        end;
    end;
end;function STP()
    STOPTP.TextColor3  = Color3.fromRGB(0, 255, 0);
    Setting.BREAKALLTHISSHITHAHAHAHAHA = true;
    task.wait(0.275);
    STOPTP.TextColor3  = Color3.fromRGB(255, 0, 0);
    Setting.BREAKALLTHISSHITHAHAHAHAHA = false;
end;function NearestPlr()
    nearestPlayerNMKKK = nil;
    nearestDistanceNMKKK = math.huge;
    for _, v in pairs(b:GetPlayers()) do
        if v ~= selff and v.Character then
            charNMKKK = v.Character;
            if dist(charNMKKK:GetPivot().Position) < nearestDistanceNMKKK then
                nearestDistanceNMKKK = dist(charNMKKK:GetPivot().Position);
                nearestPlayerNMKKK = v;
            end;
        end;
    end;
    return b[nearestPlayerNMKKK.Name];
end;function BNotify(message)
    Notification = require(e.Notification);
    Notification.new(message):Display();
end;function StoreFruit()
    for i, v in pairs(FruitToStore) do
        CommF:InvokeServer("StoreFruit", v);
    end;
end;function StoreAllFruit()
    for i, v in pairs(FruitList) do
        CommF:InvokeServer("StoreFruit", v);
    end;
end;function SnipeFruit()
    CommF:InvokeServer("GetFruits");
    CommF:InvokeServer("PurchaseRawFruit", Setting.FruitToSnipe);
end;function RandomFruit()
    CommF:InvokeServer("Cousin", "Buy");
end;function Buso()
    if not selff.Character:FindFirstChild("HasBuso") then
        CommF:InvokeServer("Buso");
    end;
end;function BuyI(a, b)
    CommF:InvokeServer(a, b);
end;
CHECKGUNHHHJ, JKOOOLLLLWKGUN = pcall(function()
    km = nil; for i, v in next, getgc() do if typeof(v) == 'function' then local u = debug.getinfo(v); if string.find(u.source, 'GunClient', 1, true) and u.currentline == 58 then km = v; break; end; end; end; istypeing = false; vector2 = Vector2.new(500,500); table.foreach(debug.getinfo(km),warn);
end);
if not CHECKGUNHHHJ then
    print("No Gun");
end;

local UNoClip, FNoclip = false
local UNoClipC, FNoclipC = nil
local function FNoC(bool)
	if bool then
		if FNoclipC == nil then
			FNoclipC = h.Stepped:Connect(function()
				for _, child in pairs(selff.Character:GetDescendants()) do
					if child:IsA("BasePart") then
						child.CanCollide = false;
					end;
				end;		
			end);
		end;
	else
		if FNoclipC ~= nil then
			FNoclipC:Disconnect();
			FNoclipC = nil;
		end;
	end;
end;
local function UNoC(bool)
    if bool then
		if UNoClipC == nil then
			UNoClipC = h.Stepped:Connect(function()
				for _, child in pairs(selff.Character:GetDescendants()) do
					if child:IsA("BasePart") then
						child.CanCollide = false;
					end;
				end;		
			end);
		end;
	else
		if UNoClipC ~= nil then
			UNoClipC:Disconnect();
			UNoClipC = nil;
		end;
	end;
end
local UFloat, FFloat = false
local UFPart = Instance.new("Part")
UFPart.Size = Vector3.new(2, 0.2, 1.5)
UFPart.Material = Enum.Material.Grass
UFPart.Anchored = true
UFPart.Transparency = 1
DebrisItem(UFPart, 9999999999999999999, TTJYFold)
h.RenderStepped:Connect(function()
	character = selff.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart and UFloat then
		UFPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3.1, 0)
	else
		UFPart.CFrame = CFrame.new(0, -10000, 0)
	end
end)
local FPart = Instance.new("Part")
FPart.Size = Vector3.new(2, 0.2, 1.5)
FPart.Material = Enum.Material.Grass
FPart.Anchored = true
FPart.Transparency = 1
DebrisItem(FPart, 9999999999999999999, TTJYFold)
h.RenderStepped:Connect(function()
	character = selff.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart and FFloat then
		FPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3.1, 0)
	else
		FPart.CFrame = CFrame.new(0, -10000, 0)
	end
end)
AFK = false;
CurrentFluent = nil;
warn("Process - Debris F");
do
    warn("Process - UI S")
    Tabs.Main:AddSection("Stat");
    StatsValue = Tabs.Main:AddInput("StatsValue", {
        Title = "Point", Default = tostring(Setting.StatsValue),
        Placeholder = "Placeholder", Numeric = true, Finished = false,
        Callback = function(Value)
            Setting.StatsValue = Value;
        end;
    });
    StatsValue:OnChanged(function() Setting.StatsValue = StatsValue.Value; end);
    MeleeStats = Tabs.Main:AddToggle("MeleeStats", {Title = "Melee", Default = Setting.MeleeStats });
    MeleeStats:OnChanged(function() Setting.MeleeStats = Options.MeleeStats.Value; end);
    DefenseStats = Tabs.Main:AddToggle("DefenseStats", {Title = "Defense", Default = Setting.DefenseStats });
    DefenseStats:OnChanged(function() Setting.DefenseStats = Options.DefenseStats.Value; end);
    SwordStats = Tabs.Main:AddToggle("SwordStats", {Title = "Sword", Default = Setting.SwordStats });
    SwordStats:OnChanged(function() Setting.SwordStats = Options.SwordStats.Value; end);
    GunStats = Tabs.Main:AddToggle("GunStats", {Title = "Gun", Default = Setting.GunStats });
    GunStats:OnChanged(function() Setting.GunStats = Options.GunStats.Value; end);
    BloxFruitStats = Tabs.Main:AddToggle("BloxFruitStats", {Title = "Fruit", Default = Setting.BloxFruitStats });
    BloxFruitStats:OnChanged(function() Setting.BloxFruitStats = Options.BloxFruitStats.Value; end);
    Valuess = nil;
    WeaponBackpack = {tostring(Setting.SelectWeapon)};
    Tabs.AutoFarmTab:AddSection("Select Weapon");
    SelectWeapon = Tabs.AutoFarmTab:AddDropdown("SelectWeapon", {
        Title = "Select Weapon",
        Values = WeaponBackpack,
        Multi = false, Default = 1,
    });
    SelectWeapon:OnChanged(function(Value) Setting.SelectWeapon = Value; end); 
    Tabs.AutoFarmTab:AddButton({
        Title = "Refresh Weapon", Description = "",
        Callback = function()
            WeaponBackpack = {};
            for _, item in pairs(selff.Backpack:GetChildren()) do
                table.insert(WeaponBackpack, item.Name);
            end;
            task.wait();
            SelectWeapon:SetValues(WeaponBackpack);
        end;
    });
    AutoFarmLevel = Tabs.AutoFarmTab:AddToggle("AutoFarmLevel", {Title = "Auto Farm Level", Default = Setting.AutoFarmLevel });
	AutoFarmLevel:OnChanged(function() Setting.AutoFarmLevel = Options.AutoFarmLevel.Value end);
    AutoSea2 = Tabs.AutoFarmTab:AddToggle("AutoSea2", {Title = "Auto Sea 2", Default = Setting.AutoSea2 });
	AutoSea2:OnChanged(function() Setting.AutoSea2 = Options.AutoSea2.Value end);
    if WorldCheck["First Sea"] then Valuess = {"Bandit", "Monkey", "Gorilla", "Pirate", "Brute", "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman", "Chief Petty Officer", "Sky Bandit", "Dark Master", "Prisoner", "Dangerous Prisoner", "Toga Warrior", "Gladiator", "Military Soldier", "Fishman Warrior", "Fishman Commando", "God's Guard", "Shanda", "Royal Squad", "Royal Soldier", "Galley Pirate"};
    elseif WorldCheck["Second Sea"] then Valuess = {"Raider", "Mercenary", "Swan Pirate", "Factory Staff", "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter"};
    elseif WorldCheck["Third Sea"] then Valuess = {"Pirate Millionaire", "Pistol Billionaire", "Dragon Crew Warrior", "Dragon Crew Archer", "Female Islander", "Giant Islander", "Marine Commodore", "Marine Rear Admiral", "Fishman Raider", "Fishman Captain", "Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate", "Musketeer Pirate", "Living Zombie", "Demonic Souls", "Posessed Mummys", "Peanut Scout", "Peanut Presidents", "Ice Cream Chefs", "Ice Cream Commanders", "Cookie Crafters"}; end;
    SelectMob = Tabs.AutoFarmTab:AddDropdown("SelectMob", {Title = "Select Mob", Values = Valuess, Multi = false, Default = 1,});
    SelectMob:OnChanged(function(Value) Setting.SelectMob = Options.SelectMob.Value; end);
    AutoFarmSelectMob = Tabs.AutoFarmTab:AddToggle("AutoFarmSelectMob", {Title = "Auto Selected Mob", Default = Setting.AutoFarmSelectMob });
	AutoFarmSelectMob:OnChanged(function() Setting.AutoFarmSelectMob = Options.AutoFarmSelectMob.Value end);
    if WorldCheck["First Sea"] then Valuess = {"Saber Expert", "The Saw", "Greybeard", "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg"};
    elseif WorldCheck["Second Sea"] then Valuess = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"};
    elseif WorldCheck["Third Sea"] then Valuess = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}; end;
    SelectBoss = Tabs.AutoFarmTab:AddDropdown("SelectBoss", {Title = "Select Boss", Values = Valuess, Multi = false, Default = 1,});
    SelectBoss:OnChanged(function(Value) Setting.SelectBoss = Options.SelectBoss.Value; end);
    AutoFarmSelectBoss = Tabs.AutoFarmTab:AddToggle("AutoFarmSelectBoss", {Title = "Auto Selected Boss", Default = Setting.AutoFarmSelectBoss });
    AutoFarmSelectBoss:OnChanged(function() Setting.AutoFarmSelectBoss = Options.AutoFarmSelectBoss.Value end);
    AutoFarmAllBoss = Tabs.AutoFarmTab:AddToggle("AutoFarmAllBoss", {Title = "Auto Farm All Boss", Default = Setting.AutoFarmAllBoss });
    AutoFarmAllBoss:OnChanged(function() Setting.AutoFarmAllBoss = Options.AutoFarmAllBoss.Value end);
    Tabs.AutoFarmTab:AddSection("Chest");
    AutoChest = Tabs.AutoFarmTab:AddToggle("AutoChest", {Title = "Auto Chest", Default = Setting.AutoChest });
    AutoChest:OnChanged(function() 
        Setting.AutoChest = Options.AutoChest.Value;
        task.spawn(function()
            while Setting.AutoChest do task.wait();
                if getgenv().LoadingProcess then break; end; nearestChest = nil;
                if Setting.AutoNormalChest and not Setting.AutoDetailChest then
                    shdtts = math.huge; nearestChest = nil;
                    for _, v in pairs(a:GetChildren()) do
                        if v:IsA("BasePart") and (v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3") then
                            if dist(v.Position) < shdtts then nearestChest = v; shdtts = dist(v.Position) end; end; end;
                elseif (Setting.AutoNormalChest and Setting.AutoDetailChest) or (not Setting.AutoNormalChest and Setting.AutoDetailChest) then
                    shdtts = math.huge; nearestChest = nil;
                    for _, v in pairs(a:GetDescendants()) do
                        if v:IsA("BasePart") and (v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3") then
                            if dist(v.Position) < shdtts then
                                nearestChest = v; shdtts = dist(v.Position); end; end; end; end;
                if nearestChest ~= nil then
                    Tp(nearestChest.Position.X, nearestChest.Position.Y, nearestChest.Position.Z, tonumber(Setting.TeleportSpeedAutoFarm)); task.wait();
                    Tp2(CFrame.new(nearestChest.Position.X, nearestChest.Position.Y, nearestChest.Position.Z));
                end;
            end;
        end);
    end);
    if WorldCheck["First Sea"] then
        Tabs.AutoFarmTab:AddSection("Saber");
        AutoSaber = Tabs.AutoFarmTab:AddToggle("AutoSaber", {Title = "Auto Saber", Default = Setting.AutoSaber });
        AutoSaber:OnChanged(function() Setting.AutoSaber = Options.AutoSaber.Value; end);
        AutoSaberHop = Tabs.AutoFarmTab:AddToggle("AutoSaberHop", {Title = "Hop", Default = Setting.AutoSaberHop });
        AutoSaberHop:OnChanged(function() Setting.AutoSaberHop = Options.AutoSaberHop.Value; end);
    end;
    if WorldCheck["Second Sea"] then
        Tabs.AutoFarmTab:AddSection("Factory");
        AutoFactory = Tabs.AutoFarmTab:AddToggle("AutoFactory", {Title = "Auto Factory", Default = Setting.AutoFactory });
        AutoFactory:OnChanged(function() Setting.AutoFactory = Options.AutoFactory.Value; end);
        AutoFactoryHop = Tabs.AutoFarmTab:AddToggle("AutoFactoryHop", {Title = "Hop", Default = Setting.AutoFactoryHop });
        AutoFactoryHop:OnChanged(function() Setting.AutoFactoryHop = Options.AutoFactoryHop.Value; end);
        Tabs.AutoFarmTab:AddSection("Rengoku");
        AutoRengoku = Tabs.AutoFarmTab:AddToggle("AutoRengoku", {Title = "Auto Rengoku", Default = Setting.AutoRengoku });
        AutoRengoku:OnChanged(function() Setting.AutoRengoku = Options.AutoRengoku.Value; end);
        Tabs.AutoFarmTab:AddSection("Ectoplasm");
        AutoEctoplasm = Tabs.AutoFarmTab:AddToggle("AutoEctoplasm", {Title = "Auto Ectoplasm", Default = Setting.AutoEctoplasm });
        AutoEctoplasm:OnChanged(function() Setting.AutoEctoplasm = Options.AutoEctoplasm.Value; end);
        Tabs.AutoFarmTab:AddSection("Melee");
        EnabledHopWhenNeededAMelee = Tabs.AutoFarmTab:AddToggle("EnabledHopWhenNeededAMelee", {Title = "Hop (When needed)", Default = Setting.EnabledHopWhenNeededAMelee });
        EnabledHopWhenNeededAMelee:OnChanged(function() Setting.EnabledHopWhenNeededAMelee = Options.EnabledHopWhenNeededAMelee.Value; end);
        AutoSharkman = Tabs.AutoFarmTab:AddToggle("AutoSharkman", {Title = "Auto Sharkman", Default = Setting.AutoSharkman });
        AutoSharkman:OnChanged(function() Setting.AutoSharkman = Options.AutoSharkman.Value; end);
        AutoBlackLegV2 = Tabs.AutoFarmTab:AddToggle("AutoBlackLegV2", {Title = "Auto Blackleg V2", Default = Setting.AutoBlackLegV2 });
        AutoBlackLegV2:OnChanged(function() Setting.AutoBlackLegV2 = Options.AutoBlackLegV2.Value; end);
        AutoDragonClaw = Tabs.AutoFarmTab:AddToggle("AutoDragonClaw", {Title = "Auto DragonClaw", Default = Setting.AutoDragonClaw });
        AutoDragonClaw:OnChanged(function() Setting.AutoDragonClaw = Options.AutoDragonClaw.Value; end);
        AutoSuperhuman = Tabs.AutoFarmTab:AddToggle("AutoSuperhuman", {Title = "Auto Superhuman (Turn off all melee)", Default = Setting.AutoSuperhuman });
        AutoSuperhuman:OnChanged(function() Setting.AutoSuperhuman = Options.AutoSuperhuman.Value; end);
    end;
    if not WorldCheck["First Sea"] then
        Tabs.Raid:AddSection("Manual");
        SelectRaidAChip = Tabs.Raid:AddDropdown("SelectRaidAChip", {
            Title = "Select Raid",
            Values = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix"},
            Multi = false, Default = 1,
        });SelectRaidAChip:OnChanged(function(Value)
            Setting.SelectedRaid = Value
        end);Tabs.Raid:AddButton({
            Title = "Buy", Description = "",
            Callback = function()
                CommF:InvokeServer("RaidsNpc", "Select", tostring(Setting.SelectedRaid));
            end;
        });KillAura = Tabs.Raid:AddToggle("KillAura", {Title = "Kill Aura", Default = false });
        KillAura:OnChanged(function()
            Setting.KillAura = Options.KillAura.Value;
        end);DMGAura = Tabs.Raid:AddToggle("DMGAura", {Title = "Damage Aura", Default = false });
        DMGAura:OnChanged(function()
            Setting.DMGAura = Options.DMGAura.Value;
        end);
        Tabs.Raid:AddSection("Auto Raid");
        SelectRaidAChip2 = Tabs.Raid:AddDropdown("SelectRaidAChip2", {
            Title = "Select Raid",
            Values = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix"},
            Multi = false, Default = 1,
        });SelectRaidAChip2:OnChanged(function(Value)
            Setting.SelectedRaid2 = Value;
        end);AutoRaid = Tabs.Raid:AddToggle("AutoRaid", {Title = "Auto Raid (Unstackable)", Default = Setting.AutoRaid });
        AutoRaid:OnChanged(function() Setting.AutoRaid = Options.AutoRaid.Value; end);
    else
        KillAura = Tabs.Raid:AddToggle("KillAura", {Title = "Kill Aura", Default = false });
        KillAura:OnChanged(function() Setting.KillAura = Options.KillAura.Value; end);
        Tabs.Raid:AddSection("Unsupported Sea")
        Tabs.Raid:AddButton({Title = "Teleport To Seacond Sea", Description = "", Callback = function() Window:Dialog({Title = "Are you sure?", Content = "You want to go to second sea?", Buttons = {{Title = "Yes", Callback = function() TPS(2) end}, {Title = "No", Callback = function() end}};});end;});
    end;
    if WorldCheck["Second Sea"] then
        Tabs.Shop:AddSection("Legendary Sword");
        AutoLegendarySword = Tabs.Shop:AddToggle("AutoLegendarySword", {Title = "Auto Buy Legendary Sword", Default = Setting.AutoLegendarySword });
        AutoLegendarySword:OnChanged(function() Setting.AutoLegendarySword = Options.AutoLegendarySword.Value; end);
        AutoLegendarySwordHop = Tabs.Shop:AddToggle("AutoLegendarySwordHop", {Title = "Hop", Default = Setting.AutoLegendarySwordHop });
        AutoLegendarySwordHop:OnChanged(function() Setting.AutoLegendarySwordHop = Options.AutoLegendarySwordHop.Value; end);
        Tabs.Shop:AddSection("Enchancement Color");
        AutoEnchancementColor = Tabs.Shop:AddToggle("AutoEnchancementColor", {Title = "Auto Buy Enchancement Color", Default = Setting.AutoEnchancementColor });
        AutoEnchancementColor:OnChanged(function() Setting.AutoEnchancementColor = Options.AutoEnchancementColor.Value; end);
        AutoEnchancementColorHop = Tabs.Shop:AddToggle("AutoEnchancementColorHop", {Title = "Hop", Default = Setting.AutoEnchancementColorHop });
        AutoEnchancementColorHop:OnChanged(function() Setting.AutoEnchancementColorHop = Options.AutoEnchancementColorHop.Value; end);
    end;
    Tabs.Shop:AddSection("Abilities");
    Tabs.Shop:AddButton({ Title = "Buy Geppo", Description = "", Callback = function() BuyI("BuyHaki", "Geppo"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Buso Haki", Description = "", Callback = function() BuyI("BuyHaki", "Buso"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Soru", Description = "", Callback = function() BuyI("BuyHaki", "Soru"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Observation(Ken) Haki", Description = "", Callback = function() BuyI("KenTalk", "Buy"); end;});
    Tabs.Shop:AddSection("Fighting Style");
    Tabs.Shop:AddButton({ Title = "Buy Black Leg", Description = "", Callback = function() BuyI("BuyBlackLeg"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Electro", Description = "", Callback = function() BuyI("BuyElectro"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Fishman Karate", Description = "", Callback = function() BuyI("BuyFishmanKarate"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Dragon Claw", Description = "", Callback = function() CommF:InvokeServer("BlackbeardReward","DragonClaw","1"); CommF:InvokeServer("BlackbeardReward","DragonClaw","2"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Superhuman", Description = "", Callback = function() BuyI("BuySuperhuman"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Death Step", Description = "", Callback = function() BuyI("BuyDeathStep"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Sharkman Karate", Description = "", Callback = function() BuyI("BuySharkmanKarate", true); BuyI("BuySharkmanKarate"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Electric Claw", Description = "", Callback = function() BuyI("BuyElectricClaw"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Dragon Talon", Description = "", Callback = function() BuyI("BuyDragonTalon"); end;});
    Tabs.Shop:AddSection("Accessory");
    Tabs.Shop:AddButton({ Title = "Buy Tomoe Ring", Description = "", Callback = function() BuyI("BuyItem","Tomoe Ring"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Black Cape", Description = "", Callback = function() BuyI("BuyItem","Black Cape"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Swordsman Hat", Description = "", Callback = function() BuyI("BuyItem","Swordsman Hat"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Ghoul Mask", Description = "", Callback = function() CommF:InvokeServer("Ectoplasm", "BuyCheck", 2); CommF:InvokeServer("Ectoplasm", "Buy", 2); end;});
    Tabs.Shop:AddSection("Sword");
    Tabs.Shop:AddButton({ Title = "Buy Cutlass", Description = "", Callback = function() BuyI("BuyItem","Cutlass"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Katana", Description = "", Callback = function() BuyI("BuyItem","Katana"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Iron Mace", Description = "", Callback = function() BuyI("BuyItem","Iron Mace"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Duel Katana", Description = "", Callback = function() BuyI("BuyItem","Duel Katana"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Triple Katana", Description = "", Callback = function() BuyI("BuyItem","Triple Katana"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Pipe", Description = "", Callback = function() BuyI("BuyItem","Pipe"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Dual-Headed Blade", Description = "", Callback = function() BuyI("BuyItem","Dual-Headed Blade"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Bisento", Description = "", Callback = function() BuyI("BuyItem","Bisento"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Soul Cane", Description = "", Callback = function() BuyI("BuyItem","Soul Cane"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Midnight Blade", Description = "", Callback = function() CommF:InvokeServer("Ectoplasm", "BuyCheck", 3); CommF:InvokeServer("Ectoplasm", "Buy", 3); end;});
    Tabs.Shop:AddSection("Gun");
    Tabs.Shop:AddButton({ Title = "Buy Slingshot", Description = "", Callback = function() BuyI("BuyItem","Slingshot"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Musket", Description = "", Callback = function() BuyI("BuyItem","Musket"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Flintlock", Description = "", Callback = function() BuyI("BuyItem","Flintlock"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Refined Flintlock", Description = "", Callback = function() BuyI("BuyItem","Refined Flintlock"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Cannon", Description = "", Callback = function() BuyI("BuyItem","Cannon"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Kabucha", Description = "", Callback = function() CommF:InvokeServer("BlackbeardReward","Slingshot","1"); CommF:InvokeServer("BlackbeardReward","Slingshot","2"); end;});
    Tabs.Shop:AddButton({ Title = "Buy Bizarre Rifle", Description = "", Callback = function() CommF:InvokeServer("Ectoplasm", "BuyCheck", 1); CommF:InvokeServer("Ectoplasm", "Buy", 1); end;});
    Tabs.Players:AddSection("Main");
    AntiAFK = Tabs.Players:AddToggle("AntiAFK", {Title = "Anti AFK", Default = Setting.AFK });
    AntiAFK:OnChanged(function() AFK = Options.AntiAFK.Value; end);
    coroutine.wrap(function() selff.Idled:connect(function() if AFK then l:CaptureController(); l:ClickButton2(Vector2.new()); task.wait(2); end; end); end)();
    FloatT = Tabs.Players:AddToggle("FloatT", {Title = "Float", Default = false });
    FloatT:OnChanged(function() UFloat = Options.FloatT.Value; end);
    NoClipT = Tabs.Players:AddToggle("NoClipT", {Title = "Noclip", Default = false });
    NoClipT:OnChanged(function() FNoC(Options.NoClipT.Value); end); FLYING = false;
    local FLysss = Tabs.Players:AddToggle("FLysss", {Title = "Fly", Default = false });
    FLysss:OnChanged(function()
        if Options.FLysss.Value then
            FLYING = Options.FLysss.Value;
            while not selff or not selff.Character or not selff.Character:FindFirstChild('HumanoidRootPart') or not selff.Character:FindFirstChild('Humanoid') or not cmdm do
                wait();
            end;
            local T = selff.Character.HumanoidRootPart;
            local SPEED = 0;
            function FLY()
                local BG = Instance.new('BodyGyro', T);
                local BV = Instance.new('BodyVelocity', T);
                BG.P = 9e4;
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9);
                BG.cframe = T.CFrame;
                BV.velocity = Vector3.new(0, 0, 0);
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9);
                spawn(function()
                    while FLYING do
                        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                            SPEED = 50;
                        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                            SPEED = 0;
                        end
                        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                            BV.velocity = ((a.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((a.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - a.CurrentCamera.CoordinateFrame.p)) * SPEED;
                        else
                            BV.velocity = Vector3.new(0, 0, 0);
                        end;
                        BG.cframe = a.CurrentCamera.CoordinateFrame;
                        wait();
                    end;
                    CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};
                    SPEED = 0;
                    BG:Destroy();
                    BV:Destroy();
                    selff.Character.Humanoid.PlatformStand = false;
                end);
            end;
            cmdm.KeyDown:connect(function(KEY)
                if KEY:lower() == 'w' then
                    if vfly then
                        CONTROL.F = speedofthevfly;
                    else
                        CONTROL.F = speedofthefly;
                    end;
                elseif KEY:lower() == 's' then
                    if vfly then
                        CONTROL.B = -speedofthevfly;
                    else
                        CONTROL.B = -speedofthefly;
                    end;
                elseif KEY:lower() == 'a' then
                    if vfly then
                        CONTROL.L = -speedofthevfly;
                    else
                        CONTROL.L = -speedofthefly;
                    end;
                elseif KEY:lower() == 'd' then
                    if vfly then
                        CONTROL.R = speedofthevfly;
                    else
                        CONTROL.R = speedofthefly;
                    end;
                elseif KEY:lower() == 'y' then
                    if vfly then
                        CONTROL.Q = speedofthevfly * 2;
                    else
                        CONTROL.Q = speedofthefly * 2;
                    end;
                elseif KEY:lower() == 't' then
                    if vfly then
                        CONTROL.E = -speedofthevfly * 2;
                    else
                        CONTROL.E = -speedofthefly * 2;
                    end;
                end;
            end);
            cmdm.KeyUp:connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = 0;
                elseif KEY:lower() == 's' then
                    CONTROL.B = 0;
                elseif KEY:lower() == 'a' then
                    CONTROL.L = 0;
                elseif KEY:lower() == 'd' then
                    CONTROL.R = 0;
                elseif KEY:lower() == 'y' then
                    CONTROL.Q = 0;
                elseif KEY:lower() == 't' then
                    CONTROL.E = 0;
                end;
            end);
            FLY();
        else
            FLYING = Options.FLysss.Value;
        end;
    end);
    pfly = Tabs.Players:AddSlider("pfly", {
        Title = "Fly Speed", Description = "",
        Default = 6, Min = 1, Max = 50, Rounding = 0,
        Callback = function(Value)
            speedofthefly = Value;
            speedofthevfly = Value;
        end;
    });
    AutoRandomFruit = Tabs.Fruit:AddToggle("AutoRandomFruit", {Title = "Auto Random Fruit", Default = Setting.AutoRandomFruit })
    AutoRandomFruit:OnChanged(function() Setting.AutoRandomFruit = Options.AutoRandomFruit.Value; end);
    FruitToSnipe = Tabs.Fruit:AddDropdown("FruitToSnipe", {Title = "FruitToSnipe", Values = FruitList, Multi = false, Default = 1,});
    FruitToSnipe:OnChanged(function(Value) Setting.FruitToSnipe = Value; end);
    AutoSnipeFruit = Tabs.Fruit:AddToggle("AutoSnipeFruit", {Title = "Auto Snipe Fruit", Default = Setting.AutoSnipeFruit })
    AutoSnipeFruit:OnChanged(function() Setting.AutoSnipeFruit = Options.AutoSnipeFruit.Value; end);
    FastAttack = Tabs.Players:AddToggle("FastAttack", {Title = "Fast Attack", Default = Setting.FastAttack });
	FastAttack:OnChanged(function() Setting.FastAttack = Options.FastAttack.Value; end);
    AutoBuso = Tabs.Players:AddToggle("AutoBuso", {Title = "Auto Buso Haki", Default = Setting.AutoBuso });
	AutoBuso:OnChanged(function() Setting.AutoBuso = Options.AutoBuso.Value; end);
    InfStamina = Tabs.Players:AddToggle("InfStamina", {Title = "Infinite Stamina", Default = Setting.InfStamina });
	InfStamina:OnChanged(function() Setting.InfStamina = Options.InfStamina.Value; end);
	Update = {["??/??/????"] = "Fixed?";["??/??/?????"] = "Fixed?\nMaybe?"};
	for i, v in pairs(Update) do
		Tabs.Update:AddParagraph({Title = i,Content = v});
	end;
	credits = {"Owner - sofia_z5z";"Co Owner - ttjy_";"UI - dawid";"Key system - Sally"};
	for i, v in pairs(credits) do
		Tabs.Credits:AddButton({Title = v, Description = "", Callback = function() end}); wait();
	end;
    Tabs.Settings:AddSection("Auto Farm Settings");
    Stackable = Tabs.Settings:AddToggle("Stackable", {Title = "Stackable", Default = Setting.Stackable }); Stackable:OnChanged(function() Setting.Stackable = Options.Stackable.Value; end);
    BringMob = Tabs.Settings:AddToggle("BringMob", {Title = "Bring Mob", Default = Setting.BringMob }); BringMob:OnChanged(function() Setting.BringMob = Options.BringMob.Value; end);
    NoQuest = Tabs.Settings:AddToggle("NoQuest", {Title = "No Quest", Default = Setting.NoQuest }); NoQuest:OnChanged(function() Setting.NoQuest = Options.NoQuest.Value; end);
    TeleportSpeedAutoFarm = Tabs.Settings:AddSlider("TeleportSpeedAutoFarm", {
        Title = "Teleport Speed", Description = "",
        Default = 3, Min = 1, Max = 10, Rounding = 0,
        Callback = function(Value)
            Setting.TeleportSpeedAutoFarm = Options.TeleportSpeedAutoFarm.Value;
        end;
    });
    AutoFarmPosX = Tabs.Settings:AddSlider("AutoFarmPosX", {
        Title = "Position X", Description = "",
        Default = 0, Min = 1, Max = 64, Rounding = 0,
        Callback = function(Value)
            Setting.AutoFarmPosX = Options.AutoFarmPosX.Value;
        end;
    });
    AutoFarmPosY = Tabs.Settings:AddSlider("AutoFarmPosY", {
        Title = "Position Y", Description = "",
        Default = 0, Min = 1, Max = 64, Rounding = 0,
        Callback = function(Value)
            Setting.AutoFarmPosY = Options.AutoFarmPosY.Value;
        end;
    });
    AutoFarmPosZ = Tabs.Settings:AddSlider("AutoFarmPosZ", {
        Title = "Position Z", Description = "",
        Default = 0, Min = 1, Max = 64, Rounding = 0,
        Callback = function(Value)
            Setting.AutoFarmPosZ = Options.AutoFarmPosZ.Value;
        end;
    });
    Tabs.Settings:AddSection("Bring Mob Settings");
    BringMobType = Tabs.Settings:AddDropdown("BringMobType", {
        Title = "Type",
        Values = {"Target", "Any"},
        Multi = false, Default = 1,
    });
    BringMobType:OnChanged(function(Value) Setting.BringMobType = Value; end);
    BringMobDistance = Tabs.Settings:AddSlider("BringMobDistance", {
        Title = "Distance",
        Description = "Bring Mob Distance",
        Default = 300, Min = 0, Max = 630, Rounding = 1,
        Callback = function(Value)
            Setting.BringMobDistance = tonumber(Value);
        end;
    });
    BringMobDistance:OnChanged(function(Value) Setting.BringMobDistance = tonumber(Value); end);
    Tabs.Settings:AddSection("Raid Setting");
    KillAuraDistance = Tabs.Settings:AddSlider("KillAuraDistance", {
        Title = "Distance",
        Description = "Kill Aura Distance",
        Default = 700, Min = 0, Max = 1500, Rounding = 1,
        Callback = function(Value)
            Setting.KillAuraDistance = tonumber(Value);
        end;
    });
    KillAuraDistance:OnChanged(function(Value) Setting.KillAuraDistance = tonumber(Value); end);
    Tabs.Settings:AddSection("Auto Chest Settings");
    AutoNormalChest = Tabs.Settings:AddToggle("AutoNormalChest", {Title = "Normal (Can be turn use with Detail)", Default = Setting.AutoNormalChest });
	AutoNormalChest:OnChanged(function() Setting.AutoNormalChest = Options.AutoNormalChest.Value; end);
    AutoDetailChest = Tabs.Settings:AddToggle("AutoDetailChest", {Title = "Detail (Can be turn use with Normal)", Default = Setting.AutoDetailChest });
	AutoDetailChest:OnChanged(function() Setting.AutoDetailChest = Options.AutoDetailChest.Value; end);
	InVisibility = Tabs.Settings:AddToggle("InVisibility", {Title = "Show/Hide", Default = true });
	InVisibility:OnChanged(function()
    	if Options.InVisibility.Value then
			c["InputPcToMobile"].W.Visible = false; c["InputPcToMobile"].A.Visible = false;
			c["InputPcToMobile"].S.Visible = false; c["InputPcToMobile"].D.Visible = false;
		else
			c["InputPcToMobile"].W.Visible = true; c["InputPcToMobile"].A.Visible = true;
			c["InputPcToMobile"].S.Visible = true; c["InputPcToMobile"].D.Visible = true;
		end;
    end);
	InPos = Tabs.Settings:AddToggle("InPos", {Title = "Up/Down", Default = true });
    InPos:OnChanged(function()
    	if Options.InPos.Value then
			c["InputPcToMobile"].W.Position = UDim2.new(0.05, 0, 0.1, 0); c["InputPcToMobile"].A.Position = UDim2.new(0, 0, 0.2, 0)
			c["InputPcToMobile"].S.Position = UDim2.new(0.05, 0, 0.3, 0); c["InputPcToMobile"].D.Position = UDim2.new(0.1, 0, 0.2, 0)
		else
			c["InputPcToMobile"].W.Position = UDim2.new(0.05, 0, 0.7, 0); c["InputPcToMobile"].A.Position = UDim2.new(0, 0, 0.8, 0)
			c["InputPcToMobile"].S.Position = UDim2.new(0.05, 0, 0.9, 0); c["InputPcToMobile"].D.Position = UDim2.new(0.1, 0, 0.8, 0)
		end;
    end);
	InSize = Tabs.Settings:AddToggle("InSize", {Title = "Big/Small", Default = false });
    InSize:OnChanged(function()
    	if Options.InSize.Value then
			c["InputPcToMobile"].W.Size = UDim2.new(0.1, 0, 0.1, 0); c["InputPcToMobile"].A.Size = UDim2.new(0.1, 0, 0.1, 0)
			c["InputPcToMobile"].S.Size = UDim2.new(0.1, 0, 0.1, 0); c["InputPcToMobile"].D.Size = UDim2.new(0.1, 0, 0.1, 0)
		else
			c["InputPcToMobile"].W.Size = UDim2.new(0.05, 0, 0.05, 0); c["InputPcToMobile"].A.Size = UDim2.new(0.05, 0, 0.05, 0)
			c["InputPcToMobile"].S.Size = UDim2.new(0.05, 0, 0.05, 0); c["InputPcToMobile"].D.Size = UDim2.new(0.05, 0, 0.05, 0)
		end;
    end);
    CurrentFluent = Window.Root.Parent
    Setting.GrabUIX = not Setting.GrabUIX;
    Tabs.Settings:AddSection("UI[X.Fluent] Settings");
    GrabUIX = Tabs.Settings:AddKeybind("GrabUIX", {
        Title = "Grab UI",
        Mode = "Toggle",
        Default = "M",
        Callback = function(Value)
            
        end,
        ChangedCallback = function(New)

        end;
    });
    GrabUIX:OnClick(function()
        Setting.GrabUIX = not Setting.GrabUIX;
        if Setting.GrabUIX and Window and Window.Root and Window.Root.Parent then
            pcall(function()
                for _, v in pairs(CurrentFluent:GetChildren()) do
                    if v:IsA("Frame") then
                        task.spawn(function()
                            v.Parent = a["KLOOOP"]["SurfaceGui"];
                        end);
                    end;
                end;
            end);
        else
            pcall(function()
                for _, v in pairs(a["KLOOOP"]["SurfaceGui"]:GetChildren()) do
                    if v:IsA("Frame") then
                        task.spawn(function()
                            v.Parent = CurrentFluent;
                        end);
                    end;
                end;
            end);
        end;
    end);
    GrabUIX:OnChanged(function() end);
    AlwaysOnTopX = Tabs.Settings:AddToggle("AlwaysOnTopX", {Title = "AlwaysOnTop", Default = Setting.AlwaysOnTopX });
    AlwaysOnTopX:OnChanged(function() 
        pcall(function()
            a["KLOOOP"]["SurfaceGui"].AlwaysOnTop = Options.AlwaysOnTopX.Value
        end);
    end);
    UIXLock = Tabs.Settings:AddToggle("UIXLock", {Title = "Unlock", Default = Setting.UIXLock });
    UIXLock:OnChanged(function() 
        pcall(function()
            Setting.UIXLock = Options.UIXLock.Value
            a["KLOOOP"].CanQuery = Options.UIXLock.Value
        end);
    end); warn("Process - UI F");
end; warn("Process - After S")
pcall(function()
    UIF:SetLibrary(Fluent);
    UIF:BuildInterfaceSection(Tabs.Settings);
end);
UI:Notify({Title = "Script"; Content = "Thanks for using TTJY Hub"; Duration = 8});

forcebreakendload = true;
Status.Text = "Finish";
task.wait(0.3);
game:GetService("CoreGui").Loader.Enabled = false;
getgenv().ReadyToLoad = true;
task.wait(3.6);
RunServiceWindow:Disconnect();
RunServiceWindow = nil;
Window.Minimized = true;
Window.Root.Visible = true;

local Converted = {
	["_TTJY ASSET"] = Instance.new("ScreenGui");
	["_TTJY HUB"] = Instance.new("Frame");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UICorner"] = Instance.new("UICorner");
	["_TextButton"] = Instance.new("TextButton");
	["_UIStroke1"] = Instance.new("UIStroke");
};
Converted["_TTJY ASSET"].IgnoreGuiInset = true;
Converted["_TTJY ASSET"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
Converted["_TTJY ASSET"].Name = "TTJY ASSET";
Converted["_TTJY ASSET"].Parent = game:GetService("CoreGui");
Converted["_TTJY HUB"].BackgroundColor3 = Color3.fromRGB(56.0000042617321, 56.0000042617321, 56.0000042617321);
Converted["_TTJY HUB"].BackgroundTransparency = 0.4000000059604645;
Converted["_TTJY HUB"].BorderColor3 = Color3.fromRGB(0, 0, 0);
Converted["_TTJY HUB"].BorderSizePixel = 0;
Converted["_TTJY HUB"].Position = UDim2.new(0.465000004, 0, 0, 0);
Converted["_TTJY HUB"].Size = UDim2.new(0.0700000003, 0, 0.03, 0);
Converted["_TTJY HUB"].ZIndex = 2;
Converted["_TTJY HUB"].Name = "TTJY HUB";
Converted["_TTJY HUB"].Parent = Converted["_TTJY ASSET"];
Converted["_UIStroke"].LineJoinMode = Enum.LineJoinMode.Bevel;
Converted["_UIStroke"].Thickness = 3;
Converted["_UIStroke"].Parent = Converted["_TTJY HUB"];
Converted["_UICorner"].Parent = Converted["_TTJY HUB"];
Converted["_TextButton"].Font = Enum.Font.SourceSans
Converted["_TextButton"].Text = "TTJY HUB";
Converted["_TextButton"].TextColor3 = Color3.fromRGB(0, 255, 0);
Converted["_TextButton"].TextScaled = true;
Converted["_TextButton"].TextSize = 14;
Converted["_TextButton"].TextWrapped = true;
Converted["_TextButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
Converted["_TextButton"].BackgroundTransparency = 1;
Converted["_TextButton"].BorderColor3 = Color3.fromRGB(0, 0, 0);
Converted["_TextButton"].BorderSizePixel = 0;
Converted["_TextButton"].Size = UDim2.new(1, 0, 1, 0);
Converted["_TextButton"].Parent = Converted["_TTJY HUB"];

Converted["_UIStroke1"].LineJoinMode = Enum.LineJoinMode.Bevel;
Converted["_UIStroke1"].Parent = Converted["_TextButton"];

pcall(function()
	if Window ~= nil then
		Window.Root:GetPropertyChangedSignal("Visible"):Connect(function()
			if Window and Window.Root and Window.Root.Visible then
				Converted["_TextButton"].TextColor3  = Color3.fromRGB(0, 255, 0);
			else
				Converted["_TextButton"].TextColor3  = Color3.fromRGB(255, 0, 0);
			end;
		end);
	end;
end);
pcall(function()
	Converted["_TextButton"].MouseButton1Click:Connect(function()
		if Window ~= nil then
			Window.Minimized = not Window.Minimized;
			Window.Root.Visible = not Window.Minimized;
		end;
	end);
end);
for _, v in pairs(Window.Root:GetChildren()) do
    if v:IsA("Frame") and v.Size == UDim2.new(0, 20, 0, 20) then
        local IMAGERS = Instance.new("ImageLabel");
        IMAGERS.Image = "rbxassetid://18260682345";
        IMAGERS.SizeConstraint = Enum.SizeConstraint.RelativeXX;
        IMAGERS.Size = UDim2.new(1, 0, 1, 0);
        IMAGERS.BackgroundTransparency = 1;
        IMAGERS.Parent = v;
        break;
    end;
end;
if allowtoserialized then
	serializedSetting = i:JSONEncode(Setting);
	writefile("Setting/BloxFruit.json", serializedSetting);
end;

local ProcessAutoFarmLevel, ProcessAutoFarmSelectMob, ProcessAutoFarmSelectBoss,
        ProcessAutoFarmAllBoss, AutoFarmAura,
        ProcessAutoSaber, ProcessAutoSaberQuest, ProcessAutoFactory,
        ProcessAutoRengoku

task.spawn(function()
    while task.wait() do
        if getgenv().LoadingProcess then break; end;
        if Setting.AutoFarmLevel and not Setting.AutoFarmSelectMob and not Setting.Stackable then
            pcall(function()
                TargetMobName = CheckLevel()[4]
                ProcessAutoFarmLevel = true;
                QuestTitle = selff.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
                if not string.find(QuestTitle, CheckLevel()[4]) and not Setting.Stackable then
                    CommF:InvokeServer("AbandonQuest");
                end;
                if not selff.PlayerGui.Main.Quest.Visible then
                    repeat task.wait(); Tp(CheckLevel()[5], tonumber(Setting.TeleportSpeedAutoFarm)); until dist(CheckLevel()[5].Position) <= 3 or not Setting.AutoFarmLevel
                    if dist(CheckLevel()[5].Position) <= 3 and Setting.AutoFarmLevel and not Setting.Stackable then
                        wait(1.2);
                        CommF:InvokeServer("StartQuest", CheckLevel()[2], CheckLevel()[3]);
                        wait(0.5);
                    end;
                end;
                task.wait(); print(a.Enemies:FindFirstChild(CheckLevel()[4]))
                if a.Enemies:FindFirstChild(CheckLevel()[4]) and not Setting.Stackable then
                    for i,v in pairs(a.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and selff.PlayerGui.Main.Quest.Visible and not Setting.Stackable then
                            if v.Name == CheckLevel()[4] and not Setting.Stackable then
                                if string.find(selff.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, CheckLevel()[4]) and not Setting.Stackable then
                                    repeat task.wait();                            
                                        Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                        SetHum(v);
                                    until not v or not Setting.AutoFarmLevel or v.Humanoid.Health <= 0 or not selff.PlayerGui.Main.Quest.Visible or Setting.Stackable
                                else
                                    CommF:InvokeServer("AbandonQuest");
                                end;
                            end;
                        end;
                    end;
                else
                    if e:FindFirstChild(CheckLevel()[4]) and not Setting.Stackable then
                        ProcessAutoFarmLevel = true;
                        Tp(e:FindFirstChild(CheckLevel()[4]):GetPivot() * CFrame.new(0, 35, 0), tonumber(Setting.TeleportSpeedAutoFarm));
                    else
                        if dist(CheckLevel()[5].Position) <= 15 and not Setting.Stackable then
                            ProcessAutoFarmLevel = true;
                            Tp(CheckLevel()[6] * CFrame.new(0,35,0), tonumber(Setting.TeleportSpeedAutoFarm));
                        end;
                    end;
                end;
            end);
            task.wait();
            ProcessAutoFarmLevel = false;
        end;
    end;
end);task.spawn(function()
    while task.wait() do
        if getgenv().LoadingProcess then break; end;
        if Setting.AutoFarmAura and not Setting.Stackable then
            pcall(function()
                ProcessAutoFarmAura = true;
                for i,v in pairs(a.Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and dist(v.HumanoidRootPart.Position) <= tonumber(Setting.AutoFarmAuraDistance) and not Setting.Stackable then
                        repeat task.wait(); TargetMobName = v.Name;                        
                            Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                            SetHum(v);
                        until not v or not Setting.AutoFarmAura or v.Humanoid.Health <= 0 or Setting.Stackable
                    end;
                end;
            end); task.wait();
            ProcessAutoFarmAura = false; 
        end;
    end;
end);task.spawn(function()
    while task.wait(0.3) do
        if Setting.AutoFarmSelectMob and not Setting.AutoFarmLevel and not Setting.Stackable then
            
        end;
    end;
end);task.spawn(function()
    while task.wait() do if getgenv().LoadingProcess then break; end;
        if Setting.AutoFarmSelectBoss and not Setting.Stackable then
            pcall(function()
                ProcessAutoFarmSelectBoss = true;
                if a.Enemies:FindFirstChild(Setting.SelectBoss) then
                    for i,v in pairs(a.Enemies:GetChildren()) do
                        if v.Name == Setting.SelectBoss and Setting.AutoFarmSelectBoss and not Setting.Stackable then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not Setting.Stackable then
                                repeat task.wait(); TargetMobName = v.Name;
                                    Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                    SetHum(v); sethiddenproperty(selff,"SimulationRadius",math.huge);
                                until not v or not Setting.AutoFarmSelectBoss or v.Humanoid.Health <= 0 or Setting.Stackable
                            end;
                        end;
                    end;
                else
                    if e:FindFirstChild(Setting.SelectBoss.SelectBoss) and not Setting.Stackable then
                        ProcessAutoFarmSelectBoss = true;
                        Tp(e:FindFirstChild(Setting.SelectBoss.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(0,35,0));
                    end;
                end;
            end); task.wait();
            ProcessAutoFarmSelectBoss = false;
        end;
    end;
end);task.spawn(function()
    while task.wait() do if getgenv().LoadingProcess then break; end;
        if Setting.AutoFarmAllBoss and not Setting.Stackable then
            ProcessAutoFarmAllBoss = true;
            if WorldCheck["First Sea"] then abvgwe234 = {"Saber Expert", "The Saw", "Greybeard", "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg"};
            elseif WorldCheck["Second Sea"] then abvgwe234 = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"};
            elseif WorldCheck["Third Sea"] then abvgwe234 = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}; end;
            pcall(function()
                for _, v in pairs(a.Enemies:GetChildren()) do
                    if table.find(abvgwe234, v.Name) then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not Setting.Stackable then
                            repeat task.wait(); TargetMobName = v.Name;
                                Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                SetHum(v); sethiddenproperty(selff,"SimulationRadius",math.huge);
                            until not v or not Setting.AutoFarmSelectBoss or v.Humanoid.Health <= 0 or Setting.Stackable
                        end;
                    end;
                end;
            end); task.wait();
            pcall(function()
                for _, v in pairs(e:GetChildren()) do
                    if table.find(abvgwe234, v.Name) then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not Setting.Stackable then
                            repeat task.wait();
                                Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                SetHum(v);
                                sethiddenproperty(selff,"SimulationRadius",math.huge);
                            until not v or not Setting.AutoFarmSelectBoss or v.Humanoid.Health <= 0 or Setting.Stackable
                        end;
                    end;
                end;
            end);
        end;task.wait();
        ProcessAutoFarmAllBoss = false;
    end;
end);task.spawn(function()
    while task.wait(0.003) do
        if Setting.MeleeStats then pcall(function() CommF:InvokeServer("AddPoint", "Melee", tonumber(Setting.StatsValue)); end); end;
        if Setting.DefenseStats then pcall(function() CommF:InvokeServer("AddPoint", "Defense", tonumber(Setting.StatsValue)); end); end;
        if Setting.SwordStats then pcall(function() CommF:InvokeServer("AddPoint", "Sword", tonumber(Setting.StatsValue)); end); end;
        if Setting.GunStats then pcall(function() CommF:InvokeServer("AddPoint", "Gun", tonumber(Setting.StatsValue)); end); end;
        if Setting.BloxFruitStats then pcall(function() CommF:InvokeServer("AddPoint", "Demon Fruit", tonumber(Setting.StatsValue)); end); end;
    end;
end);task.spawn(function()
    while task.wait() do
        if getgenv().LoadingProcess then break; end;
        if Setting.AutoRandomFruit then
            pcall(function() RandomFruit(); end);
        end;
        if Setting.AutoSnipeFruit then
            pcall(function() SnipeFruit(); end);
        end;
        if Setting.AutoStoreSelectFruit then
            pcall(function() StoreFruit(); end);
        end; task.wait();
        NeedKillAura = Setting.KillAura;
        NeedAttacking = Setting.AutoFarmLevel or Setting.AutoFarmSelectMob or Setting.AutoFarmSelectBoss or Setting.AutoSaber;
        if NeedAttacking then pcall(function() EquipWeapon(Setting.SelectWeapon); end); end;
    end;
end);task.spawn(function()
    InfiniteC = nil;
    while task.wait(1) do
        if getgenv().LoadingProcess then
            if InfiniteC ~= nil then
                InfiniteC:Disconnect(); InfiniteC = nil;
            end;
            break;
        end;
        if Setting.AutoBuso then pcall(function() Buso(); end); end;
        if Setting.InfStamina then pcall(function() if InfiniteC == nil then StaminaV = selff.Character.Energy.Value; InfiniteC = selff.Character.Energy:GetPropertyChangedSignal("Value"):Connect(function() selff.Character.Energy.Value = StaminaV; end); end; end); else pcall(function() if InfiniteC ~= nil then InfiniteC:Disconnect(); InfiniteC = nil; end; end); end;
        if Setting.AutoLegendarySword and WorldCheck["Second Sea"] then
            pcall(function()
                BuyI("LegendarySwordDealer","1"); BuyI("LegendarySwordDealer","2"); BuyI("LegendarySwordDealer","3");
                if Setting.AutoLegendarySwordHop and Setting.AutoLegendarySword and not Setting.Stackable then
                    task.wait(3); Hop();
                end;
            end);
        end;
        if Setting.AutoEnchancementColor and not WorldCheck["First Sea"] then
            pcall(function()
                BuyI("ColorsDealer","1"); BuyI("ColorsDealer","2"); BuyI("ColorsDealer","3");
                if Setting.AutoEnchancementColorHop and Setting.AutoEnchancementColor and not Setting.Stackable then
                    task.wait(3); Hop();
                end;
            end);
        end;
    end;
end);task.spawn(function()
    while task.wait() do
        if getgenv().LoadingProcess then break; end;
        if Setting.KillAura then
            pcall(function()
                for _, v in pairs(a.Enemies:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and dist(v.HumanoidRootPart.Position) < tonumber(Setting.KillAuraDistance) then
                        v.Humanoid.Health = 0;
                    end;
                end;
            end);
        end;
    end;
end);task.spawn(function() FirstMobTarget = nil;
    while task.wait() do
        if getgenv().LoadingProcess then break; end;
        if Setting.BringMobType == "Target" then
            if FirstMobTarget == nil or (FirstMobTarget ~= nil and (not FirstMobTarget.Parent or not FirstMobTarget:FindFirstChild("HumanoidRootPart"))) then
                pcall(function()
                    for _, v in pairs(a.Enemies:GetChildren()) do
                        if v:IsA("Model") and v.Name == tostring(TargetMobName) and v:FindFirstChild("HumanoidRootPart") and dist(v.HumanoidRootPart.Position) <= Setting.BringMobDistance then
                            FirstMobTarget = v;
                        end;
                    end;
                end);
            else
                pcall(function()
                    for _, v in pairs(a.Enemies:GetChildren()) do
                        if v:IsA("Model") and v.Name == tostring(TargetMobName) and v:FindFirstChild("HumanoidRootPart") and dist(v.HumanoidRootPart.Position) <= Setting.BringMobDistance and FirstMobTarget:FindFirstChild("HumanoidRootPart") then
                            v.HumanoidRootPart.CFrame = FirstMobTarget.HumanoidRootPart.Position
                            SetHum(v)
                        end;
                    end;
                end);
            end;
        elseif Setting.BringMobType == "Any" then
            if FirstMobTarget == nil or (FirstMobTarget ~= nil and (not FirstMobTarget.Parent or not FirstMobTarget:FindFirstChild("HumanoidRootPart"))) then
                pcall(function()
                    for _, v in pairs(a.Enemies:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and dist(v.HumanoidRootPart.Position) <= Setting.BringMobDistance then
                            FirstMobTarget = v;
                        end;
                    end;
                end);
            else
                pcall(function()
                    for _, v in pairs(a.Enemies:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and dist(v.HumanoidRootPart.Position) <= Setting.BringMobDistance and FirstMobTarget:FindFirstChild("HumanoidRootPart") then
                            v.HumanoidRootPart.CFrame = FirstMobTarget.HumanoidRootPart.Position
                            SetHum(v)
                        end;
                    end;
                end);
            end;
        end;
    end;
end);

if WorldCheck["First Sea"] then
    task.spawn(function()
        while task.wait() do
            if Setting.AutoSaber and not Setting.Stackable then
                if a.Enemies:FindFirstChild("Saber Expert") and not Setting.Stackable then
                    pcall(function()
                        ProcessAutoSaber = true;
                        for i,v in pairs(a.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert" and not Setting.Stackable then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and Setting.AutoSaber and not Setting.Stackable then
                                    repeat task.wait(); TargetMobName = v.Name;
                                        Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                        SetHum(v); sethiddenproperty(selff,"SimulationRadius",math.huge);
                                    until not v or not Setting.AutoSaber or v.Humanoid.Health <= 0 or Setting.Stackable
                                end;
                            end;
                        end;
                    end);
                    ProcessAutoSaber = false;  
                else
                    pcall(function()
                        if e:FindFirstChild("Saber Expert") and not Setting.Stackable then
                            ProcessAutoSaber = true;
                            Tp(e:FindFirstChild("Saber Expert").HumanoidRootPart.CFrame * CFrame.new(0,35,0), tonumber(Setting.TeleportSpeedAutoFarm));
                        else
                            if Setting.AutoSaberHop and not Setting.Stackable then
                                task.wait(3);
                                if (not e:FindFirstChild("Saber Expert") or not a.Enemies:FindFirstChild("Saber Expert")) and Setting.AutoSaberHop and not Setting.Stackable then
                                    Hop();
                                end;
                            end;
                        end;
                    end);
                end;
            end;task.wait();
            ProcessAutoSaber = false;
        end;
    end);
    task.spawn(function()
        if a.Map.Jungle.Final:FindFirstChild("Part").Transparency ~= 0 then
            while task.wait() do
                if a.Map.Jungle.Final:FindFirstChild("Part").Transparency == 0 then break; end;
                if Setting.AutoSaberQuest and not Setting.Stackable then
                    pcall(function()
                        ProcessAutoSaberQuest = true;
                        Tp(CFrame.new(-1421.6824951171875, 48.252071380615234, 21.318946838378906), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5);
                        Tp(CFrame.new(-1181.1640625, 22.34051513671875, 188.13186645507812), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5);
                        Tp(CFrame.new(-1648.1024169921875, 23.252126693725586, 438.4625549316406), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5);
                        Tp(CFrame.new(-1153.3184814453125, 2.464047908782959, -701.0916748046875), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5);
                        Tp(CFrame.new(-1325.6697998046875, 34.64987564086914, -463.0443420410156), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.7);
                        Tp(CFrame.new(-1610.5228271484375, 12.052069664001465, 162.6676025390625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.6);
                        EquipWeapon("Torch"); task.wait(0.5);
                        Tp(CFrame.new(1115.79688, 4.92147732, 4350.17334), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(6.5);
                        Tp(CFrame.new(1113.51929, 5.50669432, 4365.20752), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5);
                        EquipWeapon("Cup"); task.wait(0.8);
                        Tp(CFrame.new(1392.83411, 37.3479347, -1323.19702), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(5);
                        Tp(CFrame.new(1458.23046875, 88.25215911865234, -1389.040283203125), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2);
                        CommF:InvokeServer("ProQuestProgress", "SickMan"); task.wait(0.6);
                        Tp(CFrame.new(-908.8209838867188, 13.752044677734375, 4078.2666015625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2);
                        CommF:InvokeServer("ProQuestProgress", "RichSon"); task.wait(0.5);
                        Tp(CFrame.new(-2850.20068, 7.39224768, 5354.99268), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1);
                        repeat task.wait(); until a.Enemies:FindFirstChild("Mob Leader") or not Setting.AutoSaberQuest
                        if not Setting.AutoSaberQuest then
                            repeat task.wait(); until Setting.AutoSaberQuest
                        end;
                        if a.Enemies:FindFirstChild("Mob Leader") and a.Map.Jungle.Final:FindFirstChild("Part").Transparency ~= 0 then
                            for i,v in pairs(a.Enemies:GetChildren()) do
                                if v.Name == "Mob Leader" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait(); TargetMobName = v.Name;
                                            Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                            SetHum(v); sethiddenproperty(selff, "SimulationRadius", math.huge);
                                        until not v or not Setting.AutoSaberQuest or v.Humanoid.Health <= 0
                                    end;
                                end;
                            end;
                        end; task.wait(0.6);
                        Tp(CFrame.new(-908.8209838867188, 13.752044677734375, 4078.2666015625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2);
                        CommF:InvokeServer("ProQuestProgress","RichSon"); task.wait(1.1);
                        CommF:InvokeServer("ProQuestProgress"); task.wait(0.5); EquipWeapon("Relic");
                        Tp(CFrame.new(-1405.82397, 29.8520069, 5.05986547), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.3);
                        selff.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.82397, 29.8520069, 5.05986547, 0.759286761, 4.36840342e-09, 0.65075618, 9.78191306e-09, 1, -1.81261139e-08, -0.65075618, 2.01285584e-08, 0.759286761);
                    end); task.wait();
                    ProcessAutoSaberQuest = false;
                end;
            end;
        end;
    end);
elseif WorldCheck["Second Sea"] then
    task.spawn(function()
        while task.wait() do if getgenv().LoadingProcess then break; end;
            if Setting.AutoFactory and not Setting.Stackable then
                if a.Enemies:FindFirstChild("Core") then
                    pcall(function()
                        ProcessAutoFactory = true;
                        for i,v in pairs(a.Enemies:GetChildren()) do
                            if v.Name == "Core" and v.Humanoid.Health > 0 and Setting.AutoFactory and not Setting.Stackable then
                                repeat task.wait();
                                    Tp(CFrame.new(448.46756, 199.356781, -441.389252), tonumber(Setting.TeleportSpeedAutoFarm));                           
                                until not v or v.Humanoid.Health <= 0 or not Setting.AutoFactory or Setting.Stackable
                            end;
                        end;
                    end);
                else
                    pcall(function()
                        ProcessAutoFactory = true;
                        if e:FindFirstChild("Core") and Setting.AutoFactory then
                            Tp(CFrame.new(448.46756, 199.356781, -441.389252), tonumber(Setting.TeleportSpeedAutoFarm));
                        else
                            if Setting.AutoFactoryHop and not Setting.Stackable then
                                task.wait(3);
                                if (not e:FindFirstChild("Core") or not a.Enemies:FindFirstChild("Core")) and Setting.AutoFactoryHop and not Setting.Stackable then
                                    Hop();
                                end;
                            end;  
                        end;
                    end);
                end;
            end; task.wait();
            ProcessAutoFactory = false;
        end;
    end);task.spawn(function() FFlagRengoku = false;
        while task.wait() do 
            if getgenv().LoadingProcess then 
                break; 
            end;
            pcall(function() 
                if getInventory("Rengoku", "Check") then 
                    FFlagRengoku = true; 
                end; 
            end); if FFlagRengoku then break; end;
            if Setting.AutoRengoku and not Setting.Stackable then
                pcall(function()
                    ProcessAutoRengoku = true;
                    if not getInventory("Rengoku", "Check") then
                        if selff.Backpack:FindFirstChild("Hidden Key") or selff.Character:FindFirstChild("Hidden Key") then
                            EquipWeapon("Hidden Key");
                            Tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875), tonumber(Setting.TeleportSpeedAutoFarm));
                        else 
                            if a.Enemies:FindFirstChild("Snow Lurker") or a.Enemies:FindFirstChild("Arctic Warrior") then
                                for i,v in pairs(a.Enemies:GetChildren()) do
                                    if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 and not Setting.Stackable then
                                        repeat task.wait();
                                            Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm));
                                            SetHum(v);
                                        until not v or selff.Backpack:FindFirstChild("Hidden Key") or not Setting.AutoRengoku or v.Humanoid.Health <= 0 or getInventory("Rengoku", "Check") or Setting.Stackable
                                    end;
                                end;
                            else
                                if e:FindFirstChild("Snow Lurker") and not Setting.Stackable then
                                    Tp(e:FindFirstChild("Snow Lurker").HumanoidRootPart.CFrame * CFrame.new(0,35,0));
                                else
                                    if e:FindFirstChild("Arctic Warrior") and not Setting.Stackable then
                                        Tp(e:FindFirstChild("Arctic Warrior").HumanoidRootPart.CFrame * CFrame.new(0,35,0));
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
            end;task.wait();
            ProcessAutoRengoku = false;
        end;
    end);task.spawn(function()
        while task.wait() do if getgenv().LoadingProcess then break; end;
            if Setting.AutoEctoplasm and not Setting.Stackable then
                pcall(function()
                    ProcessAutoEctoplasm = true;
                    if a.Enemies:FindFirstChild("Ship Deckhand") or a.Enemies:FindFirstChild("Ship Engineer") or a.Enemies:FindFirstChild("Ship Steward") or a.Enemies:FindFirstChild("Ship Officer") then
                        for i,v in pairs(a.Enemies:GetChildren()) do
                            if string.find(v.Name, "Ship") and not Setting.Stackable then
                                repeat task.wait(); TargetMobName = v.Name; SetHum(v); Tp(v.HumanoidRootPart.CFrame * CFrame.new(0,35,0), tonumber(Setting.TeleportSpeedAutoFarm)); until not v or not Setting.AutoEctoplasm or v.Humanoid.Health <= 0 or Setting.Stackable
                            end;
                        end;
                    else
                        if dist(Vector3.new(911.35827636719, 125.95812988281, 33159.5390625)) > 18000 and not Setting.Stackable then CommF:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)); end; task.wait(0.5);
                        Tp(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625), tonumber(Setting.TeleportSpeedAutoFarm));
                    end;
                end);
            end; task.wait();
            ProcessAutoEctoplasm = false;
        end;
    end);task.spawn(function()
        while task.wait() do if getgenv().LoadingProcess then break; end;
            if Setting.TeleportToNextIsland and not Setting.Stackable then
                ProcessTeleportToNextIsland = true;
                pcall(function()
                    if a._WorldOrigin.Locations:FindFirstChild("Island 5") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 4") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 3") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 2") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 1") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    end;
                end);
            end;task.wait(); ProcessTeleportToNextIsland = false;
        end;
    end);
end;task.spawn(function()
    while task.wait() do if getgenv().LoadingProcess then break; end;
        if Setting.AutoRaid and not Setting.Stackable then
            pcall(function()
                ProcessAutoRaid = true;
                if not selff.PlayerGui.Main.Timer.Visible and (not a._WorldOrigin.Locations:FindFirstChild("Island 1") or (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) > 6700)) then
                    if (not selff.Backpack:FindFirstChild("Special Microchip") or not selff.Character:FindFirstChild("Special Microchip")) and (not a._WorldOrigin.Locations:FindFirstChild("Island 1") or (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) > 6700)) then
                        if not a._WorldOrigin.Locations:FindFirstChild("Island 1") or (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) > 6700) then
                            CommF:InvokeServer("RaidsNpc", "Select", tostring(Setting.SelectedRaid2));
                        end;
                    end; task.wait();
                    if not selff.Main.Timer.Visible and (not a._WorldOrigin.Locations:FindFirstChild("Island 1") or (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) > 6700)) then
                        if WorldCheck["Second Sea"] then
                            fireclickdetector(a.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
                        elseif WorldCheck["Third Sea"] then
                            fireclickdetector(a.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
                        end;
                    end;
                    repeat task.wait(); until (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) <= 6700) or not Setting.AutoRaid or Setting.Stackable
                    if a._WorldOrigin.Locations:FindFirstChild("Island 5") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 4") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 3") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 2") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 1") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    end;
                else
                    repeat task.wait(); until (a._WorldOrigin.Locations:FindFirstChild("Island 1") and dist(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.Position) <= 6700 and selff.PlayerGui.Main.Timer.Visible) or not Setting.AutoRaid or not Setting.Stackable
                    if a._WorldOrigin.Locations:FindFirstChild("Island 5") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 4") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 3") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 2") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    elseif a._WorldOrigin.Locations:FindFirstChild("Island 1") then
                        Tp(a._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0 + tonumber(Setting.AutoRaidPosX), 25 + tonumber(Setting.AutoRaidPosY), 0 + tonumber(Setting.AutoRaidPosZ)), tonumber(Setting.TeleportToNEXTIslandSpeed));
                    end;
                end;
            end);
        end;task.wait();
        ProcessAutoRaid = false;
    end;
end);

task.spawn(function()
    while task.wait() do
        repeat task.wait();
            Process = false;
        until not Process
        if Setting.Stackable then
            if Setting.AutoFarmSelectBoss then
                if CheckBoss() then
                    KillBoss();
                end;
            end; task.wait();
            if Setting.AutoFarmAllBoss then
                if AllBossCheck() then
                    repeat task.wait();
                        KillAllBoss();
                    until not AllBossCheck()
                end;
            end; task.wait();
            if WorldCheck["First Sea"] then
                if Setting.AutoSaber then
                    KillTargetBoss("Saber Expert", "AutoSaber");
                end; task.wait();
                if Setting.AutoSaberQuest then
                    pcall(function()
                        if a.Map.Jungle.Final:FindFirstChild("Part").Transparency == 0 then
                            pcall(function() Tp(CFrame.new(-1421.6824951171875, 48.252071380615234, 21.318946838378906), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5); Tp(CFrame.new(-1181.1640625, 22.34051513671875, 188.13186645507812), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5); Tp(CFrame.new(-1648.1024169921875, 23.252126693725586, 438.4625549316406), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5); Tp(CFrame.new(-1153.3184814453125, 2.464047908782959, -701.0916748046875), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5); Tp(CFrame.new(-1325.6697998046875, 34.64987564086914, -463.0443420410156), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.7); Tp(CFrame.new(-1610.5228271484375, 12.052069664001465, 162.6676025390625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.6); EquipWeapon("Torch"); task.wait(0.5); Tp(CFrame.new(1115.79688, 4.92147732, 4350.17334), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(6.5); Tp(CFrame.new(1113.51929, 5.50669432, 4365.20752), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.5); EquipWeapon("Cup"); task.wait(0.8); Tp(CFrame.new(1392.83411, 37.3479347, -1323.19702), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(5); Tp(CFrame.new(1458.23046875, 88.25215911865234, -1389.040283203125), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2); CommF:InvokeServer("ProQuestProgress", "SickMan"); task.wait(0.6); Tp(CFrame.new(-908.8209838867188, 13.752044677734375, 4078.2666015625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2); CommF:InvokeServer("ProQuestProgress", "RichSon"); task.wait(0.5); Tp(CFrame.new(-2850.20068, 7.39224768, 5354.99268), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1); repeat task.wait(); until a.Enemies:FindFirstChild("Mob Leader") or not Setting.AutoSaberQuest if not Setting.AutoSaberQuest then repeat task.wait(); until Setting.AutoSaberQuest end; if a.Enemies:FindFirstChild("Mob Leader") and a.Map.Jungle.Final:FindFirstChild("Part").Transparency ~= 0 then for i,v in pairs(a.Enemies:GetChildren()) do if v.Name == "Mob Leader" then if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then repeat task.wait(); Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm)); SetHum(v); sethiddenproperty(selff, "SimulationRadius", math.huge); until not v or not Setting.AutoSaberQuest or v.Humanoid.Health <= 0 end; end; end; end; task.wait(0.6); Tp(CFrame.new(-908.8209838867188, 13.752044677734375, 4078.2666015625), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(1.2); CommF:InvokeServer("ProQuestProgress","RichSon"); task.wait(1.1); CommF:InvokeServer("ProQuestProgress"); task.wait(0.5); EquipWeapon("Relic"); Tp(CFrame.new(-1405.82397, 29.8520069, 5.05986547), tonumber(Setting.TeleportSpeedAutoFarm)); task.wait(0.3); selff.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.82397, 29.8520069, 5.05986547, 0.759286761, 4.36840342e-09, 0.65075618, 9.78191306e-09, 1, -1.81261139e-08, -0.65075618, 2.01285584e-08, 0.759286761); end);
                        end;
                    end);
                end;
            elseif WorldCheck["Second Sea"] then
                if Setting.AutoFactory then
                    if a.Enemies:FindFirstChild("Core") then
                        pcall(function() for i,v in pairs(a.Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 and Setting.AutoFactory and Setting.Stackable then
                                    repeat task.wait(); 
                                        Tp(CFrame.new(448.46756, 199.356781, -441.389252), tonumber(Setting.TeleportSpeedAutoFarm));                           
                                    until not v or v.Humanoid.Health <= 0 or not Setting.AutoFactory or not Setting.Stackable
                                end; end; end);
                    elseif e:FindFirstChild("Core") then
                        pcall(function() if e:FindFirstChild("Core") and Setting.AutoFactory then Tp(CFrame.new(448.46756, 199.356781, -441.389252), tonumber(Setting.TeleportSpeedAutoFarm)); end;
                            repeat task.wait(); until a.Enemies:FindFirstChild("Core") or (not a.Enemies:FindFirstChild("Core") and not e:FindFirstChild("Core")) or not Setting.Stackable or not Setting.AutoFactory
                            for i,v in pairs(a.Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 and Setting.AutoFactory and Setting.Stackable then
                                    repeat task.wait(); 
                                        Tp(CFrame.new(448.46756, 199.356781, -441.389252), tonumber(Setting.TeleportSpeedAutoFarm));                           
                                    until not v or v.Humanoid.Health <= 0 or not Setting.AutoFactory or not Setting.Stackable
                                end; end; end);end; end; task.wait();
                if Setting.AutoRengoku and not getInventory("Rengoku", "Check") then
                    while task.wait() do
                        if getInventory("Rengoku", "Check") or getgenv().LoadingProcess or not Setting.Stackable then break; end;
                        pcall(function()
                            if not getInventory("Rengoku", "Check") then
                                if (selff.Backpack:FindFirstChild("Hidden Key") or selff.Character:FindFirstChild("Hidden Key")) and Setting.Stackable then EquipWeapon("Hidden Key"); Tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875), tonumber(Setting.TeleportSpeedAutoFarm));
                                else if a.Enemies:FindFirstChild("Snow Lurker") or a.Enemies:FindFirstChild("Arctic Warrior") then
                                    for i,v in pairs(a.Enemies:GetChildren()) do
                                        if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 and Setting.Stackable then repeat task.wait(); Tp(v.HumanoidRootPart.CFrame * CFrame.new(tonumber(Setting.AutoFarmPosX), tonumber(Setting.AutoFarmPosY), tonumber(Setting.AutoFarmPosZ)), tonumber(Setting.TeleportSpeedAutoFarm)); SetHum(v); until not v or selff.Backpack:FindFirstChild("Hidden Key") or not Setting.AutoRengoku or v.Humanoid.Health <= 0 or getInventory("Rengoku", "Check") or not Setting.Stackable end;
                                    end; else if e:FindFirstChild("Snow Lurker") and Setting.Stackable then Tp(e:FindFirstChild("Snow Lurker").HumanoidRootPart.CFrame * CFrame.new(0,35,0)); else if e:FindFirstChild("Arctic Warrior") and Setting.Stackable then Tp(e:FindFirstChild("Arctic Warrior").HumanoidRootPart.CFrame * CFrame.new(0,35,0)); end; end; end;
                                end;
                            end;
                        end);
                    end;
                end;
            end; task.wait();
        end;
    end;
end);
warn("Process - After F")
warn("Process - UIX S")
local dfff = game:GetService("RunService");
local dffff = game:GetService("Players");
local dfffffff = dffff.LocalPlayer;
local OKWIDAAADWOD = nil;
task.spawn(function()
    repeat
        OKWIDAAADWOD = CurrentFluent:FindFirstChild("CanvasGroup", true); wait();
    until OKWIDAAADWOD ~= nil
end);
local OADFWAN = nil
while task.wait() do
    if getgenv().LoadingProcess then
        if OADFWAN ~= nil then
            OADFWAN:Disconnect();
            OADFWAN = nil;
        end;
        break;
    end;
    pcall(function()
        task.wait(0.3)
        if OKWIDAAADWOD.Parent.Parent.Name == "SurfaceGui" then
            OKWIDAAADWOD.GroupTransparency = 1;
        end;
    end);
    if not workspace:FindFirstChild("KLOOOP") then
        afawdwadwaddw = dfffffff.Character or dfffffff.CharacterAdded:Wait();
        awdwadawdadawd = afawdwadwaddw:WaitForChild("HumanoidRootPart");
        local ejfjewfoiewfnewofn = Instance.new("Part");
        ejfjewfoiewfnewofn.Name = "KLOOOP"
        ejfjewfoiewfnewofn.Size = Vector3.new(10, 10, 0);
        ejfjewfoiewfnewofn.Anchored = true;
        ejfjewfoiewfnewofn.CanTouch = false;
        ejfjewfoiewfnewofn.CanCollide = false;
        ejfjewfoiewfnewofn.CanQuery = Setting.UIXLock;
        ejfjewfoiewfnewofn.Transparency = 1;
        ejfjewfoiewfnewofn.Parent = a;
        local surfaceGui = Instance.new("SurfaceGui");
        surfaceGui.Adornee = ejfjewfoiewfnewofn;
        surfaceGui.AlwaysOnTop = true;
        surfaceGui.Parent = ejfjewfoiewfnewofn;
        OADFWAN = dfff.Heartbeat:Connect(function()
            if getgenv().LoadingProcess and OADFWAN ~= nil then
                OADFWAN:Disconnect();
                OADFWAN = nil;
            end;
            if not ejfjewfoiewfnewofn then
                OADFWAN:Disconnect();
                OADFWAN = nil;
            end;
            oefwkmoewmofwmoe = awdwadawdadawd.CFrame.LookVector;
            ewfewgergwfwefew = awdwadawdadawd.Position - (oefwkmoewmofwmoe * 10);
            ejfjewfoiewfnewofn.CFrame = CFrame.new(ewfewgergwfwefew, awdwadawdadawd.Position);
        end);
    end;
end; warn("Process - UIX F")
