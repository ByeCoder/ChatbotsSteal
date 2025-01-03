--Written By: @ByeCoder
local DataBase = require("./libs/redis")
local tdbot = require 'tdbot'
-- local BOT = ADVERTISER-ID
local function sendact(extra, result)
  tdbot.sendChatAction(extra.chat, 'Typing',1000)
end
local function viewmsg(extra, result)
  tdbot_function ({["@type"] = "openChat",chat_id = extra.chat},dl_cb, nil)
  tdbot_function ({["@type"] = "viewMessages",chat_id = extra.chat,message_ids = {[0] = extra.id}}, dl_cb, nil)
end
local function vardump(value, depth, key) local linePrefix = "" local spaces = "" if key ~= nil then linePrefix = "["..key.."] = " end if depth == nil then depth = 0 else depth = depth + 1 for i=1, depth do spaces = spaces .. " " end end if type(value) == 'table' then mTable = getmetatable(value) if mTable == nil then print(spaces ..linePrefix.."(table) ") else print(spaces .."(metatable) ") value = mTable end for tableKey, tableValue in pairs(value) do vardump(tableValue, depth, tableKey) end elseif type(value) == 'function' or type(value) == 'thread' or type(value) == 'userdata' or value == nil then print(spaces..tostring(value)) else print(spaces..linePrefix.."("..type(value)..") "..tostring(value)) end end 
local function sendpv(extra)
  if extra.text then
    if extra.text:match("document") then
      tdbot.sendDocument(extra.chat,extra.msgid,"/"..extra.text:match("document /(.*)"),"",'html')
    elseif extra.text:match("gif") then
      tdbot.sendAnimation(extra.chat,extra.msgid, "/"..extra.text:match("gif /(.*)"),"", 'md')
    elseif extra.text:match("photo") then
      tdbot.sendPhoto(extra.chat,extra.msgid,  "/"..extra.text:match("photo /(.*)"),"", 'md')
    elseif extra.text:match("fnote") then
      tdbot.sendVideoNote(extra.chat,extra.msgid, "/"..extra.text:match("fnote /(.*)"))
    elseif extra.text:match("sticker") then
      tdbot.sendSticker(extra.chat,extra.msgid,extra.text:match("sticker (.*)"))
    elseif extra.text:match("voice") then
      tdbot.sendChatAction(extra.chat, 'RecordingVoiceNote',500)
      tdbot.sendChatAction(extra.chat, 'UploadingVoiceNote',500)
      tdbot.sendVoiceNote(extra.chat,extra.msgid, "/"..extra.text:match("voice /(.*)"),'', 'html')
    else
      tdbot.sendChatAction(extra.chat, 'Typing',1000)
      tdbot.sendText(extra.chat,extra.msgid,extra.text, 'html', 1)
      --SendMsg(extra.chat,extra.msgid,extra.text)
    end
  end
end
local function SendMsg(chat_id, msg_id, text)
  tdbot_function ({
    ["@type"] = "sendMessage",
    chat_id = chat_id,
    reply_to_message_id = msg_id,
    disable_notification = true,
    from_background = false,
    reply_markup = nil,
    input_message_content = {
      ["@type"] = "inputMessageText",
      text= {["@type"]="formattedText", text = text, entities = {}},
      disable_web_page_preview = false,
      clear_draft = true
    },
  },dl_cb, nil)
