bot=dofile('utils.lua')sudos=dofile('sudo.lua')URL=require"socket.url"serpent=require("serpent")http=require"socket.http"https=require"ssl.https"redis=require('redis')db=redis.connect('127.0.0.1',6379)bot_id=0;function vardump(a)print(serpent.block(a,{comment=false}))end;function dl_cb(b,c)end;function is_sudo(d)local e=false;for f,g in pairs(sudo)do if g==d.sender_user_id_ or db:sismember('mods'..bot_id,d.sender_user_id_)then e=true end end;return e end;function kl(h)local i=os.time()repeat until os.time()>i+h end;function run(d,c)function lkj(b,c)_G.bot_id=c.id_ end;tdcli_function({ID="GetMe"},lkj,nil)if db:get("autobcs"..bot_id)=='on'and db:get("timera"..bot_id)==nil and db:scard('autoposterm'..bot_id)>0 then db:setex("timera"..bot_id,db:get("autobctime"..bot_id),true)local j=db:smembers('autoposterm'..bot_id)function cb(k,l,m)if l.ID=="Message"then local n=db:smembers('bc'..bot_id)if db:get('sec'..bot_id)==0 then for o,f in pairs(n)do bot.forwardMessages(f,d.chat_id_,{[0]=l.id_},0)end else for o,f in pairs(n)do kl(db:get('sec'..bot_id)or 1)bot.forwardMessages(f,d.chat_id_,{[0]=l.id_},0)end end end end;local p=nil;for o,f in pairs(j)do p=db:get('gp'..f..bot_id)tdcli_function({ID="GetMessage",chat_id_=p,message_id_=f},cb,{id8=f})end end;if tostring(d.chat_id_):match('-')then if tostring(db:get('seen'..bot_id))=="gp"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if not db:sismember('bc'..bot_id,d.chat_id_)then local q=db:smembers('bcs'..bot_id)local r=db:scard('bcs'..bot_id)for s,t in pairs(q)do bot.forwardMessages(d.chat_id_,db:get('gpb'..t..bot_id),{[0]=t},1)kl(1)end;db:sadd('bc'..bot_id,d.chat_id_)end elseif not tostring(d.chat_id_):match('-')then if db:get('autom'..bot_id)=='on'then if d.content_.text_:match("سلام")then bot.sendMessage(d.chat_id_,d.id_,1,'سلام','md')elseif d.content_.text_:match("خوبی")then bot.sendMessage(d.chat_id_,d.id_,1,'مرسی تو خوبی؟','md')end end;if tostring(db:get('seen'..bot_id))=="pv"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if not db:sismember('users'..bot_id,d.chat_id_)then function lkj(k,l,m)if l.ID~='Error'then db:sadd('users'..bot_id,d.chat_id_)end end;tdcli_function({ID="GetUser",user_id_=d.chat_id_},lkj,nil)end end;local u=nil;if d.content_.text_ and d.content_.entities_ and d.content_.entities_[0]and d.content_.entities_[0].ID=='MessageEntityUrl'then u=d.content_.text_ or d.content_.text_ elseif is_sudo(d)then u=d.content_.text_ end;if u then function aj_check()if db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')return true elseif db:get('aj1'..bot_id)=="on"then return true elseif db:get('aj1'..bot_id)=="off"then return false end end;if is_sudo(d)then if u=='help'then local f=" راهنمای دستورات سینچی\n 🗓 اطلاعات\n 🔹 panel\n ➖➖➖➖➖➖➖➖➖➖➖\n 🕐کنترل وضعیت افزایش گروه  \n🔹join [on | off] \n ➖➖➖➖➖➖➖➖➖➖➖\n 🕰تنظیم مدت زمان تاخیر بین ارسال ها \n 🔹setsec [number] \n ➖➖➖➖➖➖➖➖➖➖➖\n📥پاسخگوی خودکار\nخاموش کردن:\n\n🔹autom off\nروشن کردن:\n🔹autom on \n➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن مخاطب \n 🔹addc [reply] \n شماره شیر شده را ریپلای کرده و دستور را بزنید \n➖➖➖➖➖➖➖➖➖➖➖\n 🗒نمایش اطلاعات ربات \n 🔹botinfo \n➖➖➖➖➖➖➖➖➖➖➖\n🌪اضافه کردن شخص به تمامی گروها\n🔹addall [reply | username]\nپیام شخص را ریپلای کرده و دستور را به تنهایی بزنید یا\nایدی شخص را جلو دستور قرار دهید\nمثال:\naddall @sinaxhpm \n➖➖➖➖➖➖➖➖➖➖➖\n 🌁تغییر عکس پروفایل \n 🔹setphoto link \n به جای لینک لینک عکس موردنظر را بزارید \n➖➖➖➖➖➖➖➖➖➖➖\n 👁‍🗨تنظیمات سین\n🔹seen gp\nتنها پیام های گروه ها سین خواهند خورد\n🔹seen pv\nفقط پیام های توی پیوی سین خواهند خورد\n🔹seen all\nتمامی پیام ها سین خواهند خورد\n🔹seen off\nهیچ پیامی سین نخواهد خورد\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔃 حذف تمامی گروه ها\n 🔹 remgp\n ➖➖➖➖➖➖➖➖➖➖➖\n ☢️ چک کردن گروه های در دسترس\n 🔹gpcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 📣 ارسال پیام به همه ی گروه ها(با ریپلی)\n 🔹bc\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔊 ارسال پیام به تمامی گروه ها به صورت رگباری به تعداد عدد\n انتخابی\n 🔹nbc [nubmer]\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂 عضویت در لینک های ذخیره شده\n 🔹rejoin\n ➖➖➖➖➖➖➖➖➖➖➖\n ⚠️ حذف تمامی لینک های ذخیره شده(استفاده نشده)\n 🔹remlinks\n ➖➖➖➖➖➖➖➖➖➖➖\n ♦️حذف لینک های استفاده شده\n 🔹remelinks\n 📛توجه داشتید باشید در این دستور یک e اضافی هست - با دستور حذف لینک های ذخیره شده اشتباه نکنید\n ➖➖➖➖➖➖➖➖➖➖➖\n 📉 نمایش اطلاعات سرور\n 🔹serverinfo\n ➖➖➖➖➖➖➖➖➖➖➖\n ↩️روشن و خاموش کردن جوین اتوماتیک\n 🔹aj\n 📛راهنما:\n https://t.me/Sin_Chi/37 \n ➖➖➖➖➖➖➖➖➖➖➖\n 🔷فروارد اتوماتیک\n https://t.me/Sin_Chi/195 \n ➖➖➖➖➖➖➖➖➖➖➖\n 📣ارسال پست به تمامی کاربران(پیوی ها)\n 🔹bc u\n ◽️ریپلای شود\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂چک کردن پیوی ها\n 🔹pvcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔀ارسال پیام بدون فروارد به همه کاربران\n 🔹bc echo u\n ➖➖➖➖➖➖➖➖➖➖➖\n 👤حذف تمامی کاربران\n 🔹rem users\n ➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن ادمین(سودو)\n \n 🔹promote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n ➖حذف کردن از لیست مدیران(سودو)\n \n 🔹demote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n 📈اضافه کردن کاربران به گروه(اد ممبر)\n \n 🔹addmembers\n ➖➖➖➖➖➖➖➖➖➖➖\n 📰تغییر نام اکانت\n 🔹setname [name]\n مثال:\n setname علی\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔈ارسال پیام بدون فروارد(رپلای)\n 🔹bc echo\n 📛نکته: در پیام موردنظرتون میتوانید از تگ هایhtml استفاده کنید تا پیام ارسالی زیباتر شود مثال:\n <b>Test</b>\n سپس پیام را ریپلای کرده و دستور\n را وارد کنید\n 🔸🔸🔸🔸🔸🔸🔸🔹🔹🔹🔹🔹🔹\n ➡️ Coded By: "..string.char(64,83,105,110,97,88,104,112,109).."\n ➡️ Channel : "..string.char(64,83,105,110,95,67,104,105).."\n"bot.sendMessage(d.chat_id_,d.id_,1,f,'md')end;if u=='bc'then local n=db:smembers('bc'..bot_id)local v=db:get('sec'..bot_id)or 1;local q=db:smembers('bcs'..bot_id)local r=db:scard('bcs'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'تعداد '..r..'پست برای ارسال اماده شدند','md')for o,f in pairs(n)do for s,t in pairs(q)do bot.forwardMessages(f,db:get('gpb'..t..bot_id),{[0]=t},1)kl(1)end;kl(v)end end;if u=='bc u'and tonumber(d.reply_to_message_id_)>0 then function cb(k,l,m)local n=db:smembers('users'..bot_id)local v=db:get('sec'..bot_id)or 1;local q=db:smembers('bcs'..bot_id)for o,f in pairs(n)do for s,t in pairs(q)do bot.forwardMessages(f,db:get('gpb'..t..bot_id),{[0]=l.id_},1)kl(1)end;kl(60)end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if u:match('^seen (.*)')then local w=u:match('seen (.*)')local x=nil;if w=='pv'then db:set('seen'..bot_id,'pv')x='فقط پیام های پیوی سین خواهد خورد'elseif w=='gp'then db:set('seen'..bot_id,'gp')x='ققط پیام های گروه ها سین خواهد خورد'elseif w=='off'then db:set('seen'..bot_id,'off')x='هیچ پیامی سین زده نخواهد شد'elseif w=='all'then db:set('seen'..bot_id,'all')x='تمامی پیام ها سین خواهند خورد'end;bot.sendMessage(d.chat_id_,d.id_,1,x..'✔️','md')end;if u=='panel'or u:match("panel(%d+)$")then local y=tonumber(u:match('panel(.*)'))local n=db:scard('bc'..bot_id)local z=db:scard('links'..bot_id)local A=db:scard('elinks'..bot_id)local B=db:scard('users'..bot_id)local C=0;local D=' 'local E=0;local F=nil;if aj_check()then C='✅'else C='❌'end;if db:get('autobcs'..bot_id)=='on'then D='✅'else D='❌'end;if db:get('joinl'..bot_id)=='off'then F='❌'else F='✅'end;if db:ttl("timera"..bot_id)==-2 then E=0 else E=db:ttl("timera"..bot_id)end;if y==2 then function fuck(k,l,m)if l.ID=='Error'then bot.searchPublicChat("SinChi_robot")bot.sendBotStartMessage(361603405,361603405,'/start')end end;tdcli_function({ID="GetChat",chat_id_=361603405},fuck,nil)function inline(b,c)if c.results_ and c.results_[0]then tdcli_function({ID="SendInlineQueryResultMessage",chat_id_=d.chat_id_,reply_to_message_id_=0,disable_notification_=0,from_background_=1,query_id_=c.inline_query_id_,result_id_=c.results_[0].id_},dl_cb,nil)end end;local G='/sg '..n..' /lnk '..z..' /elnk '..A..' /end '..C..' /aj '..D..' /abc '..E..' /eabc '..B..' /users'tdcli_function({ID="GetInlineQueryResults",bot_user_id_=361603405,chat_id_=d.chat_id_,user_location_={ID="Location",latitude_=0,longitude_=0},query_=G,offset_=0},inline,nil)else bot.sendMessage(d.chat_id_,d.id_,1,'<b>💠وضعیت کلی سینچی💠</b> \n\n 👥سوپر گروه ها: '..n..'\n 📈تعداد لینک های موجود:  '..z..'\n 🔚لینک های استفاده شده: '..A..'\n 👤تعداد کاربرها(پیوی): '..B..'\n 🔄جوین اتوماتیک: '..C..'\n ♻️فروارد اتوماتیک: '..D..'\n 🚹جوین شدن در لینکها:'..F..' \n⏱زمان باقی مانده(فروارد اتوماتیک): '..E..'\n\n  ♥️ '..string.char(64,83,105,110,95,67,104,105),1,'html')end end;if u:match('^nbc (%d+)$')and tonumber(d.reply_to_message_id_)>0 then local H=tonumber(u:match('nbc (.*)'))function cb(k,l,m)local n=db:smembers('bc'..bot_id)local q=db:smembers('bcs'..bot_id)for o,f in pairs(n)do for I=1,H,1 do for s,t in pairs(q)do bot.forwardMessages(f,db:get('gpb'..t..bot_id),{[0]=t},1)kl(1)end end end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if u=='rejoin'then rejoin()bot.sendMessage(d.chat_id_,d.id_,1,'وارد لینک های ذخیره شده شدم☑️',1,'html')end;if u=='aj'then if db:get('aj1'..bot_id)=='off'then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')elseif db:get('aj1'..bot_id)=='on'then db:set('aj1'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک خاموش شد⛔️','md')elseif db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')end end;if u=='botinfo'then function lkj(m,J)local K=''if J.last_name_ then K=J.last_name_ else K='(خالی)'end;ip=io.popen("curl https://api.ipify.org"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,'🗒نام: '..J.first_name_..'\n 📄نام خانوادگی : '..K..'\n 📋یوزر ایدی : '..J.id_..'\n 📱شماره:\n <code>+'..J.phone_number_..'</code> \n 🕰زمان تاخیر بین ارسالها: '..(db:get('sec'..bot_id)or 1)..'ثانیه \n🌐ایپی سرور:\n '..ip..'\n\n 📮version: 8\n☘️ @Sin_Chi 🌿',1,'html')end;tdcli_function({ID="GetMe"},lkj,nil)end;if u=='autobc off'then db:set('autobcs'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'فروارد اتوماتیک خاموش شد✔️','md')end;if u=='serverinfo'then local u=io.popen("sh ./servinfo.sh"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,u,1,'html')end;if u=='bc echo'and tonumber(d.reply_to_message_id_)>0 then function cb(k,l,m)local n=db:smembers('bc'..bot_id)local v=db:get('sec'..bot_id)or 1;for o,f in pairs(n)do kl(v)bot.sendMessage(f,1,1,l.content_.text_,1,'html')end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if u=='bc echo u'and tonumber(d.reply_to_message_id_)>0 then function cb(k,l,m)local n=db:smembers('users'..bot_id)local v=db:get('sec'..bot_id)or 1;for o,f in pairs(n)do kl(v)bot.sendMessage(f,1,1,l.content_.text_,1,'html')end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if u:match('^add abc')and tonumber(d.reply_to_message_id_)>0 then db:sadd('autoposterm'..bot_id,tonumber(d.reply_to_message_id_))db:set('gp'..tonumber(d.reply_to_message_id_)..bot_id,d.chat_id_)bot.sendMessage(d.chat_id_,d.id_,1,'پست به ارسال های اتوماتیک اضافه شد✅',1,'html')end;if u:match('^add bc')and tonumber(d.reply_to_message_id_)>0 then db:sadd('bcs'..bot_id,tonumber(d.reply_to_message_id_))db:set('gpb'..tonumber(d.reply_to_message_id_)..bot_id,d.chat_id_)bot.sendMessage(d.chat_id_,d.id_,1,'پست ب دسته فور ها اضاف شد دادو',1,'html')end;if u=='rem abc'and tonumber(d.reply_to_message_id_)>0 then db:srem('autoposterm'..bot_id,tonumber(d.reply_to_message_id_))bot.sendMessage(d.chat_id_,d.id_,1,'پست از ارسال های اتوماتیک پاک شد❌',1,'html')end;if u=='remall bc'then db:del('bcs'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'تمامی پست ها از لیست ارسال پاک شدند',1,'html')end;if u=='addc'and tonumber(d.reply_to_message_id_)>0 then function cb(L,l,o)bot.importContacts(l.content_.contact_.phone_number_,l.content_.contact_.first_name_,l.content_.contact_.last_name_,l.content_.contact_.user_id_)bot.sendMessage(l.chat_id_,l.id_,1,'کاربر مورد نظر با موفقیت اد شد','md')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if u:match('^autobc (%d+)[mh]')then local M=u:match('^autobc (.*)')if M:match('(%d+)h')then time_match=M:match('(%d+)h')time=time_match*3600 end;if M:match('(%d+)m')then time_match=M:match('(%d+)m')time=time_match*60 end;db:setex('timera'..bot_id,time,true)db:set('autobctime'..bot_id,tonumber(time))db:set("autobcs"..bot_id,"on")bot.sendMessage(d.chat_id_,d.id_,1,'◽️تایمر فروارد اتوماتیک برای '..time..'ثانیه فعال شد✔️','md')end;if u=='remlinks'then db:del('links'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'لینک های ذخیره شده با موفقیت پاک شدند✔️ \n🖤 @Sin_chi 🖤',1,'html')end;if u=='remgp'then db:del('bc'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'همه گروه ها از دیتابیس حذف شدند✅ \n💠 @Sin_chi','md')end;if u=='remall abc'then db:del('autoposterm'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔴همه پست های فروارد اتوماتیک پاک شدند❗️','md')end;if u=='rem users'then db:del('users'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸یوزر ها از دیتابیس پاک شدند!','md')end;if u=='remelinks'then db:del('elinks'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸لینک های استفاده شده با موفقیت حذف شدند❗️\n🌀@Sin_Chi',1,'html')end;if u=='gpcheck'then local N=db:scard('bc'..bot_id)function checkm(b,c,J)if c.ID=='Error'then db:srem('bc'..bot_id,b.chatid)end end;function sendresult()bot.sendMessage(d.chat_id_,d.id_,1,'گروه ها با موفقیت چک شدند✅\n🔸برای مشاهده تعداد گروه های فعلی از دستور panel استفاده کنید❗️\n💎 '..string.char(64,83,105,110,95,67,104,105),1,'html')end;local n=db:smembers('bc'..bot_id)for o,f in pairs(n)do tdcli_function({ID="GetChatHistory",chat_id_=f,from_message_id_=0,offset_=0,limit_=1},checkm,{chatid=f})if N==o then sendresult()end end end;if u:match('^autom (.*)')then local O=u:match('autom (.*)')if O=='off'then db:set('autom'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار خاموش شد','md')elseif O=='on'then db:set('autom'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار روشن شد','md')end end;if u:match('^join (.*)')then local O=u:match('join (.*)')if O=='off'then db:set('joinl'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'ربات دیگر در هیچ گروهی عضو نمیشود','md')elseif O=='on'then db:set('joinl'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'ربات شروع به جوین در گروه ها کرد','md')end end;if u:match("^setsec (%d+)")then local P=tonumber(u:match('setsec (.*)'))if P==0 then db:set('sec'..bot_id,1)else db:set('sec'..bot_id,P)end;bot.sendMessage(d.chat_id_,d.id_,1,'تنظیمات به '..P..'ثانیه تغییر کرد!','md')end;if u=='pvcheck'then local B=db:smembers('users'..bot_id)function lkj(k,l,m)if l.ID=='Error'then db:srem("user"..bot_id,k.usr)end end;for o,f in pairs(B)do tdcli_function({ID="GetUser",user_id_=f},lkj,{usr=f})end;bot.sendMessage(d.chat_id_,d.id_,1,'⭕️کاربران با موفقیت چک شدند!',1,'html')end;if u:match('^setname (.*)$')then local Q=u:match('setname (.*)')bot.changeName(Q,'')bot.sendMessage(d.chat_id_,d.id_,1,'اسم اکانت به '..Q..' تغییر یافت✔️',1,'md')end;if u=='promote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(R,S,T)db:sadd('mods'..bot_id,S.sender_user_id_)local g=S.sender_user_id_;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..g..'</code><b> مدیر ربات شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)end;if u:match('^promote @(.*)')then local U=u:match('^promote @(.*)')function promreply(R,S,T)if S.id_ then db:sadd('mods'..bot_id,S.id_)u='<code>'..S.id_..'</code><b> مدیر ربات شد!!</b>'else u='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,u,1,'html')end;bot.resolve_username(U,promreply)end;if u:match('^addall')then if u:match('^addall @(.*)')then local U=u:match('^addall @(.*)')function promreply(R,S,T)if S.id_ then local n=db:smembers('bc'..bot_id)for o,f in pairs(n)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=S.id_,forward_limit_=50},dl_cb,nil)end;db:sadd('mods'..bot_id,S.id_)u='<code>'..S.id_..'</code><b>به تمامی گروه های ربات اد شد!!</b>'else u='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,u,1,'html')end;bot.resolve_username(U,promreply)elseif u=='addall'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(R,S,T)local n=db:smembers('bc'..bot_id)for o,f in pairs(n)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=S.sender_user_id_,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..S.sender_user_id_..'</code><b> اکانت موردنظر به تمامی گروه های ربات اد شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)elseif u:match('^addall (%d+)')then local V=u:match('addall (.*)')local n=db:smembers('bc'..bot_id)for o,f in pairs(n)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=V,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'کاربر مورد نظر به تمامی گروه هام اد شد!',1,'html')end end;if u and u:match('^promote (%d+)')then local g=u:match('promote (%d+)')db:sadd('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر(<code>'..g..'</code>)<b> مدیر این ربات شد!!</b>',1,'html')end;if u=='demote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(R,S,T)db:srem('mods'..bot_id,S.sender_user_id_)bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..S.sender_user_id_..'</code><b> از لیست مدیریت حذف شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)end;if u:match('^demote @(.*)')then local U=u:match('^demote @(.*)')function demreply(R,S,T)if S.id_ then db:srem('mods'..bot_id,S.id_)u='کاربر (<code>'..S.id_..'</code>) از لیست مدیران حذف شد!'else u='<i>کاربر یافت نشد!</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,u,1,'html')end;bot.resolve_username(U,demreply)end;if u and u:match('^demote (%d+)')then local g=u:match('demote (%d+)')db:srem('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر (<code>'..g..'</code>)<b> از لیست مدیریت حذف شد!!</b>',1,'html')end;if u:match("^setphoto (.*)$")then local W={string.match(u,"^(setphoto) (.*)$")}local X=os.clock()local http=require("socket.http")local Y,Z=http.request(W[2])if not Y then error(Z)end;local _=assert(io.open(X..'photo.jpg','wb'))_:write(Y)_:close()bot.setProfilePhoto(X..'photo.jpg')bot.sendMessage(d.chat_id_,d.id_,1,'عکس جدید تنظیم شد✔️','md')end;if u=='admins'then local k=db:smembers('mods'..bot_id)local a0='لیست مدیران ربات : \n'for I=1,#k do a0=a0 ..I..'-  '..k[I]..'\n'end;a0=a0 ..'\n @Sin_Chi'bot.sendMessage(d.chat_id_,d.id_,1,a0,'md')end;if u=='addmembers'then local n=db:smembers('users'..bot_id)for o,f in pairs(n)do tdcli_function({ID="AddChatMember",chat_id_=d.chat_id_,user_id_=f,forward_limit_=50},dl_cb,nil)end end end end end;function tdcli_update_callback(c)if c.ID=="UpdateNewMessage"then run(c.message_,c)elseif c.ID=="UpdateMessageEdited"then c=c;local function a1(R,S,T)run(S,c)end;tdcli_function({ID="GetMessage",chat_id_=c.chat_id_,message_id_=c.message_id_},a1,nil)elseif c.ID=="UpdateOption"and c.name_=="my_id"then tdcli_function({ID="GetChats",offset_order_="9223372036854775807",offset_chat_id_=0,limit_=20},dl_cb,nil)end end