end
local function dl_cb(arg, data)
end
function tdbot_update_callback(data)
    if data["@type"] == "updateNewMessage" then
    local msg = data.message
    if msg.content["@type"] == "messageText" then

      local text = msg.content.text.text
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
-- if msg.reply_markup then 
-- math.randomseed(BOT+os.time())
-- SendMsg(msg.chat_id,0,msg.reply_markup.rows[0][math.random(0,tablelength(msg.reply_markup.rows[0])-1)].text)
-- end
	  			
            if DataBase:get(BOT.."SendApp") and msg.chat_id == msg.sender.user_id then
			-- print((DataBase:get(BOT .. msg.chat_id.."step") or "0").."=====================================================================================")
		   if not DataBase:get(BOT .. msg.chat_id.."step") then 
			tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 30
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 31
          }, sendpv, {chat=msg.sender.user_id,text="fnote /root/1.mp4" ,msgid=0})
		  -- return DataBase:set(BOT .. msg.chat_id.."step",2)
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "2" then 
		  				          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 380
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 381
          }, sendpv, {chat=msg.sender.user_id,text="fnote /root/2.mp4",msgid=0})
		  	 		-- return  DataBase:set(BOT .. msg.chat_id.."step",3)

		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "3" then 
		  				          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 410
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 411
          }, sendpv, {chat=msg.sender.user_id,text="voice /root/1.ogg",msgid=0})
		  -- return DataBase:set(BOT .. msg.chat_id.."step",4)		 
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "4" then 
		  	tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 440
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 441
          }, sendpv, {chat=msg.sender.user_id,text="document /root/chat.apk",msgid=0})
		-- return  DataBase:set(BOT .. msg.chat_id.."step",5)		
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "5" then 
		  	 tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 500
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 501
          }, sendpv, {chat=msg.sender.user_id,text=[[اینه برنامش 🙄 ایدیمم توش dokhitanha1488
راستی اگه نتونستی با فایل بالا نصبش کنی با این لینک نصبش کن . 
yun.ir/5wuik]],msgid=0})
		 -- return DataBase:set(BOT .. msg.chat_id.."step",6)		
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "6" then 
		  				          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 530
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 531
          }, sendpv, {chat=msg.sender.user_id,text="voice /root/2.ogg",msgid=0})
		-- return  DataBase:set(BOT .. msg.chat_id.."step",7)		
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "7" then 
		    tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 550
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 551
          }, sendpv, {chat=msg.sender.user_id,text="voice /root/3.ogg",msgid=0})
		-- return  DataBase:set(BOT .. msg.chat_id.."step",8)		
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "8" then 
		  	 tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 580
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 581
          }, sendpv, {chat=msg.sender.user_id,text=[[فعلا 😁]],msgid=0})
		-- return  DataBase:set(BOT .. msg.chat_id.."step",9) 
		  -- elseif DataBase:get(BOT .. msg.chat_id.."step") == "9" then 
		  	 tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 2000
          }, sendact, {chat=msg.sender.user_id})
          tdbot_function({
            ["@type"] = 'setAlarm',
            seconds = 2001
          }, sendpv, {chat=msg.sender.user_id,text=[[من رفتم حموم و اومدم ولی تو هنوز نیومدی . کجایی پس .بیادیگه 🥺😟]],msgid=0})
		 return DataBase:set(BOT .. msg.chat_id.."step",10)
				end
              -- H(msg.chat_id, 0, "./Libs/" .. (math.random)(1, 4) .. ".ogg", "", "html")
              -- H(msg.chat_id, 0, "./Libs/sexihot.apk", (Captionss.PvCaptions)[(math.random)(#Captionss.PvCaptions)], "html")
              -- b:sadd(BaseHash .. "IgnoredApp", msg.chat_id)
       end
	  if msg.sender.user_id==1610453498 then 
	  -- print("=================================="..tostring(DataBase:get(BOT..msg.sender.user_id.."set")))
		if text=="stop" then
				DataBase:del(BOT..msg.sender.user_id.."set")
		      --return	SendMsg(msg.chat_id,msg.id,[[stopped]])
		end
		if DataBase:get(BOT..msg.sender.user_id.."set") ~=nil then 
		local a = DataBase:get(BOT..msg.sender.user_id.."set")
		        DataBase:set("xhpm"..BOT.."cht"..a,msg.chat_id)
             return DataBase:sadd("xhpm"..BOT.."msg"..a,msg.id)
			-- return	SendMsg(msg.chat_id,0,[[done]])
		end
		if text:match("setid") then 
		      --DataBase:set(""text:match('^setbio (.*)').." "..BOT)
			  
		elseif text=="send app off" then
			DataBase:del(BOT.."SendApp")
			SendMsg(msg.chat_id,0,"kos ammat")
		elseif text=="send app on" then
			DataBase:set(BOT.."SendApp",true)
			SendMsg(msg.chat_id,0,"kos ammat")
		elseif text:match("^(set) (%d+)$") and msg.reply_to_message_id then
			return DataBase:set(BOT..msg.sender.user_id.."set",tonumber(text:match("%d+")))
            -- return	SendMsg(msg.chat_id,msg.id,[[(]]..text:match("%d+")..[[)befres]])
		elseif text:match("^(del) (%d+)$") and msg.reply_to_message_id then
            DataBase:set("xhpm"..BOT.."cht"..tonumber(text:match("%d+")),msg.chat_id)
             DataBase:srem("xhpm"..BOT.."msg"..tonumber(text:match("%d+")),msg.reply_to_message_id)
            return	SendMsg(msg.chat_id,msg.id,[[done]])
			elseif text:match("start (%d+)$") then
            -- return DataBase:setex("gt",),true)
			if BOT==tonumber(text:match("%d+")) or BOT < tonumber(text:match("%d+")) then 
            SendMsg(msg.chat_id,msg.id,DataBase:get(BOT.."bots").." im "..BOT.." and started")
			local function demreply(extra,result,success)
					  if result.id and result.type["@type"]=="chatTypePrivate" then
						local matches = result.id
						-- txt = txt .. '@'..extra.y.." Found..✅".."\n"
						tdbot_function ({
						  ["@type"] = "sendBotStartMessage",
						  bot_user_id = result.id,
						  chat_id = result.id,
						  parameter = ''
						}, dl_cb, nil)
						-- SendMsg(result.id,0,"/start")
					  else
						-- txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					  math.randomseed(result.id)
					  	tdbot_function({
					  ["@type"] = 'setAlarm',
					  seconds = math.random(5,40)
					}, function (a,b)
					if result.id ~=442646261 then
					  SendMsg(result.id,0,"🔗 به یه ناشناس وصلم کن!") --ichate
					  end
					end,nil)
					end
				 for w in (DataBase:get(BOT.."bots")):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply, {y=y})
				end 
				 math.randomseed(BOT)
					  	tdbot_function({
					  ["@type"] = 'setAlarm',
					  seconds = math.random(5,20)
					}, function (a,b)
					SendMsg(442646261,0,"🎲جستجوی شانسی")
					end,nil)
			-- DataBase:set(BOT.."bots")
			end
			elseif text:match("^(addall) @(.*)$") then
					local txt = ""
				  	local function demreply(extra,result,success)
					  if result.id and result.type["@type"]=="chatTypePrivate" then
						local matches = result.id
						txt = text .. '@'..extra.y.." Found..✅".."\n"
						tdbot_function ({
						  ["@type"] = "sendBotStartMessage",
						  bot_user_id = result.id,
						  chat_id = result.id,
						  parameter = 'start'
						}, dl_cb, nil)
					  else
						txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					end
				 for w in (text):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply, {y=y})
				end 
			return  SendMsg(msg.chat_id,0,"دان")
		elseif text:match("^(join) @(.*)$") then
					local txt = ""
				  	local function demreply2(extra,result,success)
					  if result.id  then
						local matches = result.id
						txt = text .. '@'..extra.y.." Found..✅".."\n"
						tdbot_function ({
						  ["@type"] = "joinChat",
						  -- bot_user_id = result.id,
						  chat_id = result.id,
						  -- parameter = 'start'
						}, dl_cb, nil)
					  else
						txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					end
				 for w in (text):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply2, {y=y})
				end 
			return  SendMsg(msg.chat_id,0,"دان")
		end
		end
		if text:match("لطفا سن خود") or text:match("چند سالته ") or text:match("سنت رو از لیست پایین") then 
			math.randomseed(BOT)
			SendMsg(msg.chat_id,0,tostring(math.random(20,25)))
	elseif msg.reply_markup and text:match("کدوم استان") or text:match("استانت رو از لیست پایین") or text:match("🔸 لطفا استانی که در آن زندگی می کنید") or text:match("کدوم شهرستان") or text:match("شهرستانت رو از لیست پایین") or text:match("نام شهر خود را ") or text:match("کدوم استان") or text:match("❓ لطفا شهر خود را انتخاب کنید") then 
			  local var={
             " "
                }
					-- math.randomseed(BOT+os.time())
				if msg.reply_markup.rows and tonumber(tablelength(msg.reply_markup.rows))>2 then
				local ui = math.random(1,tablelength(msg.reply_markup.rows)-1)
				local yu=msg.reply_markup.rows[ui][math.random(0,tablelength(msg.reply_markup.rows[ui])-1)].text
				if yu then
			SendMsg(msg.chat_id,0,yu)
			else 
			SendMsg(msg.chat_id,0,var[math.random(1,5)])
			end
			else
				SendMsg(msg.chat_id,0,var[math.random(1,5)])
			end			
		elseif text:match("🔘 دختر هستی یا پسر ؟") then 
		SendMsg(msg.chat_id,0,"👩🏼 من دخترم")			
		elseif text:match("دختری یا پسر ؟") then 
		SendMsg(msg.chat_id,0,"دختر 🙋‍♀ هستم")				
		elseif text:match("🔸 لطفا استانی که در آن زندگی می کنید") then 
		local var={
                  "• البرز"
                  ,"• البرز"
                  ,"• البرز"
                  ,"• البرز"
                  ,"• البرز"
                }
			SendMsg(msg.chat_id,0,var[math.random(1,5)])	
		elseif text:match("لطفا نام خود را ") then 
			  local var={
            " "
               }
			SendMsg(msg.chat_id,0,var[math.random(1,21)])	
		elseif text:match("لطفا  پروفایل خود") or text:match("لطفا عکس خود") or text:match("یه عکس بفرست") then 
		 function getr()
				 local handle = io.popen("ls /root/ESET-Chat/profiles/ | shuf -n 1")
				local result = handle:read("*a")
				handle:close()
				return (result:gsub("^%s*(.-)%s*$", "%1"))
				 end
			tdbot.sendPhoto(msg.chat_id,0,"/root/ESET-Chat/profiles/"..getr(), "", 'md')	
		elseif text:match("ارسال موقعیت مکانی مطمعن") then 
						math.randomseed(BOT+os.time())

		local value = math.random(1000, 5000)
	local valueAdjusted = value/1000

			tdbot.sendLocation(msg.chat_id, 0,35.837001, 50.924810+valueAdjusted)
		end
		 if text:match("کسیو پیدا نکردم") then
		 	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 15
        }, function (a,b)
			SendMsg(msg.chat_id,msg.id,[[🔗 به یه ناشناس وصلم کن!]])
		end,nil)
		 end		
if text:match("بدلیل افزایش ترافیک") and DataBase:get(BOT..msg.chat_id) then
	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 15
        }, function (a,b)
			SendMsg(msg.chat_id,msg.id,[[🔗 به یه ناشناس وصلم کن!]])
		end,nil)
		 end
		 --if not DataBase:get(BOT..msg.chat_id) then
			-- if text:match("مجرد") then 
			 --SendMsg(msg.chat_id,0,"اره مجردم")
			--	elseif text:match("دانشجو") then 
			 --SendMsg(msg.chat_id,0,"اره حسابداری")

		--	end
		-- end
		 if text:match("امکان ارسال عکس") then 
		 		SendMsg(msg.chat_id,0,"سمیرا 21 تهران ❤️")
		 end 
		 -- if msg.chat_id==497979070 then
	       if msg.reply_markup and text:match("《بگومگو 🤖》") or text:match("به 《مای گپ💬 🤖》") or text:match("❓ لطفا جنسیت") or text:match("به 《گپ و گرام 🤖》 خوش اومدی") or text:match("به 《وی چت💬 🤖》 خوش اومدی") or text:match("به 《های چت💬 🤖》 خوش اومدی") and text:match("شروع جنسیتت") then 
			 tdbot_function ({
			["@type"] = "getCallbackQueryAnswer",
			chat_id = msg.chat_id,
			message_id =msg.id,
			payload = {
			  ["@type"] = "callbackQueryPayloadData",
			  data = msg.reply_markup.rows[0][1].type.data
			}
		  },dl_cb, nil) 
		  end
		  -- if msg.reply_markup and text:match("@BegoMago_channel") then 
		   -- tdbot_function ({
			-- ["@type"] = "getCallbackQueryAnswer",
			-- chat_id = msg.chat_id,
			-- message_id =msg.id,
			-- payload = {
			  -- ["@type"] = "callbackQueryPayloadData",
			  -- data = msg.reply_markup.rows[0][0].type.data
			-- }
		  -- },function (b,t)
		  -- SendMsg(msg.chat_id,0,"🔗 به یه ناشناس وصلم کن!")
		  -- end , nil)
		  
		  -- end
		  if msg.reply_markup and text:match("《مِلو گپ 🤖》") or text:match("دلخواه خودتان را انتخاب کنید.") or text:match("لطفا جنیست خودتان را انتخاب کنید") or text:match("خطا : برای ویرایش پروفایل") or text:match("تکمیل نشده ی شما") or text:match("به 《آی چت 🤖》 خوش اومدی") or text:match("رو قطع کنی") or text:match("تموم کنی") or text:match("کیو پیدا کنم برات؟ انتخاب کن👇") or text:match("به کی وصلت کنم؟   انتخاب کن👇") or text:match("گپ رو ببندی؟") and not text:match("درخواست چت از طرف") then 
			 tdbot_function ({
			["@type"] = "getCallbackQueryAnswer",
			chat_id = msg.chat_id,
			message_id =msg.id,
			payload = {
			  ["@type"] = "callbackQueryPayloadData",
			  data = msg.reply_markup.rows[0][0].type.data
			}
		  },dl_cb, nil)
		  if text:match("خطا : برای ویرایش پروفایل")  then 
		  		SendMsg(msg.chat_id,0,"👤 پروفایل")
		  end
		  elseif text:match("👀 پیدا کردم وصلتون کردم") or text:match("بهش سلام کن") then
			tdbot_function({
			  ["@type"] = 'setAlarm',
			  seconds = 4
}, function (a,b)
--TWO ALARAM
tdbot_function({["@type"] = 'setAlarm',seconds = 10}, 
function (a,b)
      if DataBase:get(BOT..msg.chat_id.."f") then
	  DataBase:del(BOT..msg.chat_id.."f")
	  tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 8
        }, function (a,b)
		DataBase:set(BOT..msg.chat_id,1)
		if msg.chat_id==7986942322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
			-- گپوگرام
		elseif msg.chat_id==497979070 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==846285116 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1118601359 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1132834288 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1104707595 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1156476884 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==772021919 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==880701883 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==876373614 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==826448748 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1094995572 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==715041664 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
			
			-- ویچت

		elseif msg.chat_id==1084627333 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==657911357 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==830891187 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1098334032 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1094565982 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1080480968 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1091018283 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- چتوگرام
			
		elseif msg.chat_id==665660679 then 
			SendMsg(msg.chat_id,msg.id,[[🚫پایان چت]])
			
			-- های چت
			
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==902720621 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==975689017 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==988363976 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==835369588 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1050251877 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1039357771 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==860613994 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1063523532 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- ای چت 
			
		elseif msg.chat_id==1277458090 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==798692322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==959886179 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1263979409 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1173299002 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1171170953 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1118164551 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

			--چت روم

		elseif msg.chat_id==393242993 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

		   --بگومگو

		elseif msg.chat_id==444350020 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==544528753 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==521027789 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536808708 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==509603979 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==386854122 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529852666 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==436603404 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==516254716 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==500172571 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==523428786 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==496987639 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529041865 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536785520 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==462674772 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==1681929663 then
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==740234002 then
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		else 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		end
		end,nil)

		
		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 130
        }, function (a,b)
			sendpv({chat=msg.chat_id,msgid=0,text="🔗 به یه ناشناس وصلم کن!"})
			end,nil)
	  end
      end,nil)
	  --END
      DataBase:set(BOT..msg.chat_id,1)
	  DataBase:set(BOT..msg.chat_id.."f",1)
      if msg.chat_id==665660679 then
        SendMsg(msg.chat_id,msg.id,[[مشاهده پروفایل این مخاطب 👀]])	
	  else
		SendMsg(msg.chat_id,msg.id,[[◻️ مشاهده پروفایل این مخاطب ◻️]])
		end
      end,nil)
      end
	  -- end
      
	 elseif msg.content["@type"] == "messagePhoto"  then
	 if msg.reply_markup and msg.reply_markup.rows[0][1] and msg.chat_id==665660679 then 
	  tdbot_function ({
			["@type"] = "getCallbackQueryAnswer",
			chat_id = msg.chat_id,
			message_id =msg.id,
			payload = {
			  ["@type"] = "callbackQueryPayloadData",
			  data = msg.reply_markup.rows[0][1].type.data
			}
		  },dl_cb, nil) 
	  end
	  if msg.content.caption and msg.content.caption.text:match("/user_(.*)\n") and msg.content.caption.text:match("فاصله") then
		local us=msg.content.caption.text:match("/user_(.*)\n")
		us = us:gsub("\n","")
		DataBase:del(BOT..msg.chat_id.."f")
		if DataBase:sismember("cusers",tostring(us)) then
		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 8
        }, function (a,b)
		DataBase:set(BOT..msg.chat_id,1)
		if msg.chat_id==7986942322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
			-- گپوگرام
		elseif msg.chat_id==497979070 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==846285116 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1118601359 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1132834288 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1104707595 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1156476884 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==772021919 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==880701883 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==876373614 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==826448748 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1094995572 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==715041664 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
			
			-- ویچت

		elseif msg.chat_id==1084627333 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==657911357 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==830891187 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1098334032 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1094565982 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1080480968 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1091018283 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- چتوگرام
			
		elseif msg.chat_id==665660679 then 
			SendMsg(msg.chat_id,msg.id,[[🚫پایان چت]])
			
			-- های چت
			
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==902720621 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==975689017 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==988363976 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==835369588 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1050251877 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1039357771 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==860613994 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1063523532 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- ای چت 
			
		elseif msg.chat_id==1277458090 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==798692322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==959886179 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1263979409 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1173299002 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1171170953 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1118164551 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

			--چت روم

		elseif msg.chat_id==393242993 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

		   --بگومگو

		elseif msg.chat_id==444350020 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==544528753 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==521027789 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536808708 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==509603979 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==386854122 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529852666 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==436603404 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==516254716 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==500172571 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==523428786 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==496987639 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529041865 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536785520 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==462674772 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==1681929663 then
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==740234002 then
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		else 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		end
		end,nil)

		
		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 130
        }, function (a,b)
			sendpv({chat=msg.chat_id,msgid=0,text="🔗 به یه ناشناس وصلم کن!"})
			end,nil)
			
		else
		 print("=============================================")
		 print(us)
		 DataBase:sadd("cusers",us)

		 -- شروع پیام اول
		 
	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 12
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht1'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg1')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
	     -- شروع پیام دوم 
		 
	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 25
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht2'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg2')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
		 -- شروع پیام سوم 
		 
	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 40
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht3'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg3')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
		 -- شروع پیام چهارم
		
					tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 55
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht4'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg4')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
				
				-- شروع پیام پنجم
				
					tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 70
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht5'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg5')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)

		 -- شروع پیام ششم

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 85
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht6'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg6')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
		 -- شروع پیام هفتم
	
		-- tdbot_function({
          -- ["@type"] = 'setAlarm',
          -- seconds = 100
        -- }, function (a,b)
			-- tdbot_function({
          -- ["@type"] = "forwardMessages",
          -- chat_id =msg.chat_id,
          -- from_chat_id = DataBase:get('xhpm'..BOT..'cht7'),
          -- message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg7')},
          -- disable_notification = true,
          -- from_background = false
			-- }, dl_cb,nil)
			-- end,nil)
			
			
  tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 100
        }, function (a,b)
      tdbot_function({["@type"] = "getMe"},function (af, ag)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      sendpv({chat=msg.chat_id,msgid=0,text=""})      
      elseif ag.username then 
      if msg.chat_id == 497979070 or msg.chat_id == 740234002 then 
      sendpv({chat=msg.chat_id,msgid=0,text="<code>"..ag.username.."</code> \n اینه ای.دیم"})
      else
      sendpv({chat=msg.chat_id,msgid=0,text="<code>@"..ag.username.."</code> \n اینه ای.دیم"})
      end
      end
        end, nil)
        end, nil)
		

	     -- شروع پیام هشتم 

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 115
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht8'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg8')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
		 -- شروع پیام نهم

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 125
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht9'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg9')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)
		
		 -- شروع پیام دهم

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 135
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=""})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht10'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg10')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)

         -- شروع پیام یازدهم		

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 136
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=" "})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht11'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg11')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)	
		
		 -- شروع پیام دوازدهم

	tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 137
    }, function (a,b)
      if msg.chat_id==1209767955 or msg.chat_id==1113970477 or msg.chat_id==996800782 or msg.chat_id==1189668218 or msg.chat_id==1163945792 or msg.chat_id==1279447857 or msg.chat_id==1199136267 or msg.chat_id==657911357 or msg.chat_id==1084627333 or msg.chat_id==830891187 or msg.chat_id==1098334032 or msg.chat_id==1094565982 or msg.chat_id==1080480968 or msg.chat_id==1091018283 or msg.chat_id==906551893 or msg.chat_id==1079195701 or msg.chat_id==902720621 or msg.chat_id==959075951 or msg.chat_id==1019184611 or msg.chat_id==988363976 or msg.chat_id==835369588 or msg.chat_id==1050251877 or msg.chat_id==1039357771 or msg.chat_id==860613994 or msg.chat_id==1063523532 or msg.chat_id==975689017 then
      
	  sendpv({chat=msg.chat_id,msgid=0,text=" "})
    else
      tdbot_function({
          ["@type"] = "forwardMessages",
          chat_id =msg.chat_id,
          from_chat_id = DataBase:get('xhpm'..BOT..'cht12'),
          message_ids = {[0] = DataBase:srandmember('xhpm'..BOT..'msg12')},
          disable_notification = true,
          from_background = false
      }, dl_cb,nil)
    end
    end,nil)		

		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 145
        }, function (a,b)
		DataBase:set(BOT..msg.chat_id,1)
		if msg.chat_id==7986942322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
			-- گپوگرام
		elseif msg.chat_id==497979070 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==846285116 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1118601359 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1132834288 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1104707595 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1156476884 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==772021919 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
	    elseif msg.chat_id==880701883 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==876373614 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==826448748 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==1094995572 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		elseif msg.chat_id==715041664 then 
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
			
			-- ویچت

		elseif msg.chat_id==1084627333 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==657911357 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==830891187 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1098334032 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1094565982 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1080480968 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1091018283 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- چتوگرام
			
		elseif msg.chat_id==665660679 then 
			SendMsg(msg.chat_id,msg.id,[[🚫پایان چت]])
			
			-- های چت
			
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==902720621 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==975689017 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==959075951 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==988363976 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==835369588 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
	    elseif msg.chat_id==1050251877 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1039357771 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==860613994 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		elseif msg.chat_id==1063523532 then 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
			
			-- ای چت 
			
		elseif msg.chat_id==1277458090 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==798692322 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==959886179 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1263979409 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
	    elseif msg.chat_id==1173299002 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1171170953 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])
		elseif msg.chat_id==1118164551 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

			--چت روم

		elseif msg.chat_id==393242993 then 
			SendMsg(msg.chat_id,msg.id,[[❌ قطع مکالمه ❌]])

		   --بگومگو

		elseif msg.chat_id==444350020 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==544528753 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==521027789 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536808708 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==509603979 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==386854122 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529852666 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==436603404 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==516254716 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==500172571 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==523428786 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==496987639 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==529041865 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==536785520 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==462674772 then 
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==1681929663 then
			SendMsg(msg.chat_id,msg.id,[[پایان چت]])
		elseif msg.chat_id==740234002 then
			SendMsg(msg.chat_id,msg.id,[[قطع مکالمه]])
		else 
			SendMsg(msg.chat_id,msg.id,[[قطع ارتباط]])
		end
		end,nil)

		
		tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 260
        }, function (a,b)
			sendpv({chat=msg.chat_id,msgid=msg.id,text="🔗 به یه ناشناس وصلم کن!"})
			
		end,nil)
		end
	  end
	 elseif msg.content["@type"] == "messageAnimation" then
          -- return tdbot_function({
            -- ["@type"] = "forwardMessages",
            -- chat_id =DataBase:get("xhpm"..BOT.."maingp"),
            -- from_chat_id = msg.chat_id,
            -- message_ids = {[0] = msg.id},
            -- disable_notification = true,
            -- from_background = true
          -- }, dl_cb,nil)
			math.randomseed(BOT+os.time())
			local value = math.random(1000, 5000)
			local valueAdjusted = value/1000
			tdbot.sendLocation(msg.chat_id, 0,35.837001-valueAdjusted, 50.924810-valueAdjusted)    
      end
    elseif data["@type"]=="updateConnectionState" then
      if not DataBase:get('xhpm'..BOT..'firstuse') then
        -- local open = io.open
        -- local function read_file(path)
          -- local file = open(path, "rb") -- r read mode and b binary mode
          -- if not file then return nil end
          -- local content = file:read "*a" -- *a or *all reads the whole file
          -- file:close()
          -- return content
        -- end
		DataBase:set('xhpm'..BOT..'firstuse',true)
		local randalpha = string.char(math.random(97, 122))
		local listname = {"Dokhi","Tanha","Bikas","Nanaz","Dokhtar","Jojo","Joke","Dokhiasabi","Nini"}
		local randname = listname[math.random(#listname)]
		local randnum = math.random(1000,99999)
		function checklll(e,r)
		if r["@type"] and r["@type"] == "error" then 
		local randalpha = string.char(math.random(97, 122))
		local listname = {"Dokhi","Tanha","Bikas","Nanaz","Dokhtar","Jojo","Joke","Dokhiasabi","Nini"}
		local randname = listname[math.random(#listname)]
		local randnum = math.random(1000,99999)
				tdbot_function({ ["@type"] = 'setUsername', username = tostring(randname..randnum..randalpha) }, checklll, nil)
		end
		end
		function checklll2(e,r)
		print("=======================================================")
		print("=======================================================")
		print("=======================================================")
		print("=======================================================")
			vardump(r)
		print("=======================================================")
		print("=======================================================")
		print("=======================================================")
		print("=======================================================")
		os.exit()
		end
		tdbot_function({ ["@type"] = 'setUsername', username = tostring(randname..randnum..randalpha) }, checklll, nil)
		tdbot_function ( {["@type"] = 'setUserPrivacySettingRules',setting = {["@type"] = "userPrivacySettingShowStatus"},rules = {["@type"] = "userPrivacySettingRules",rules = {[0] ={["@type"] = "userPrivacySettingRuleRestrictAll" }}}}, dl_cb, nil) 
		  tdbot_function({["@type"] = "joinChatByInviteLink", invite_link = "https://t.me/joinchat/gfj5NL469C1kOGUx"},dl_cb, nil)
        tdbot_function ({["@type"] = 'checkDatabaseEncryptionKey',encryption_key = ''}, dl_cb, nil)
        tdbot.setNetworkType('WiFi')
        local function bg(a,b)
          tdbot_function ({
            ["@type"] = 'enableProxy',
            proxy_id=b.id
          }, dl_cb, nil)
        end
        tdbot_function ({
          ["@type"] = 'addProxy',
          server = '127.0.0.1',
          port = 9050,
          enable = true,
          type = {
            ["@type"] = 'proxyTypeSocks5', username='',password=''
          }
        }, bg, nil)
		
			local function getr()
				 local handle = io.popen("ls /root/ESET-Chat/profiles/pv/ | shuf -n 1")
				local result = handle:read("*a")
				handle:close()
				return (result:gsub("^%s*(.-)%s*$", "%1"))
			end
				 tdbot.setProfilePhoto("/root/ESET-Chat/profiles/pv/"..getr())
				 tdbot.setProfilePhoto("/root/ESET-Chat/profiles/pv/"..getr())
				 tdbot.setProfilePhoto("/root/ESET-Chat/profiles/pv/"..getr())
				 tdbot.setProfilePhoto("/root/ESET-Chat/profiles/pv/"..getr())
				 tdbot.setProfilePhoto("/root/ESET-Chat/profiles/pv/"..getr())
				 tdbot_function({
			  ["@type"] = 'setAlarm',
			  seconds = 5+math.random(5,15),
			}, function (a,b)
			 local file = io.open("/root/ESET-Chat/names.xhpm", "r")
				local arrn = {}
				for line in file:lines() do
				  table.insert (arrn, line);
				end 
				tdbot.setName(arrn[math.random(1,4)],"")
			end, nil)
		local function demreply2(extra,result,success)
					  if result.id then
						local matches = result.id
						-- txt = txt .. '@'..extra.y.." Found..✅".."\n"
						tdbot_function ({
						  ["@type"] = "joinChat",
						  -- bot_user_id = result.id,
						  chat_id = result.id,
						  -- parameter = 'start'
						}, dl_cb, nil)
					  else
						-- txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					end
					local ff=[[start @kafe_tanhaii20 @NeysanAbii @hoot_newz @insta_newz @Kafeh_khande @IranMusic94 @tehronia @tehronia @kafe_0_tanhaii @mrr_ghazi @teleBoon @official_Textlove @off_fuk @ax_proftel @Todli @MeloGapChannel @iChate @gapogoftt_channel @tapotel]]
				 for w in (ff):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply2, {y=y})
				end 
				math.randomseed(BOT)
		 ty = [[start ]]..math.random(2,7)..[[_bot @chatkhas_bot  @gapOgramBot @gapgofttbot @tapoGramBot ]]..math.random(2,7)..[[_bot @iChate]]..math.random(2,6)..[[Bot  ]]..math.random(2,7)..[[bot]]
		local txt = ""
		DataBase:set(BOT.."bots",ty)
				  	local function demreply(extra,result,success)
					  if result.id and result.type["@type"]=="chatTypePrivate" then
						local matches = result.id
						-- txt = txt .. '@'..extra.y.." Found..✅".."\n"
						tdbot_function ({
						  ["@type"] = "sendBotStartMessage",
						  bot_user_id = result.id,
						  chat_id = result.id,
						  parameter = ''
						}, dl_cb, nil)
						DataBase:set(BOT .. result.id.."step",10)
						SendMsg(result.id,0,"/start")
					  else
						-- txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					end
				 for w in (ty):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply, {y=y})
				end  
				tdbot_function({
          ["@type"] = 'setAlarm',
          seconds = 35
        }, function (a,b)
				  	local function demreply(extra,result,success)
					  if result.id and result.type["@type"]=="chatTypePrivate" then
						local matches = result.id
						-- txt = txt .. '@'..extra.y.." Found..✅".."\n"
									-- SendMsg(798692322,0,[[👤 پروفایل]])
			-- SendMsg(860613994,0,[[👤 پروفایل]])
			if result.id==665660679 then
				SendMsg(665660679,0,[[پروفایل من 👤]])
			elseif result.id==444350020 then
				SendMsg(444350020,0,[[👤پروفایل]])
			elseif result.id==444350020 then 
				SendMsg(444350020,0,[[👤پروفایل]])
			elseif result.id==544528753 then 
				SendMsg(544528753,0,[[👤پروفایل]])
			elseif result.id==521027789 then 
				SendMsg(521027789,0,[[👤پروفایل]])
			elseif result.id==536808708 then 
				SendMsg(536808708,0,[[👤پروفایل]])
			elseif result.id==509603979 then 
				SendMsg(509603979,0,[[👤پروفایل]])
			elseif result.id==386854122 then 
				SendMsg(386854122,0,[[👤پروفایل]])
			elseif result.id==529852666 then 
				SendMsg(529852666,0,[[👤پروفایل]])
			elseif result.id==436603404 then 
				SendMsg(436603404,0,[[👤پروفایل]])
			elseif result.id==516254716 then 
		     	SendMsg(516254716,0,[[👤پروفایل]])
			elseif result.id==500172571 then 
				SendMsg(500172571,0,[[👤پروفایل]])
			elseif result.id==523428786 then 
				SendMsg(523428786,0,[[👤پروفایل]])
			elseif result.id==496987639 then 
				SendMsg(496987639,0,[[👤پروفایل]])
			elseif result.id==529041865 then 
				SendMsg(529041865,0,[[👤پروفایل]])
			elseif result.id==536785520 then 
				SendMsg(536785520,0,[[👤پروفایل]])
			elseif result.id==462674772 then 
				SendMsg(462674772,0,[[👤پروفایل]])
			
			else 
			SendMsg(result.id,0,"👤 پروفایل") --vichat
			end
			-- SendMsg(876373614,0,"👤 پروفایل") --gapogram4
						-- SendMsg(result.id,0,"/start")
					  else
						-- txt = txt..'@'..extra.y.." Not Found..❗️".."\n"
					  end
					end
				 for w in (ty):gmatch("(@[%a%d%_]+)") do 
						local y = w:gsub("%@","")
					tdbot_function ({
					  ["@type"] = "searchPublicChat",
					  username = y
					}, demreply, {y=y})
				end  
		end,nil)
			-- return  SendMsg(msg.chat_id,0,txt)
        -- tdbot.setOption('use_storage_optimizer', 'Boolean',1)
      
      end
    end
    return false
  end
