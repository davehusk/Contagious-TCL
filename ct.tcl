##############################################BOF##############################################
#*** Contagious TCL Version/Update Time
set ver "3.41 1038115627"
set vermt "0.62"
#*** Show users TCL is loading
putlog ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
putlog " ----------   ----------   ----------   ----------"
putlog "                -=\[Contagious+MT\]=-"
putlog "                       V[lindex $ver 0]"
putlog "                   By Silverado"
putlog " ----------   ----------   ----------   ----------"
putlog "                     +MT V[lindex $vermt 0]"
putlog "                      By MTrez"
putlog " ----------   ----------   ----------   ----------"
putlog "Last Update: [ctime [lindex $ver 1]]"
putlog " ----------   ----------   ----------   ----------"
putlog ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
putlog "Begining Loading Process..."
checkmodule blowfish
#*** Global Settings
set win-version "98"
set mirc-version "5.82"
set ircN-version "7.26 + 7.0"
set ircN-reldate "2001/04/03 20.00"
set dcc-autoaway 10
set antiidletime 5
set antiidlemsg "..IDLE.."
set loginchk "on 3"
set CTCP_FloodProt 4:60
set chan_limit "limit=10 grace=2 timer=2"
set userinfo-fields "URL BF GF IRL ICQ EMAIL DOB"
#*** Default URL To Update The Encrypted TCL From (can be changed from .update)
set default-cnturl {
 host=void
 port=void
 file=void
}
set mtdlurl(total) "2"
set mtdlurl(1,url) "http://www.rezzie.net:80/cnt/"
set mtdlurl(2,url) "http://contagious.symbo1s.com:80/new/uploads/"
foreach tmpx [array names mtdlurl *,url] {
 set site [lindex [split $tmpx ","] 0]
 foreach tmpy [split "sts ver chk ded"] {
  if {![info exists mtdlurl($site,$tmpy)]} {set mtdlurl($site,$tmpy) ""}
 }
}
set mtdlurl(1,ded) ""
set mtdlurl(2,ded) "1"
#*** INI File Encryption Key
set inikey [encrypt $bname +lVeern3dAE1u2m4Z.j43rF1COudE1zNmcf0]
#*** Message variables
set hellomsg "whassup"
set passmsg  "pswd"
set identmsg "itsme"
set opmsg    "0p"
#*** Listen in on telnet port for: all
putlog "Trying to open telnet port..."
catch {listen $btelnet all} telnetport
if {$telnetport == "couldn't grab nearby port"} {
 putlog "ERROR!! -"
 putlog " "
 putlog "Couldn't open telnet port $btelnet\."
 putlog " - Possible Reasons:"
 putlog "   * Port is already in use by another eggdrop or application."
 putlog "   * The IP address you specified in the config file isn't valid."
 putlog " "
 set thisbot ""
 if {[string tolower $hubname] == [string tolower $bname]} { set thisbot "hub" }
 if {[string tolower $althubname] == [string tolower $bname]} { set thisbot "alt-hub" }
 if {$thisbot != ""} {
  die "Bot is $thisbot\, & cannot listen on telnet port, no use loading!"
 } else {
  putlog "Loading bot without using a telnet port..."
  putlog " "
 }
}
#*** Modules
set loadedtcls ""
if {[file exists modules]} {
 set mod-path "modules/"
 putlog "Loading modules from ${mod-path}\..."
} else {
 putlog "Loading modules..."
 set mod-path ""
}
loadmodule channels
loadmodule server
loadmodule ctcp
loadmodule irc
loadmodule transfer
loadmodule share
loadmodule notes
#loadmodule console
loadmodule assoc
loadmodule filesys
#*** Unbindings
unbind dcc - +chan *dcc:+chan
unbind dcc - -chan *dcc:-chan
unbind dcc - +user *dcc:+user
unbind dcc - -user *dcc:-user
unbind dcc - chattr *dcc:chattr
unbind dcc - chnick *dcc:chnick
unbind dcc - nick *dcc:nick
unbind dcc - +bot *dcc:+bot
unbind dcc - -bot *dcc:-bot
unbind dcc - adduser *dcc:adduser
unbind dcc - newpass *dcc:newpass
unbind dcc - chpass *dcc:chpass
unbind dcc - op *dcc:op
unbind dcc - tcl *dcc:tcl
unbind dcc - set *dcc:set
unbind dcc - help *dcc:help
unbind dcc - status *dcc:status
unbind dcc - save *dcc:save
unbind dcc - rehash *dcc:rehash
unbind dcc - restart *dcc:restart
unbind dcc - uptime *dcc:uptime
unbind dcc - notes *dcc:notes
unbind dcc - whom *dcc:whom
unbind dcc - die *dcc:die
unbind dcc - msg *dcc:msg
unbind dcc - act *dcc:act
unbind dcc - bots *dcc:bots
unbind dcc - motd *dcc:motd
unbind dcc - jump *dcc:jump
unbind dcc - clearqueue *dcc:clearqueue
unbind dcc - whois *dcc:whois
unbind dcc - match *dcc:match
unbind dcc - dump *dcc:dump
unbind dcc - nick *dcc:nick
unbind msg - hello *msg:hello
unbind msg - pass *msg:pass
unbind msg - ident *msg:ident
unbind msg - op *msg:op
unbind msg - addhost *msg:addhost
unbind msg - help *msg:help
unbind msg - info *msg:info
unbind msg - reset *msg:reset
unbind msg - jump *msg:jump
unbind msg - die *msg:die
unbind msg - email *msg:email
if {![info exists ctcps-bahunloaded]} {
 unbind ctcp - USERINFO *ctcp:userinfo
 unbind ctcp - CLIENTINFO *ctcp:clientinfo
}
set ctcps-bahunloaded 1
#*** Beginning Server List (Not Edited)
set servlist-tmpservs {
 irc.qeast.net
 irc.secsup.org
 irc.homelien.no
 irc.easynews.com
 irc.rt.ru
 efnet.demon.co.uk
 irc.mpls.ca
 irc.inet.tele.dk
 irc.daxnet.no
 irc.he.net
 irc.efnet.pl
 irc.inter.net.pl
 irc.isdnet.fr
 irc.flamed.net
 irc.prison.net
 irc.torix.ca
 irc.servercentral.net
 efnet.vuurwerk.nl
 irc.arcti.ca
 irc.hemmet.chalmers.se
 irc.blessed.net
 irc.weblook2k.com
 efnet.cs.hut.fi
 irc.mindspring.com
 irc.vrfx.com
 irc.wh.verio.net
 irc.banetele.no
 efnet.skynet.be
 irc.umn.edu
 irc.choopa.net
 irc.umich.edu
 irc.aloha.net
}
set servlist-tmpbadservs {
 none
}
#*** Commands/Bindings/etc
set cont-helpindex ""
proc addcmd {type flag cmd proc usage desc} {
 global cont-helpindex
 if {[lindex $type 1] != ""} { set type [join type |] }
 bind $type $flag $cmd $proc
 lappend cont-helpindex "\"$type\" \"$flag\" \"$cmd\" \"$usage\" \"$desc\""
}
proc addhelp {type flag cmd proc usage desc} {
 global cont-helpindex
 lappend cont-helpindex "\"$type\" \"$flag\" \"$cmd\" \"$usage\" \"$desc\""
}
addcmd dcc n tcl dcc_tcl "<code>" "Do some raw TCL coding"
addcmd dcc n set dcc_set "<variable> \[setting\]" "Sets a variable. Used for TCL"
addcmd dcc n restart dcc_restart "" "Restarts the bot (Reloads TCL/Files/Dis-Reconnects)"
addcmd dcc n syspass dcc_syspass "<chpass/verify/enable/disable> \[password\]" "System password management system"
addcmd dcc n distro dcc_distro "<allbots/bot>" "Distributes the TCL to all bots"
addcmd dcc n admin dcc_admin "<command/HELP> \[arguments\]" "Admin user access management system"
addcmd dcc n shell dcc_shell "<command/HELP> \[arguments\]" "Shows information about the shell account"
addcmd dcc n dccsend dcc_dccsend "<file> <Nickname to send file to>" "DCC Send a filename to a nick"
addcmd dcc n die dcc_die "" "Kills the bot totally"
addcmd dcc n idlestats dcc_idlestats "<on/off>" "Turns on/off misc statistics in the partyline from showing up"
addcmd dcc n addhub dcc_addhub "<hub-bot> <hostname/ip> <port> <temp pass> <irc nick>" "Easy way to add hub on leafs"
addcmd dcc n addleaf dcc_addleaf "<bot> <hostname/ip> <port> <temp pass> <irc nick>" "East way to add leafs from hub"
addcmd dcc n addleafinfo dcc_addleafinfo "" "Shows what to copy and paste on a leaf to automatically add the hub"
addcmd dcc n +bot dcc_+bot "<bot> <address>:<telnet port> \[hostmask\]" "The old and hard way to add bots"
addcmd dcc n -bot dcc_-user "<bot>" "Deletes a bot"
addcmd dcc n bncserv dcc_bncserv "<on/off/status/set/help> \[arguments\]" "Built-in BNC Server management system"
addcmd dcc n servlist dcc_servlist "<command/help> \[arguments\]" "Bot server list management system"
addcmd dcc n getops dcc_getops "<quickops/msgs> \[on/off\]" "Turns quick botnet ops and getops messages on or off"
addcmd dcc n cookieops dcc_cookieops "<on/off>" "Turns the +o-b security on or off"
addcmd dcc n update dcc_update "<download/stats/reset/help> \[args\]" "Updates the botpack's TCL through a HTTP connection"
addcmd dcc n putserv dcc_putserv "<server stuff>" "Sends a lot of junk you type to the server"
addcmd dcc t superbitch dcc_superbitch "<on/off/status/addchan/delchan/clear> \[#channel\]" "Superbitch feature. Secure channel management."
addcmd dcc t mmsg dcc_mmsg "<nick/#chan> <message>" "Botnet mass messages target a message"
addcmd dcc t mact dcc_mact "<nick/#chan> <message>" "Botnet mass acts a message to a target"
addcmd dcc t ctcp dcc_ctcp "<nick/#chan> <ctcp> \[times\]" "Bot CTCPs a target X times with user specific CTCP"
addcmd dcc t mnicks dcc_mnicks "<change/fix>" "All bots either change their nicks to a random string or fix their nicks back to normal"
addcmd dcc t mdop dcc_mdop "<#channel> <me/all/bot> \[random/alpha\]" "Mass deop's a channel using me(this bot), all(all bots), or bot(single bot). Default style is random."
addcmd dcc t mkick dcc_mkick "<#channel> \[*/bot1 bot2 bot3\]" "Mass kicks a channel using *(all bots) or a list of bots you provide"
addcmd dcc t infochan dcc_infochan "<#channel> <add/remove/show> \[info to add\]" "For a description line displayed when doing a .channels"
addcmd dcc t chanmode dcc_chanmode "<#channel> <modes>" "Sets modes on a channel to keep. For example: +tns"
addcmd dcc t mchanset dcc_mchanset "\[#&!+channel\] <settings>" "Changes channel setting for a channel. For example: +dynamicbans"
addcmd dcc t mchanmode dcc_mchanmode "<#channel> <setting>" "All bots set modes on a channel to keep. For example: +tns"
addcmd dcc t mquickops dcc_mquickops "<#channel>" "Makes all bots not op'd on a channel get op's REALLY FAST"
addcmd dcc t mjoin dcc_mjoin "<#channel> \[key\]" "Makes botnet join a channel"
addcmd dcc t mpart dcc_mpart "<#channel>" "Makes botnet part from a channel"
addcmd dcc t join dcc_join "<#channel> \[key\]" "Makes bot join a channel"
addcmd dcc t part dcc_part "<#channel>" "Makes bot part a channel"
addcmd dcc t jump dcc_jump "<server> \[port\]" "Jumps the bot to a different server"
addcmd dcc t mleakjoin dcc_mleakjoin "<#chan> <seconds>" "Makes botnet leak into a channel within X seconds"
addcmd dcc t mleakpart dcc_mleakpart "<#chan> <seconds>" "Makes botnet leak from a channel within X seconds"
addcmd dcc t mleak dcc_mleak "<status/cancel>" "Shows botnet leak status or cancel's current leak"
addcmd dcc t mrehash dcc_mrehash "<all/bot>" "Makes all bots or a single bot rehash"
addcmd dcc t clearqueue *dcc:clearqueue "<mode|server|help|all>" "Bot clears specific type of queue you say from the server queue"
addcmd dcc t mclearqueue dcc_mclearqueue "<mode|server|help|all>" "Botnet clears specific type of queue you say from the server queue"
addcmd dcc t makebot dcc_makebot "<bot> <command/help> \[arguments\]" "Makes a bot do a command descriped in the command help"
addcmd dcc t cycle dcc_cycle "<#channel>" "Makes the bot cycle a channel (Memorizes key)"
addcmd dcc t rehash dcc_rehash "" "Makes the bot reload config file and all other bot files"
addcmd dcc t lock dcc_lock "<#channel> \[reason\]" "Locks down a channel and kick all non-users"
addcmd dcc t unlock dcc_unlock "<#channel>" "Un-locks a channel and resets channel modes"
addcmd dcc t chanlimit dcc_chanlimit "<on/off/do/status/addchan/delchan> \[channel\]" "Channel limiter management system"
addcmd dcc t mchanchk dcc_mchanchk "" "Checks all bots to see if they're in channels they shouldn't be"
addcmd dcc t pserver dcc_pserver "<stats/set/docheck/help> \[arguments\]" "Prefered server system"
addcmd dcc t uptime dcc_uptime "<bot/shell> \[allbots/bot\]" "Displays bot's uptime and shell uptime"
addcmd dcc t uname dcc_uname "<-flag> \[allbots/bot\]" "Displays bot's shells uname"
addcmd dcc t ircn dcc_ircn "<command/help> \[arguments\]" "ircN cloning feature"
addcmd dcc m status dcc_status "" "Shows the current status of the bot"
addcmd dcc m channels dcc_channels "" "Shows list of channels along with description and who joined them"
addcmd dcc m msave dcc_msave "" "Botnet saves user file and channel file"
addcmd dcc m botlag dcc_botlag "<all/bot>" "Shows lag between all bots or a specific bot"
addcmd dcc m servlag dcc_servlag "<bot/me/all>" "Shows server lag of current bot, all bots, or a custom bot"
addcmd dcc m checkpass dcc_checkpass "<all/users/bots>" "Checks users, bots, or all(both) if they don't have a password set"
addcmd dcc m checkhost dcc_checkhost "<hosts>" "Checks all user's host for a host you specify"
addcmd dcc m massop dcc_massop "<#channel> \[hostmask\]" "Mass op's all registered users on a channel with option of including a hostmask"
addcmd dcc m bots dcc_bots "" "Shows a list of linked bots & displays unlinked bots and botnet status"
addcmd dcc m opall dcc_opall "<nick>" "Op's a nick on all chans that the bot and nick are on if the nick is a valid op"
addcmd dcc m dopall dcc_dopall "<nick>" "Deop's a nick on all channel's he and the bot is on"
addcmd dcc m swhois dcc:swi_swhois "<nick>" "Does a /whois on a nick and shows it in the partyline"
addcmd dcc m swhowas dcc:swi_swhowas "<nick>" "Does a /whowas on a nick and shows it in the partyline"
addcmd dcc m mservers dcc_mservers "" "Shows a list of all the servers the botnet is connected on"
addcmd dcc m mversion dcc_mversion "" "Displays the botnet's Eggdrop version and Contagious botpack version"
addcmd dcc m save dcc_save "" "Makes bot save its userfile"
addcmd dcc m showfields showfields "" "Displays fields that you can type .<field> to change yourself or .ch<field> to change someone else's"
addcmd dcc m msg *dcc:msg "<#chan/nick> <message>" "Private message's a channel or nick a personal message"
addcmd dcc m act *dcc:act "<#chan/nick> <message to act>" "Acts a message to a channel or nick"
addcmd dcc m chnick dcc_chnick "<oldnick> <newnick>" "Changes a current username to another you specify"
addcmd dcc "m m" match dcc_match "<nick/host> \[\[skip\] count\]" "Matches usernames, hosts, and all sorts of stuff, etc."
addcmd dcc "m m" +user dcc_+user "<handle> \[hostmask\]" "Adds a user to the bot without any flags"
addcmd dcc "m m" -user dcc_-user "<handle>" "Deletes a user from the bot"
addcmd dcc "m m" adduser dcc_adduser "<nick> \[handle\]" "Adds a nick from IRC using their hostmask from a channel they're on"
addcmd dcc "m m" chattr dcc_chattr "<handle> \[changes\] \[channel\]" "Changes the attributes(flags) of a handle"
addcmd dcc "m m" chpass dcc_chpass "<handle> \[password\]" "Changes a handles password to nothing(if you type nothing) or a custom pass"
addcmd dcc "o o" limit dcc_limit "<#channel> <#/+#/-#/off>" "Changes limit to a number, or +/- a number, or turns the limit off (only sets the mode - not same as .chanlimit)"
addcmd dcc "p o" dns dcc_dns "<hostname/ip>" "Resolves a hostname or ip and shows you the results"
addcmd dcc "p o" op dcc_op "<nick> \[channel\]" "Ops a nickname on a channel"
addcmd dcc p getkey dcc_getkey "<#channel>" "Displays the key for you of a channel if you don't know it"
addcmd dcc p whois dcc_whois "<handle>" "Displayed information after the handle you specify"
addcmd dcc p whom dcc_whom "\[*\]" "With no argument shows who's on the bot, with the *, shows who's online across the botnet"
addcmd dcc p mnote dcc_mnote "<flag> \[#channel\] <message>" "Without channel specified, it notes all global users with flag you requested. With a chan it notes all users with channel flag."
addcmd dcc p help dcc_help "\[command\]" "Shows what your seeing right now"
addcmd dcc p contagious dcc_contagious "" "Displays this botpack's information"
addcmd dcc p notes *dcc:notes2 "\[all/bot\] <index/read/erase>" "Notes system. Read notes or erase them"
addcmd dcc p newpass dcc_newpass "<pass>" "Changes your password"
addcmd dcc p remind dcc_remind "<add/remove> \[# of minutes\] \[reminder message\]" "Reminds you a message in X minutes"
addcmd dcc p ping dcc_ping "\[irc nick\]" "Masters can ping anyone but 'peons' can only ping themselves. This command also returns a reply"
addcmd dcc p loadedtcls dcc_loadedtcls "" "Basically shows a list of big features done in TCL for this botpack"
addcmd dcc p motd dcc_motd "\[on/off/set/read\] \[message to set\]" "Owners can set the motd, non-owners can only view the motd"
addcmd dcc p whois *dcc:whois "<handle>" "Shows you information about a user"
addcmd dcc p hump dcc_hump "<who>" "Humps whoever you type on the partyline"
addcmd dcc p picknumbers dcc_picknumbers "<# of numbers> <from # - to #>" "Picks a random set of numbers you want"
addcmd dcc p nick dcc_nick "<new-handle>" "Changes your current username to another one"
addcmd msg - $opmsg msg_op "<password> \[system password\]" "Use this to message a bot to get ops. If system pass is enabled, you must enter it"
addcmd msg - $hellomsg msg_hello "" "Use this to message a bot when you start it for the first time"
addcmd msg - $passmsg msg_pass "\[password\]" "Use this command to set your password if it's blank or to see if you have a password already set"
addcmd msg - $identmsg msg_ident "<pass> <handle> \[system password\]" "Use this command to identify yourself to the bot if your host isn't on it."
bind msg - servlag msg_servlag
bind msg - $antiidlemsg msg_antiidle
bind chon - * proc_secauthdcc
bind link - * proc_botlinked
bind join - * join_lockcheck
bind join - * join_checkpass
bind join - * join_autoop
bind join - * join_autovoice
bind join - * join_getopchk
bind mode - * sb_bitch
bind mode - * mode_getopchk
bind mode - * mode_adminprot
bind kick - * kick_adminprot
bind evnt - sighup evnt_sighup
bind ctcp - "VERSION" ctcp_version
bind ctcp - "TIME" ctcp_time
bind ctcp - "FINGER" ctcp_finger
bind ctcr - PING ctcr_pingreply
bind filt - "\001ACTION *\001" filt_dcc_action
bind filt - "/me *" filt_telnet_action
bind bot b bot_botlag botlag_bot
bind bot b bot_botlagreply botlagreply_bot
bind bot b bot_mleak mleak_bot
bind bot b bot_mjoin mjoin_bot
bind bot b bot_mpart mpart_bot
bind bot b bot_mrehash mrehash_bot
bind bot b bot_msave msave_bot
bind bot b bot_mchanmode mchanmode_bot
bind bot b bot_mchanset mchanset_bot
bind bot b gop botnet_request
bind bot b gop_resp gop_resp
bind bot b bot_mmsg mmsg_bot
bind bot b bot_mact mact_bot
bind bot b bot_infochan infochan_bot
bind bot b bot_rawalldo rawalldo_bot
bind bot b bot_mservers mservers_bot
bind bot b bot_mservreply mservreply_bot
bind bot b bot_mchanchk mchanchk_bot
bind bot b bot_chanchkreply chanchkreply_bot
bind bot b bot_mversion mversion_bot
bind bot b bot_mversionreply mversionreply_bot
bind bot b bot_mnicks mnicks_bot
bind bot b bot_mclearqueue mclearqueue_bot
bind bot b bot_mleakjoin mleakjoin_bot
bind bot b bot_mleakpart mleakpart_bot
bind bot b bot_servlag servlag_bot
bind bot b bot_servlagreply servlagreply_bot
bind bot b bot_linked linked_bot
bind bot b bot_lock lock_bot
bind bot b bot_unlock unlock_bot
bind bot b bot_lockkick lockkick_bot
bind bot b bot_makebot makebot_bot
bind bot b bot_admin admin_bot
bind bot b bot_mquickops mquickops_bot
bind bot b notes2: *bot:notes2
bind bot b notes2reply: *bot:notes2reply
bind bot b bot_mdop mdop_bot
bind bot b bot_distro distro_bot
bind bot b bot_distromsg distromsg_bot
bind bot b bot_evnthup evnthup_bot
bind bot b bot_uptime uptime_bot
bind bot b bot_uptimemsg uptimemsg_bot
bind bot b bot_servlist servlist_bot
bind bot b bot_servlistmsg servlistmsg_bot
bind bot b bot_ircn ircn_bot
bind bot b bot_uname uname_bot
bind bot b bot_unamemsg unamemsg_bot
bind bot b bot_relayop relayop_bot
bind bot b bot_verifyop verifyop_bot
bind bot b bot_updatecmd updatecmd_bot
bind bot b bot_updatemsg updatemsg_bot
#*** TCL Scripting to set a few required settings
if {![file exists $bdir]} {
 file mkdir $bdir
}
if {[info exists windrop]} {
 if {![file exists tmp]} {
  file mkdir tmp
 }
 set temp-path "tmp/"
}
#if {([lsearch [string tolower [unames]] *win*] != "-1") && (![info exists windrop])} {
# putlog " "
# putlog "              -=\[Contagious\]=-"
# putlog " This Eggdrop is running on the follwing o/s:"
# putlog "              [unames]"
# putlog " "
# putlog " Contagious V[lindex $ver 0] will not run on this o/s!"
# putlog " "
# putlog "Killing Eggdrop V[lindex $version 0]..."
# putlog " "
# die "TCL incompatible with o/s: [unames]"
#}
set system [unames]
putlog "Setting system: $system"
#*** File variables
set userfile "$bdir/.[string tolower $bname].user"
set chanfile "$bdir/.[string tolower $bname].chan"
set notefile "$bdir/.[string tolower $bname].notes"
set tempfile "$bdir/.[string tolower $bname].temp"
set distfile "$bdir/.[string tolower $bname].dist"
set mainini "$bdir/.[string tolower $bname].ini"
set motd "$bdir/.[string tolower $bname].motd"
set telnet-banner "$bdir/.[string tolower $bname].telnet-banner"
#*** Channel Variables
set global-flood-chan 10:3
set global-flood-deop 4:2
set global-flood-kick 4:3
set global-flood-join 5:10
set global-flood-ctcp 5:60
set global-idle-kick 0
if {([string tolower $bname] == [string tolower $hubname]) || ([string tolower $bname] == [string tolower $althubname])} {
 set global-chanset {
  -clearbans +enforcebans +dynamicbans +userbans -autoop -bitch -greet +protectops -statuslog -stopnethack
  -revenge -secret +autovoice +cycle +dontkickops +wasoptest -inactive +protectfriends +shared -seen
  +userexempts +dynamicexempts +userinvites +dynamicinvites
 }
} else {
 set global-chanset {
  -clearbans -enforcebans +dynamicbans +userbans -autoop -bitch -greet +protectops -statuslog -stopnethack
  -revenge -secret -autovoice +cycle +dontkickops +wasoptest -inactive +protectfriends +shared -seen
  +userexempts +dynamicexempts +userinvites +dynamicinvites
 }
}
set global-chanmode "[string range $globalchanmodes 1 end]"
channel add $bchan {
 need-op "get op $bchan"
 need-invite "get invite $bchan"
 need-unban "get unban $bchan"
 need-limit "get limit $bchan"
 need-key "get key $bchan"
 idle-kick 0
}
foreach var ${global-chanset} {
 channel set $bchan $var
}
channel set $bchan chanmode $globalchanmodes
#*** Variables needed by Eggdrop itself
set notify-newusers "$owner"
set nick "[string range $bname 0 8]"
set altnick "_[string range $bname 0 7]"
set username "[string tolower $bname]"
set offset "5"
set max-logs 5
set max-logsize 0
set quick-logs 0
if {$logging} {
 logfile mco * "$bdir/.[string tolower $bname].log"
 logfile jk $bchan "$bdir/.[string tolower $bname].[string tolower [string range $bchan 1 end]].log"
}
set log-time 1
set keep-all-logs 0
set switch-logfiles-at 500
set quiet-save 0
set console "mcobxs"
set sort-users 1
set help-path "/help"
if {![info exists temp-path]} { set temp-path "/tmp" }
set botnet-nick "$bname"
set protect-telnet 1
set dcc-sanitycheck 1
set ident-timeout 4
set require-p 1
set open-telnets 0
set stealth-telnets 1
if {[file exists ${telnet-banner}]} {
 set use-telnet-banner 1
} else {
 set use-telnet-banner 0
}
set connect-timeout 10
set dcc-flood-thr 3
set telnet-flood 5:60
set paranoid-telnet-flood 0
set resolve-timeout 8
if {$usefirewall} {
 set firewall "$fwallserv"
}
set ignore-time 15
set hourly-updates 00
set default-flags ""
set whois-fields ""
set remote-boots 1
set die-on-sighup 0
set die-on-sigterm 0
set must-be-owner 0
set max-dcc 100
set dcc-portrange 1024:65535
set enable-simul 1
set allow-dk-cmds 1
set ban-time 60
set exempt-time 30
set invite-time 60
set share-greet 0
set use-info 1
set net-type 0
set init-server {
 putserv "MODE $botnick +i-ws"
 set serverlag 0
}
set keep-nick 1
set use-ison 1
set strict-host 0
set quiet-reject 1
set lowercase-ctcp 0
set answer-ctcp 3
set flood-msg 15:60
set flood-ctcp 3:60
set never-give-up 1
set strict-servernames 0
set default-port 6667
set server-cycle-wait 5
set server-timeout 5
set servlimit 0
set check-stoned 1
set use-console-r 0
set debug-output 0
set serverror-quit 1
set max-queue-msg 900
set trigger-on-ignore 0
set double-mode 0
set double-server 0
set double-help 0
set ctcp-mode 0
set bounce-bans 1
set bounce-modes 0
set kick-bogus-bans 1
set bounce-bogus-bans 1
set max-bans 20
set allow-desync 0
set kick-bogus 1
set ban-bogus 0
set kick-fun 1
set ban-fun 1
set learn-users 0
set wait-split 600
set wait-info 180
set mode-buf-length 200
set no-chanrec-info 0
set revenge-mode 1
set bounce-exempts 0
set bounce-invites 0
set max-exempts 20
set max-invites 20
set bounce-bogus-exempts 0
set kick-bogus-exempts 0
set bounce-bogus-invites 0
set kick-bogus-invites 0
set use-exempts 0
set use-invites 0
set prevent-mixing 1
set kick-method 1
set modes-per-line 4
set use-354 0
set rfc-compliant 1
set max-dloads 50
set dcc-block 0
set copy-to-tmp 1
set xfer-timeout 30
set allow-resync 0
set resync-time 900
set files-path "$bdir/"
set incoming-path "$bdir/"
set upload-to-pwd 0
set filedb-path ""
set max-file-users 999
set max-filesize 1024
set max-notes 50
set note-life 60
set allow-fwd 0
set notify-users 1
set notify-onjoin 1
set console-autosave 1
set force-channel 0
set info-party 0
#*** To show that TCL is loading
putlog "Loading TCL commands and interface..."
#*** Other little procs made to make TCL work nicely
proc b {} { return "" }
proc u {} { return "" }
proc r {} { set i [rand 2]; if {$i == 0} {return ""} else {return ""} }
proc h {handle} {
 set h [string tolower $handle]
 if {[isadmin $h]} {
  set flag "Admin"
 } else {
  if {[matchattr $h n]} {
   set flag "Owner"
  } else {
   if {[matchattr $h m]} {
    set flag "Master"
   } else {
    if {[matchattr $h t]} {
     set flag "B-Net Mstr"
    } else {
     if {[matchattr $h o]} {
      set flag "Op"
     } else {
      set flag "Lamer"
     }
    }
   }
  }
 }
 set a "("
 set b "|$flag)"
 return "$a$handle$b"
}
proc sb {} {
 global spiffyeggdrop
 if {$spiffyeggdrop} {
  return ""
 } else {
  return ""
 }
}
proc su {} {
 global spiffyeggdrop
 if {$spiffyeggdrop} {
  return ""
 } else {
  return ""
 }
}
proc col {color} {
 if {!$color} {
  return ""
 } else {
  return "$color"
 }
}
proc randstring {length} {
 set string ""
 set chars abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
 set count [string length $chars]
 for {set i 0} {[expr $i < $length]} {incr i} {
  append string [string index $chars [rand $count]]
 }
 return $string
}
proc randomize {list} {
 set randlist ""
 while {[llength $list] > 0} {
  set random [rand [llength $list]]
  lappend randlist [lindex $list $random]
  set list [lreplace $list $random $random]
 }
 return $randlist
}
proc cont {arg} {
 global ver spiffyeggdrop vermt
 set cmd [lindex $arg 0]
 set arg [lrange $arg 1 end]
 switch -exact -- $cmd {
  "-c" {
   if {!$spiffyeggdrop} {
    if {$arg == ""} {
     return "Contagious:"
    } else {
     return "Contagious: $arg"
    }
   } else {
    if {$arg == ""} {
     return "[b]Co[b][u]nt[u]a[b]gi[b]o[b][u]u[u][b]s[u][b]:[b][u]"
    } else {
     return "[b]Co[b][u]nt[u]a[b]gi[b]o[b][u]u[u][b]s[u][b]:[b][u] $arg"
    }
   }
  }
  "-e" {
   if {!$spiffyeggdrop} {
    return "Error:"
   } else {
    return "[u][b]E[b]rror[b]:[b][u]"
   }
  }
  "-lf" {
   if {!$spiffyeggdrop} {
    return "Contagious+MT V[lindex $ver 0]/V$vermt - By Silverado <silverado@roadrunner.nf.net> / MTrez <rezzie@rezzie.net>"
   } else {
    return "[b]Co[b][u]nt[u]a[b]gi[b]o[b][u]u[u][b]s[b][u]+MT[u] [b]V[b][u][lindex $ver 0][u] - [b]B[b]y [b][u]Silverado[u] <[b][u]silverado[u][b]@[b][u]roadrunner.nf.net[u][b]>[b] / [b][u]MTrez[u] <[b][u]rezzie[u][b]@[b][u]rezzie.net[u][b]>[b]"
   }
  }
  "-r" {
   if {!$spiffyeggdrop} {
    return "[ctime [lindex $ver 1]]"
   } else {
    set a [ctime [lindex $ver 1]]
    set day "[b][lindex $a 0]"
    set mon "[lindex $a 1][b]"
    set dat "[u][lindex $a 2][u]"
    set tim "[b][u][lindex $a 3][b][u]"
    set yea "[b][lindex $a 4][b]"
    return "[ctime [lindex $ver 1]]"
   }
  }
  "-s" {
   if {!$spiffyeggdrop} {
    return "Status:"
   } else {
    return "[b]Status[b][u]:[u]"
   }
  }
  "-sf" {
   if {!$spiffyeggdrop} {
    return "Contagious+MT V[lindex $ver 0]/V$vermt"
   } else {
    return "[b]Co[b][u]nt[u]a[b]gi[b]o[b][u]u[u][b]s[b][u]+MT[u] [b]V[b][u][lindex $ver 0][u]/[b]V[b][u]$vermt[u]"
   }
  }
  "-u" {
   if {!$spiffyeggdrop} {
    return "Usage:"
   } else {
    return "[b]U[b]sage[u][b]:[b][u]"
   }
  }
  "-v" {
   return "[lindex $ver 0]/$vermt"
  }
  "-w" {
   if {!$spiffyeggdrop} {
    return "Warning:"
   } else {
    return "[u]![u][b]W[b][u]arnin[u][b]g[b][u]![u]:"
   }
  }
 }
}
proc goodt {s} {
 set d [expr $s / 60 / 60 / 24]
 set h [expr ($s / 60 / 60) - ($d * 24)]
 set m [expr ($s / 60) - ($d * 24 * 60 + $h * 60)]
 if !$d {
  if !$h {
   if !$m {
    return "0min"
   }
   return "${m}min"
  }
  return "${h}hr${m}min"
 }
 return "${d}dy${h}hr${m}min"
}
proc isin {a b} {
 if {[lsearch [string tolower $b] [string tolower $a]] != -1} {
  return 1
 } else {
  return 0
 }
}
proc gettime {} {
 set ctime [ctime [unixtime]]
 set day [lindex $ctime 0]
 set month [lindex $ctime 1]
 set date [lindex $ctime 2]
 set hour [lindex [split [lindex $ctime 3] :] 0]
 set minute [lindex [split [lindex $ctime 3] :] 1]
 set second [lindex [split [lindex $ctime 3] :] 2]
 if {$hour >= 12} {
  set prefix "pm"
  if {$hour != "12"} {
   set hour [expr $hour - 12]
  }
 } else {
  set prefix "am"
 }
 if {[string index $hour 0] == "0"} {
  set hour [string index $hour 1]
 }
 set year [lindex $ctime 4]
 if {$date >= 10} {
  set a $date
 } else {
  set a [string index $date 1]
 }
 switch -exact $a {
  "1" {
   set date "$date\st"
  }
  "2" {
   set date "$date\nd"
  }
  "3" {
   set date "$date\rd"
  }
  default {
   set date [join "$date th" ""]
  }
 }
# if {[isin a $switches]} {
  set return "$day, $month. $date, $year at $hour:$minute:$second$prefix"
# } else {
#  set return "0"
# }
 return $return
}
proc warnchan {cmd msg hand} {
 global bchan
 if {$hand == ""} {
  putserv "PRIVMSG $bchan :[sb]![sb][su]Attention[su][sb]![sb] [su]$cmd[su] [sb]-[sb] $msg"
 } else {
  putserv "PRIVMSG $bchan :[sb]![sb][su]Attention[su][sb]![sb] [sb]$hand[sb] did: [su]$cmd[su] [sb]-[sb] $msg"
 }
 return 0
}
proc isadmin {user} {
 global admins
 if {[lsearch [string tolower $admins] [string tolower $user]] != "-1"} {
  if {$user != "*"} {
   return 1
  } else {
   return 0
  }
 } else {
  return 0
 }
}
proc ishub {} {
 global hubname bname
 if {[string tolower $bname] == [string tolower $hubname]} {
  return 1
 } else {
  return 0
 }
}
proc isalthub {} {
 global althubname bname
 if {[string tolower $bname] == [string tolower $althubname]} {
  return 1
 } else {
  return 0
 }
}
proc ishuboralthub {} {
 global hubname althubname bname
 if {([string tolower $bname] == [string tolower $hubname]) || ([string tolower $bname] == [string tolower $althubname])} {
  return 1
 } else {
  return 0
 }
}
proc issharebot {bot} {
 set return 0
 if {[validuser $bot]} {
  if {[getuser $bot botfl] != ""} {
   set return 1
  }
 }
 return $return
}
proc sharebots {} {
 set bots ""
 foreach bot [bots] {
  if {[validuser $bot]} {
   set bots "$bots$bot "
  }
 }
 return $bots
}
proc kill_timer {timer} {
 if {$timer != ""} {
  foreach i [timers] {
   if {[lindex $i 1] == $timer} {
    killtimer [lindex $i 2]
   }
  }
 }
}
proc fstring {text length} {
 if {[isnumber $length]} {
  if {[string length $text] == $length || [string length $text] > $length} {
   return "[string range $text 0 [expr $length - 1]]"
  } else {
   set a [string length $text]
   set b $text
   while {$a < $length} {
    set b "$b "
    incr a
   }
   return "$b"
  }
 }
}
if {[ishub]} {
 set private-owner 1
 set private-user 1
 set private-global 1
 set private-globals "mnot"
} else {
 set private-global 0
 set private-owner 0
 set private-user 0
 set private-globals ""
}
#*** Main Procs
putlog "Loading Contagious botpack..."
proc dcc_save {hand idx arg} {
 *dcc:save $hand $idx $arg
 return 0
}
proc dcc_rehash {hand idx arg} {
 *dcc:rehash $hand $idx $arg
 return 0
}
proc dcc_restart {hand idx arg} {
 if {![isadmin $hand]} {
  putidx $idx "[cont -e] No authorization."
  return 0
 }
 *dcc:restart $hand $idx $arg
 return 0
}
proc dcc_status {hand idx arg} {
 global lockedchans
 *dcc:status $hand $idx $arg
 if {$lockedchans == ""} {
  set lchans "None"
  set lchannum 0
 } else {
  set lchans $lockedchans
  set lchannum [llength $lchans]
 }
 putidx $idx "  Locked Channels:   $lchans ($lchannum total)"
 putidx $idx " -"
 putidx $idx " For extra channel information, type .channels"
 return 0
}
proc dcc_channels {hand idx arg} {
 global lockedchans server serverlag botnick mainini
 putcmdlog "#$hand# channels $arg"
 if {$server == ""} {
  set serv "Offline, but trying to connect!"
 } else {
  set serv "on [lindex [split $server :] 0] port [lindex [split $server :] 1] ($serverlag\s lag)"
 }
 putidx $idx "Currently $serv"
 if {$server != ""} {
  putidx $idx "Online as $botnick![getchanhost $botnick]"
 }
 putidx $idx " "
 putidx $idx "[sb]Channels[sb][su]:[su] [channels]"
 putidx $idx " "
 set opdin 0
 set voicedin 0
 set normin 0
 foreach chan [channels] {
  set status ""
  set oplist ""
  set voicelist ""
  set normlist ""
  set locked ""
  if {[botonchan $chan]} {
   if {[botisop $chan]} {
    set status "@"
    incr opdin
   } else {
    if {[botisvoice $chan]} {
     set status "+"
     incr voicedin
    } else {
     set status "!"
     incr normin
    }
   }
  }
  if {$status == ""} {
   set status "!"
  }
  foreach a [chanlist $chan] {
   if {[isop $a $chan]} {
    lappend oplist $a
   } else {
    if {[isvoice $a $chan]} {
     lappend voicelist $a
    } else {
     lappend normlist $a
    }
   }
  }
  set oplist [llength $oplist]
  set voicelist [llength $voicelist]
  set normlist [llength $normlist]
  if {[lsearch [string tolower $lockedchans] [string tolower $chan]] != "-1"} {
   set locked "Yes"
  } else {
   set locked "No "
  }
  putidx $idx " [sb]:->[sb] $chan"
  set chanmodes [getchanmode $chan]
  set limit ""
  set key ""
  if {[lsearch [lindex $chanmodes 0] *l*] != "-1"} {
   if {[lsearch [lindex $chanmodes 0] *k*] == "-1"} {
    set limit " \[[sb]L[sb]:[fstring [lindex $chanmodes 1] 3]\]"
   } else {
    set limit " \[[sb]L[sb]:[fstring [lindex $chanmodes 2] 3]\]"
   }
  }
  if {[lsearch [lindex $chanmodes 0] *k*] != "-1"} {
   set key " \[[sb]K[sb]:[fstring [lindex $chanmodes 1] 10]\]"
  }
  putidx $idx "    [su]$status[su] - [fstring "\[[sb]O[sb]:$oplist\]\[[sb]V[sb]:$voicelist\]\[[sb]N[sb]:$normlist\]\[[sb]T[sb]:[llength [chanlist $chan]]\]" 39]\[[sb]Locked[sb]:$locked\]\[[sb]Modes[sb]:[fstring [lindex $chanmodes 0] 8]\]$limit$key"
  set chaninfo [ini_read $mainini chaninfo [string tolower $chan]]
  if {($chaninfo == "") || ($chaninfo == ";")} {
   set chaninfo1 "Unknown"
   set chaninfo2 "Unknown"
   set chaninfo3 ""
  } else {
   set chaninfo1 [lindex $chaninfo 0]
   set chaninfo2 [ctime [lindex $chaninfo 1]]
   set chaninfo3 [lindex $chaninfo 1]
  }
  set infochan "[ini_read $mainini infochan [string tolower $chan]]"
  if {$chaninfo3 != ""} {
   putidx $idx "      [sb]Joined By[sb]: [fstring $chaninfo1 17] [sb]At[sb]: $chaninfo2 [sb][su]-[sb][su] [goodt [expr [unixtime] - $chaninfo3]] ago"
  } else {
   putidx $idx "      [sb]Joined by[sb]: [fstring $chaninfo1 17] [sb]At[sb]: $chaninfo2"
  }
  if {$infochan != ";"} {
   putidx $idx "        [sb]Extra Info[sb]: $infochan"
  }
 }
 putidx $idx " "
 putidx $idx "\[[sb]Channels[sb]: [su][llength [channels]][su]\] - \[[sb]Bot Stats[sb]: [sb]+o([sb][su]$opdin[su][sb]) +v([sb][su]$voicedin[su][sb]) +-([sb][su]$normin[su][sb])[sb]\]"
 return 0
}
proc dcc_infochan {hand idx arg} {
 global mainini
 set chan [string tolower [lindex $arg 0]]
 set cmd [string tolower [lindex $arg 1]]
 set info "[lrange $arg 2 end]"
 if {$cmd == ""} {
  putidx $idx "[cont -u] infochan <#channel> <add/remove/show> \[info to add\]"
 } else {
  switch -exact $cmd {
   "add" {
    if {![validchan $chan]} {
     putidx $idx "[cont -e] I'm not on $chan"
    } else {
     if {$info == ""} {
      putidx $idx "[cont -u] infochan $chan $cmd <Info to add to channel>"
     } else {
      putcmdlog "#$hand# infochan $chan $cmd $info"
      putidx $idx "Adding infoline to $chan: $info"
      ini_write $mainini infochan $chan $info
      putidx $idx "Done! Updating all bots..."
      putallbots "bot_infochan add $chan $info"
     }
    }
    return 0
   }
   "remove" {
    if {![validchan $chan]} {
     putidx $idx "[cont -e] I'm not monitoring $chan"
    } else {
     if {[ini_read $mainini infochan $chan] == ";"} {
      putidx $idx "[cont -e] $chan doesn't have an infoline set"
     } else {
      putcmdlog "#$hand# infochan $chan $cmd"
      putidx $idx "Removing extra channel info for $chan"
      ini_remove $mainini infochan $chan
      putidx $idx "Done! Updating all bots..."
      putallbots "bot_infochan remove $chan"
     }
    }
    return 0
   }
   "show" {
    if {![validchan $chan]} {
     putidx $idx "[cont -e] I'm not monitoring $chan"
    } else {
     if {[ini_read $mainini infochan $chan] == ";"} {
      putidx $idx "[cont -e] $chan doesn't have an infoline set"
     } else {
      putcmdlog "#$hand# infochan $chan $cmd $info"
      putidx $idx "Infoline for $chan: [ini_read $mainini infochan $chan]"
     }
    }
    return 0
   }
  }
  putidx $idx "[cont -e] Second argument must be one of <add/remove/show>"
 }
 return 0
}
proc infochan_bot {frombot cmd arg} {
 global mainini
 set cmd [lindex $arg 0]
 set chan [lindex $arg 1]
 set info [lrange $arg 2 end]
 switch -exact $cmd {
  "add" {
   ini_write $mainini infochan $chan $info
  }
  "remove" {
   ini_remove $mainini infochan $chan
  }
 }
 return 0
}
proc dcc_whom {hand idx arg} {
 if {$arg != "*"} {
  *dcc:whom $hand $idx $arg
  return
 }
 putcmdlog "#$hand# whom $arg"
 putidx $idx "Users accross the botnet"
 putidx $idx " Nick      Chanl Bot       Idle   Away Host"
 putidx $idx " --------- ----- --------- ------ ---- ------------------------------"
 foreach person [whom *] {
  set nck [lindex $person 0]
  set bot [lindex $person 1]
  set hst [lindex $person 2]
  set sts [lindex $person 3]
  set idl [lindex $person 4]
  set awy [lindex $person 5]
  set chn [lindex $person 6]
  if {$sts == "-"} {set sts " "}
  if {$chn > 99999} {set chn "local"}
  if {$chn == "-1"} {set chn "off"}
  set d [expr $idl / 1440]
  set h [expr [expr $idl % 1440] / 60]
  set m [expr [expr $idl % 1440] % 60]
  set nid "${d}d${h}h"
  if {$d == "0" && $h == "0"} {set nid "${m} min"}
  if {$d == "0" && $h != "0"} {set nid "${h}h${m}m"}
  if {[lindex $hst 1] == $bot} {set hst [lindex $hst 0]}
  if {$awy != ""} {set aws "Yes"} {set aws "No"}
  putidx $idx [format "%-10s %-5s %-9s %-6s %-4s %-1s" ${sts}$nck $chn $bot $nid $aws $hst]
 }
}
proc dcc_die {hand idx arg} {
 global ircN-version ircN-reldate
 if {![isadmin $hand]} {
  putidx $idx "[cont -e] No authorization"
  return 0
 } else {
  set syspass [lindex $arg 0]
  if {$syspass == ""} {
   set msg $arg
  } else {
   set msg [lrange $arg 1 end]
  }
  if {$msg == ""} {
   set msg "irc[b]N[b] ${ircN-version} for mIRC (${ircN-reldate})"
  }
  if {[syspass status ""]} {
   if {$syspass == ""} {
    putidx $idx "[cont -u] die <system password> \[reason\]"
   } else {
    if {[syspass verify $syspass]} {
     putcmdlog "#$hand# die *SYSTEM PASSWORD* [lrange $arg 2 end]"
     putquick "QUIT :$msg"
     die "user requested ($hand)"
    } else {
     putidx $idx "[cont -e] Incorrect system password"
    }
   }
  } else {
   putcmdlog "#$hand# die $arg"
   putquick "QUIT :$msg"
   die "user requested ($hand)"
  }
 }
 return 0
}
proc dcc_jump {hand idx arg} {
 global ircN-version ircN-reldate
 set msg "irc[b]N[b] ${ircN-version} for mIRC (${ircN-reldate})"
 putquick "QUIT :$msg"
 *dcc:jump $hand $idx $arg
 return 1
}
lappend loadedtcls "Redone basic bot commands"
if {![file exists $mainini]} {
 set afile "[open $mainini w]"
 close $afile
 unset afile
}
proc ini_read {inifile section item} {
  global inikey
  set item [lindex $item 0]
  if {[lindex $inifile 0] == "" || [lindex $section 0] == "" || [lindex $item 0] == ""} { return "\;" }
  if {![file exists $inifile]} { return "\;" }
  set fileo [open $inifile r]
  set sect ""
  while {![eof $fileo]} {
    set rline [decrypt $inikey [gets $fileo]]
    set rline [string trim $rline]
    if {$rline != "" || [string index $rline 0] != "\;"} {
      if {[string index $rline 0] == "\[" && [string index $rline [expr [string length $rline] - 1]] == "\]"} {
        set sect [string range $rline 1 [expr [string length $rline] - 2]]
      } elseif {[string tolower $sect] == [string tolower $section]} {
        set im [string tolower [string range $rline 0 [expr [string first = $rline] - 1]]]
        set va [string range $rline [expr [string first = $rline] + 1] end]
        set itm(${im}) $va
      }
    }
  }
  close $fileo
  unset fileo
  if {[array names itm [string tolower $item]] == ""} { return "\;" }
  set rtrn [set itm([string tolower $item])]
  return $rtrn
}
proc ini_write {inifile section item value} {
  global inikey
  set section [lindex [string tolower $section] 0]
  if {[lindex $inifile 0] == "" || [lindex $section 0] == "" || [lindex $item 0] == ""} { return 0 }
  if {![file exists $inifile] || [file size $inifile] == 0} {
    set filew [open $inifile w]
    puts $filew [encrypt $inikey "\[$section\]"]
    puts $filew [encrypt $inikey "[string tolower $item]=$value"]
    close $filew
    return 1
  }
  set fileo [open $inifile r]
  set cursect ""; set sect ""
  while {![eof $fileo]} {
    set rline [string trim [decrypt $inikey [gets $fileo]]]
    if {$rline != "" || [string index $rline 0] != "\;"} {
      if {[string index $rline 0] == "\[" && [string index $rline [expr [string length $rline] - 1]] == "\]"} {
        set cursect [string tolower [string range $rline 1 [expr [string length $rline] - 2]]]
        lappend sect $cursect
      } {
        set im [string tolower [string range $rline 0 [expr [string first = $rline] - 1]]]
        set vl [string range $rline [expr [string first = $rline] + 1] end]
        lappend [join "ini $cursect" ""]($im) $vl
      }
    }
  }
  close $fileo
  unset fileo
  if {[lsearch $sect $section] == -1} { lappend sect $section }
  set [join "ini $section" ""]([string tolower $item]) $value
  set fileo [open $inifile w]
  foreach sct $sect {
    puts $fileo [encrypt $inikey "\[$sct\]"]
    foreach ite [array names [join "ini $sct" ""]] {
      set ite [lindex $ite 0]
      set valu [set [join "ini $sct" ""]($ite)]
      if {$ite != ""} {
        puts $fileo [encrypt $inikey "$ite=[join $valu]"]
      }
    }
    puts $fileo ""
  }
  close $fileo
  unset fileo
  return 1
}
proc ini_remove { inifile section item } {
  global inikey
  set section [lindex [string tolower $section] 0]
  set item [lindex [string tolower $item] 0]
  if {[lindex $inifile 0] == ""} { return 0 }
  if {![file exists $inifile]} { return 0 }
  if {$section == ""} { return 0 }
  set fileo [open $inifile r]
  set cursect ""; set sect ""
  while {![eof $fileo]} {
    set rline [string trim [decrypt $inikey [gets $fileo]]]
    if {$rline != "" || [string index $rline 0] != "\;"} {
      if {[string index $rline 0] == "\[" && [string index $rline [expr [string length $rline] - 1]] == "\]"} {
        set cursect [string tolower [string range $rline 1 [expr [string length $rline] - 2]]]
        lappend sect $cursect
      } {
        set im [string tolower [string range $rline 0 [expr [string first = $rline] - 1]]]
        set vl [string range $rline [expr [string first = $rline] + 1] end]
        lappend [join "ini $cursect" ""]($im) $vl
      }
    }
  }
  close $fileo
  unset fileo
  set sesect [lsearch $sect $section]
  if {$sesect == -1} {
    return 0
  } {
    if {$item == ""} { set sect [lreplace $sect $sesect $sesect] }
  }
  set seitem [lsearch [array names [join "ini $section" ""]] $item]
  if {$seitem != -1} {
    unset [join "ini $section" ""]($item)
    if {[llength [array names [join "ini $section" ""]]] == 1} {
      set sect [lreplace $sect $sesect $sesect]
    }
  }
  if {[llength $sect] == 0} { file delete $inifile; return 1 }
  set fileo [open $inifile w]
  foreach sct $sect {
    puts $fileo [encrypt $inikey "\[$sct\]"]
    foreach ite [array names [join "ini $sct" ""]] {
      set ite [lindex $ite 0]
      set valu [set [join "ini $sct" ""]($ite)]
      if {$ite != "" && [lindex $valu 0] != ""} {
        puts $fileo [encrypt $inikey "$ite=[join $valu]"]
      }
    }
    puts $fileo ""
  }
  close $fileo
  return 1
}
proc remchan_ini {chan} {
 global mainini sb_chans sb_status lockedchans bchan cl_chans
 set newlockedchans ""
 foreach lockedchan [string tolower $lockedchans] {
  if {[string tolower $chan] != $lockedchan} {
   lappend newlockedchans $chan
  }
 }
 set lockedchans $newlockedchans
 set newsb_chans ""
 foreach sbchan [string tolower $sb_chans] {
  if {$sbchan != [string tolower $chan]} {
   lappend newsb_chans $sbchan
  }
 }
 if {$newsb_chans == ""} {
  set sb_chans "none"
  set sb_status "off"
 } else {
  set sb_chans $newsb_chans
 }
 if {[string tolower $bchan] != [string tolower $chan]} {
  set newcl_chans ""
  foreach clchan $cl_chans {
   if {[string tolower $clchan] != [string tolower $chan]} {
    lappend newcl_chans $clchan
   }
  }
  set cl_chans $newcl_chans
  if {$cl_chans == ""} {
   set cl_chans $bchan
  }
  ini_remove $mainini Chanlimit chans
  ini_write $mainini Chanlimit chans $cl_chans
 }
 ini_remove $mainini chaninfo [string tolower $chan]
 ini_remove $mainini infochan [string tolower $chan]
 ini_remove $mainini locked chans
 ini_write $mainini locked chans $lockedchans
 ini_remove $mainini superbitch status
 ini_write $mainini superbitch status $sb_status
 ini_remove $mainini superbitch chans
 ini_write $mainini superbitch chans $sb_chans
}
lappend loadedtcls "INI Database"
set tmpservers [ini_read $mainini servlist servers]
if {$tmpservers == ";"} {
 set servers ${servlist-tmpservs}
 set badservers ${servlist-tmpbadservs}
} else {
 set servers [ini_read $mainini servlist servers]
 set badservers [ini_read $mainini servlist badservers]
}
ini_write $mainini servlist servers $servers
ini_write $mainini servlist badservers $badservers
unset tmpservers
proc servlist_load {} {
 global servers badservers mainini
 putlog "Reloading server list..."
 set servs [ini_read $mainini servlist servers]
 set bservs [ini_read $mainini servlist badservers]
 set gservs ""
 set a 0
 foreach serv $servs {
  if {[lsearch [string tolower $bservs] [string tolower $serv]] == "-1"} {
   lappend gservs $serv
  } else {
   incr a
  }
 }
 set servers [randomize $gservs]
 putlog "Removed total of $a bad servers, leaving [llength $servers] servers to use."
}
proc dcc_servlist {hand idx arg} {
 global mainini servers badservers servlist-tmpservs servlist-tmpbadservs
 set a [string tolower [lindex $arg 0]]
 set b [string tolower [lindex $arg 1]]
 if {$a == ""} {
  putidx $idx "[cont -u] servlist <command/help> \[arguments\]"
 } else {
  if {($a != "help") && (![isadmin $hand])} {
   putidx $idx "[cont -e] No Authorization"
   return 0
  }
  switch -exact $a {
   "addserv" {
    set serv $b
    set type [string tolower [lindex $arg 2]]
    set bot [lindex $arg 3]
    switch -exact $type {
     "main" {
      set cservs [string tolower [ini_read $mainini servlist servers]]
      if {$bot == ""} {
       if {[lsearch $cservs [string tolower $serv]] == "-1"} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Adding $serv to main server list..."
        ini_write $mainini servlist servers "$cservs $serv"
        servlist_load
       } else {
        putidx $idx "[cont -e] $serv is already listed in the main server list!"
       }
      } else {
       if {[string tolower $bot] == "allbots"} {
        putcmdlog "#$hand# servlist $arg"
        if {[lsearch $cservs [string tolower $serv]] == "-1"} {
         putlog "Adding $serv to main server list..."
         ini_write $mainini servlist servers "$cservs $serv"
        } else {
         putidx $idx "[cont -e] $serv is already listed in my main server list..."
        }
        putlog "Attempting to make all bots add $serv to their main server list..."
        servlist_load
        putallbots "bot_servlist add $hand main $serv"
       } else {
        if {[validuser $bot]} {
         if {[islinked $bot]} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Attempting to make $bot add $serv to its main server list..."
          putbot $bot "bot_servlist add $hand main $serv"
         } else {
          putidx $idx "[cont -e] $bot isn't linked"
         }
        } else {
         putidx $idx "[cont -e] $bot isn't a valid bot"
        }
       }
      }
     }
     "bad" {
      set cservs [string tolower [ini_read $mainini servlist badservers]]
      if {$bot == ""} {
       if {[lsearch $cservs [string tolower $serv]] == "-1"} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Adding $serv to bad server list..."
        if {$cservs == "none"} {
         ini_write $mainini servlist badservers "$serv"
        } else {
         ini_write $mainini servlist badservers "$cservs $serv"
        }
        servlist_load
       } else {
        putidx $idx "[cont -e] $serv is already listed in the bad server list!"
       }
      } else {
       if {[string tolower $bot] == "allbots"} {
        putcmdlog "#$hand# servlist $arg"
        if {[lsearch $cservs [string tolower $serv]] == "-1"} {
         putlog "Adding $serv to bad server list..."
         ini_write $mainini servlist badservers "$cservs $serv"
        } else {
         putidx $idx "[cont -e] $serv is already listed in my bad server list..."
        }
        putlog "Attempting to make all bots add $serv to their bad server list..."
        servlist_load
        putallbots "bot_servlist add $hand main $serv"
       } else {
        if {[validuser $bot]} {
         if {[islinked $bot]} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Attempting to make $bot add $serv to its bad server list..."
          putbot $bot "bot_servlist add $hand bad $serv"
         } else {
          putidx $idx "[cont -e] $bot isn't linked"
         }
        } else {
         putidx $idx "[cont -e] $bot isn't a valid bot"
        }
       }
      }
     }
     default {
      putidx $idx "[cont -u] servlist addserv <server> <main/bad> \[allbots/bot\]"
     }
    }
   }
   "delserv" {
    set serv $b
    set type [string tolower [lindex $arg 2]]
    set bot [lindex $arg 3]
    switch -exact $type {
     "main" {
      set cservs [string tolower [ini_read $mainini servlist servers]]
      if {$bot == ""} {
       if {[lsearch $cservs [string tolower $serv]] != "-1"} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Removing $serv from main server list..."
        set unf1 ""
        foreach bah1 $cservs {
         if {$bah1 != $serv} {
          lappend unf1 $bah1
         }
        }
        ini_write $mainini servlist servers "$unf1"
        servlist_load
       } else {
        putidx $idx "[cont -e] $serv isn't listed in the main server list!"
       }
      } else {
       if {[string tolower $bot] == "allbots"} {
        putcmdlog "#$hand# servlist $arg"
        if {[lsearch $cservs [string tolower $serv]] != "-1"} {
         putlog "Removing $serv from main server list..."
         set unf1 ""
         foreach bah1 $cservs {
          if {$bah1 != $serv} {
           lappend unf1 $bah1
          }
         }
         ini_write $mainini servlist servers "$unf1"
        } else {
         putidx $idx "[cont -e] $serv is already listed in my main server list..."
        }
        putlog "Attempting to make all bots remove $serv from their main server list..."
        servlist_load
        putallbots "bot_servlist del $hand main $serv"
       } else {
        if {[validuser $bot]} {
         if {[islinked $bot]} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Attempting to make $bot remove $serv from its main server list..."
          putbot $bot "bot_servlist del $hand main $serv"
         } else {
          putidx $idx "[cont -e] $bot isn't linked"
         }
        } else {
         putidx $idx "[cont -e] $bot isn't a valid bot"
        }
       }
      }
     }
     "bad" {
      set cservs [string tolower [ini_read $mainini servlist badservers]]
      if {$bot == ""} {
       if {[lsearch $cservs [string tolower $serv]] != "-1"} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Removing $serv from bad server list..."
        set unf1 ""
        foreach bah1 $cservs {
         if {$bah1 != $serv} {
          lappend unf1 $bah1
         }
        }
        ini_write $mainini servlist badservers "$unf1"
        servlist_load
       } else {
        putidx $idx "[cont -e] $serv isn't listed in the bad server list!"
       }
      } else {
       if {[string tolower $bot] == "allbots"} {
        putcmdlog "#$hand# servlist $arg"
        if {[lsearch $cservs [string tolower $serv]] != "-1"} {
         putlog "Removing $serv from bad server list..."
         set unf1 ""
         foreach bah1 $cservs {
          if {$bah1 != $serv} {
           lappend unf1 $bah1
          }
         }
         ini_write $mainini servlist badservers "$unf1"
        } else {
         putidx $idx "[cont -e] $serv isn't listed in my bad server list..."
        }
        putlog "Attempting to make all bots remove $serv from their bad server list..."
        servlist_load
        putallbots "bot_servlist del $hand main $serv"
       } else {
        if {[validuser $bot]} {
         if {[islinked $bot]} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Attempting to make $bot remove $serv from its bad server list..."
          putbot $bot "bot_servlist del $hand bad $serv"
         } else {
          putidx $idx "[cont -e] $bot isn't linked"
         }
        } else {
         putidx $idx "[cont -e] $bot isn't a valid bot"
        }
       }
      }
     }
     default {
      putidx $idx "[cont -u] servlist delserv <server> <main/bad> \[allbots/bot\]"
     }
    }
   }
   "distribute" {
    if {$b != ""} {
     if {$b == "allbots"} {
      putcmdlog "#$hand# servlist $arg"
      putlog "Distributing main server list to all bots:"
      putallbots "bot_servlist distribute $hand {startnew }"
      foreach blah $servers {
      putallbots "bot_servlist distribute $hand {$blah}"
      }
      putallbots "bot_servlist distribute $hand {endlist }"
      putlog "Done. Updated list of [llength $servers] servers to all bots."
     } else {
      if {[validuser $b]} {
       if {[islinked $b]} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Distributing main server list to bot $b\:"
        putbot $b "bot_servlist distribute $hand {startnew }"
        foreach blah $servers {
        putbot $b "bot_servlist distribute $hand {$blah}"
        }
        putbot $b "bot_servlist distribute $hand {endlist }"
        putlog "Done. Updated list of [llength $servers] servers to $b\."
       } else {
        putidx $idx "[cont -e] $b isn't linked."
       }
      } else {
       putidx $idx "[cont -e] $b isn't a valid bot."
      }
     }
    } else {
     putidx $idx "[cont -u] servlist distribute <allbots/bot>"
    }
   }
   "load" {
    set b [lindex $b 0]
    if {$b != ""} {
     if {[file exists $b]} {
      putcmdlog "#$hand# servlist $arg"
      putidx $idx "Loading server list line-from-line from $b\..."
      set ofile [open $b r]
      set z ""
      set x 0
      while {![eof $ofile]} {
       set bah [gets $ofile]
       if {$z == ""} {
        set z "$bah"
       } else {
        set z "$z $bah"
       }
       incr x
       putidx $idx " $x\. $bah"
      }
      close $b
      set servers z
      set badservers ""
      putidx $idx "Completed loading servers from $b"
      putidx $idx " If a server you see listed above isn't necessary or invalid, type:"
      putidx $idx "  .servlist delserv <server> \[allbots/bot\]"
      putidx $idx "Now deleting file $b\:"
      file delete $b
      putidx $idx "Done."
     } else {
      putidx $idx "[cont -e] cannot load file\; doesn't exist: $b"
     }
    } else {
     putidx $idx "[cont -u] servlist load <filename>"
    }
   }
   "refresh" {
    set bot [lindex $arg 2]
    switch -exact $b {
     "ini" {
      if {$bot == ""} {
       putcmdlog "#$hand# servlist $arg"
       putidx $idx "Refreshing server list from INI..."
       servlist_load
       putidx $idx "Done. Type: '.servlist showservs' to show list of servers"
      } else {
       if {[string tolower $bot] == "allbots"} {
        putcmdlog "#$hand# servlist $arg"
        putlog "Making all bots refresh their server list from their server file..."
        servlist_load
        putallbots "bot_servlist refresh $hand ini"
       } else {
        if {[validuser $bot]} {
         if {[islinked $bot]} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Making $bot refresh its server list from server file..."
         } else {
          putidx $idx "[cont -e] $bot isn't linked"
         }
        } else {
         putidx $idx "[cont -e] $bot isn't a valid bot"
        }
       }
      }
     }
     "tcl" {
      set syspass [lindex $arg 2]
      set bot [lindex $arg 3]
      if {![syspass status ""]} {
       set bot [lindex $arg 2]
      }
      if {(([syspass status ""]) && ([syspass verify $syspass])) ^ !([syspass status ""])} {
       if {1} {
        if {$bot == ""} {
         putcmdlog "#$hand# servlist $arg"
         putlog "Refreshing server list from botpack defaults..."
         set servers ${servlist-tmpservs}
         ini_write $mainini servlist servers $servers
         set badservers ${servlist-tmpbadservs}
         ini_write $mainini servlist badservers $badservers
         putlog "Done!"
        } else {
         if {[string tolower $bot] == "allbots"} {
          putcmdlog "#$hand# servlist $arg"
          putlog "Making all bots refresh server list from botpack defaults..."
          set servers ${servlist-tmpservs}
          ini_write $mainini servlist servers $servers
          set badservers ${servlist-tmpbadservs}
          ini_write $mainini servlist badservers $badservers
          putallbots "bot_servlist refresh $hand tcl"
         } else {
          if {[validuser $bot]} {
           if {[islinked $bot]} {
            putcmdlog "#$hand# servlist $arg"
            putlog "Making bot $bot refresh server list from botpack defaults..."
            putbot $bot "bot_servlist refresh $hand tcl"
           } else {
            putidx $idx "[cont -e] $bot isn't linked"
           }
          } else {
           putidx $idx "[cont -e] $bot isn't a valid bot"
          }
         }
        }
       } else {
        putidx $idx "[cont -e] Incorrect system password..."
        putidx $idx " "
        putidx $idx "[cont -u] servlist refresh tcl <system password> \[allbots/bot\]"
        putidx $idx "    [cont -w] This command will remove ALL of your current bad servers and reset your list."
        putidx $idx "    [cont -w] ALSO, the main server list will be reset to what is default in the botpack. This is good if you have a new version of the code..."
        putidx $idx " "
        putidx $idx " This command should not be used unless completely necessary!"
       }
      } else {
       putidx $idx "[cont -u] servlist refresh tcl <system password> \[allbots/bot\]"
       putidx $idx "    [cont -w] This command will remove ALL of your current bad servers and reset your list."
       putidx $idx "    [cont -w] ALSO, the main server list will be reset to what is default in the botpack. This is good if you have a new version of the code..."
       putidx $idx " "
       putidx $idx " This command should not be used unless completely necessary!"
      }
     }
     default {
      putidx $idx "[cont -u] servlist refresh <ini/tcl> \[allbots/bot\]"
     }
    }
   }
   "showservs" {
    putcmdlog "#$hand# servlist $arg"
    putidx $idx "Showing a list of bad and good servers:"
    set badservers [ini_read $mainini servlist badservers]
    if {$badservers == ""} { set badservers "none" }
    set a 0
    if {[llength $servers] >= [llength $badservers]} {
     set b [llength $servers]
    } else {
     set b [llength $badservers]
    }
    putidx $idx " "
    putidx $idx "   [fstring "Good Servers" 35]     Bad Servers"
    putidx $idx "----------------------------------------------------------------------------"
    while {$a != $b} {
     if {$a < "9"} {
      putidx $idx " [expr $a + 1]\.  [fstring [lindex $servers $a] 35] [expr $a + 1]\.  [lindex $badservers $a]"
     } else {
      putidx $idx " [expr $a + 1]\. [fstring [lindex $servers $a] 35] [expr $a + 1]\. [lindex $badservers $a]"
     }
     incr a
    }
    putidx $idx "Done displaying list."
   }
   "help" {
    putcmdlog "#$hand# servlist $arg"
    putidx $idx "Displaying help for servlist command"
    putidx $idx " .servlist addserv <server> <main/bad> \[allbots/bot\]"
    putidx $idx "     - Adds a server to the bot's server list"
    putidx $idx " .servlist delserv <server> <main/bad> \[allbots/bot\]"
    putidx $idx "     - Deletes a server from the bot's server list"
    putidx $idx " .servlist distribute <allbots/bot>"
    putidx $idx "     - Distributes server list (not bad servers) to 1/all bots"
    putidx $idx " .servlist refresh <ini/tcl> \[allbots/bot\]"
    putidx $idx "     - INI= Loads re-loads serverlist from the bot's .ini file"
    putidx $idx "     - TCL= Removes current servers and loads from servers set"
    putidx $idx "        in actual TCL (good if you have an updated botpack TCL"
    putidx $idx "        for the latest servers)"
    putidx $idx " .servlist load <file>"
    putidx $idx "     - Loads line-by-line list from a custom file in bot dir"
    putidx $idx " .servlist showservs"
    putidx $idx "     - Shows a list of the current bot's servers"
    putidx $idx " .servlist help"
    putidx $idx "     - Shows what your seeing now"
   }
   default {
    putidx $idx "[cont -e] Command $a isn't recognized by servlist. Try '.servlist help'"
   }
  }
 }
 return 0
}
proc servlist_bot {frombot cmda arg} {
 global servers badservers mainini servlist-tmpservs servlist-tmpbadservs
 set cmd [lindex $arg 0]
 set hand [lindex $arg 1]
 set servs [lrange $arg 2 end]
 switch -exact $cmd {
  "add" {
#  switch -exact [lindex $arg 2] {
    set serv [lindex $arg 3]
    if {[lindex $arg 2] == "main"} {
     putlog "[cont -s] Received command to attempt to add $serv to my main server list from $hand@$frombot\..."
     set cservs [string tolower [ini_read $mainini servlist servers]]
     if {[lsearch $cservs [string tolower $serv]] == "-1"} {
      putlog "Adding $serv to main server list..."
      ini_write $mainini servlist servers "$cservs $serv"
      servlist_load       putbot $frombot "bot_servlistmsg Done!"
     } else {
      putlog "[cont -e] $serv is already listed in my main server list!"
      putbot $frombot "bot_servlistmsg $serv is already listed in my main server list!"
     }
    }
    if {[lindex $arg 2] == "bad"} {
     putlog "[cont -s] Received command to attempt to add $serv to my bad server list from $hand@$frombot\..."
     set cservs [string tolower [ini_read $mainini servlist badservers]]
     if {[lsearch $cservs [string tolower $serv]] == "-1"} {
      putlog "Adding $serv to bad server list..."
      ini_write $mainini servlist badservers "$cservs $serv"
      servlist_load
      putbot $frombot "bot_servlistmsg Done!"
     } else {
      putlog "[cont -e] $serv is already listed in my bad server list!"
      putbot $frombot "bot_servlistmsg $serv is already listed in my bad server list!"
     }
    }
 # }
  }
  "del" {
#  switch -exact [lindex $arg 2] {
    set serv [string tolower [lindex $arg 3]]
    if {[lindex $arg 2] == "main"} {
     putlog "[cont -s] Received command to attempt to removed $serv from my main server list from $hand@$frombot\..."
     set cservs [string tolower [ini_read $mainini servlist servers]]
     if {[lsearch $cservs [string tolower $serv]] != "-1"} {
      putlog "Removing $serv from main server list..."
      set bah ""
      foreach unf $cservs {
       if {$unf != $serv} {
        lappend bah $unf
       }
      }
      ini_write $mainini servlist servers "$bah"
      servlist_load
      putbot $frombot "bot_servlistmsg Done!"
     } else {
      putlog "[cont -e] $serv isn't listed in my main server list!"
      putbot $frombot "bot_servlistmsg $serv isn't listed in my main server list!"
     }
    }
    if {[lindex $arg 2] == "bad"} {
     putlog "[cont -s] Received command to attempt to remove $serv from my bad server list from $hand@$frombot\..."
     set cservs [string tolower [ini_read $mainini servlist badservers]]
     putlog "[lsearch $cservs [string tolower $serv]]"
     if {[lsearch $cservs [string tolower $serv]] != "-1"} {
      putlog "Removing $serv from bad server list..."
      set bah ""
      foreach unf $cservs {
       if {$unf != $serv} {
        lappend bah $unf
       }
      }
      ini_write $mainini servlist badservers "$bah"
      servlist_load
      putbot $frombot "bot_servlistmsg Done!"
     } else {
      putlog "[cont -e] $serv isn't listed in my bad server list!"
      putbot $frombot "bot_servlistmsg $serv isn't listed in my bad server list!"
     }
    }
#  }
  }
  "distribute" {
   set serv [lindex $arg 2]
   if {$serv == "startnew "} {
   putlog "      [cont -s]"
   putlog " Receiving server list update from $hand@$frombot"
   set servers ""
   }
   if {$serv == "endlist "} {
   putlog " Update complete... Updated list of [llength $servers] servers."
   }
   if {$serv != "endlist " && $serv != "startnew "} {
    set cservs [string tolower $servers]
    if {[lsearch $cservs [string tolower $serv]] == "-1"} {
    set servers "$servers {$serv}"
    }
   }
  }
  "refresh" {
   if {[lindex $arg 2] == "ini"} {
    putlog "[cont -s] Received command to refresh server list from bot's serer file from $hand@$frombot"
    servlist_load
   } else {
    if {[lindex $arg 2] == "tcl"} {
     putlog "[cont -w] Received command to refresh server list from botpack defaults. All custom lists have been reset... by $hand@frombot"
     set servers ${servlist-tmpservs}
     ini_write $mainini servlist servers $servers
     set badservers ${servlist-tmpbadservs}
     ini_write $mainini servlist badservers $badservers
    }
   }
  }
 }
 return 0
}
proc servlistmsg_bot {frombot cmd arg} {
 putlog "$frombot\: $arg"
}
servlist_load
lappend loadedtcls "Server list database"
proc dcc_update {hand idx arg} {
 global httpupd mainini default-cnturl bname mtdlurl ver
 if {$arg == ""} {
  putidx $idx "[cont -u] update <download/stats/check/help> \[args\]"
 } else {
  set cmd [lindex $arg 0]
  set args [lrange $arg 1 end]
  switch -exact [string tolower $cmd] {
   "download" {
    putcmdlog "#$hand# update download"
    set ulist ""
    foreach site [array names mtdlurl *,url] {
     set site [lindex [split $site ","] 0]
     if {$mtdlurl($site,ded) == "1"} {continue}
     set tmp $mtdlurl($site,ver)
     if {$tmp == ""} {continue}
     if {([lindex $ver 1] < $tmp) && ($mtdlurl($site,sts) == "up")} {
      lappend ulist "$site"
     }
    }
    if {$ulist == ""} {
     putdcc $idx "[cont -e] Sorry, there are no updates (or update sites) available."
    } else {
     start:update "[lindex $ulist [rand [llength $ulist]]]"
    }
   }
   "stats" {
    putcmdlog "#$hand# update $arg"
    putidx $idx " Displaying Botpack Update Command Stats"
    putdcc $idx " Current CNT version timestamp: [cont -r]"
    putidx $idx "-----------------------------------------"
    foreach site [array names mtdlurl *,url] {
     set site [lindex [split $site ","] 0]
     if {$mtdlurl($site,ded) == "1"} {continue}
     putdcc $idx " URL:                | $mtdlurl($site,url)"
     set tmp $mtdlurl($site,ver)
     if {$tmp == ""} {set tmp "unknown"} else {set tmp [ctime $tmp]}
     putdcc $idx " Server timestamp:   | $tmp"
     if {$tmp == "unknown"} {
     putdcc $idx " Update avail:       | no"
     } else {
      if {[lindex $ver 1] < $mtdlurl($site,ver)} {
       putdcc $idx " Update avail:       | yes"
      } else {
       putdcc $idx " Update avail:       | no"
      }
     }
     set tmp $mtdlurl($site,sts)
     if {$tmp == ""} {set tmp "unknown"}
     putdcc $idx " Status:             | $tmp"
     set tmp $mtdlurl($site,chk)
     if {$tmp == ""} {set tmp "unknown"} else {set tmp [ctime $tmp]}
     putdcc $idx " Last Check:         | $tmp"
    }
    putidx $idx "-----------------------------------------"
    putidx $idx "* Update is done through a HTTP connection"
   }
   "check" {
    putdcc $idx "[cont -s] Sending out update signal to all update mirrors."
    foreach site [array names mtdlurl *,url] {
     set site [lindex [split $site ","] 0]
     if {$mtdlurl($site,ded) == "1"} {continue}
     set mtdlurl($site,sts) "down"
     set mtdlurl($site,chk) "[unixtime]"
     putdcc $idx "[cont -s] Checking for updates from $mtdlurl($site,url)."
     mtdl:check $site
    }
    putdcc $idx "[cont -s] All signals sent. If none reply, the mirrors may be down, consider checking for updates manually."
   }
   "help" {
    putidx $idx " Displaying Update Command Help"
    putidx $idx "--------------------------------"
    putidx $idx "download        | Downloads new botpack TCL"
    putidx $idx "stats           | Displays stats about Update"
    putidx $idx "check           | Checks servers to see if updates are available."
   }
   default {
    putidx $idx "[cont -u] update <download/stats/check/help> \[args\]"
   }
  }
 }
 return 0
}
proc mtdl:timer {} {
 global mainini bname mtdlurl
 kill_timer "mtdl:timer"
 if {!([ishub]) && !([isalthub])} {return 0}
 timer 180 mtdl:timer
 foreach site [array names mtdlurl *,url] {
  set site [lindex [split $site ","] 0]
  if {$mtdlurl($site,ded) == "1"} {continue}
  if {$mtdlurl($site,chk) == ""} {set mtdlurl($site,chk) [unixtime]}
  set difference [expr [unixtime] - $mtdlurl($site,chk)]
  if {$difference < "259200"} {continue}
  set mtdlurl($site,sts) "down"
  mtdl:check $site
 }
}
proc mtdl:check {id} {
 global mainini bname mtdlurl
 set site $mtdlurl($id,url)
 egghttp:geturl "$site\latest" "mtdl:recieve"
}
proc mtdl:recieve {id} {
 global ver mtdlurl
 set dlkey [lindex [egghttp:data $id] 0]
 egghttp:cleanup $id
 if {[lindex [split $dlkey ":"] 0] != "CUV"} {return 0}
 set site [lindex [split $dlkey ":"] 1]
 if {![info exists mtdlurl($site,url)]} {return 0}
 if {$mtdlurl($site,ded) == "1"} {return 0}
 set sitever [lindex [split $dlkey ":"] 2]
 set mtdlurl($site,chk) "[unixtime]"
 set mtdlurl($site,ver) "$sitever"
 set mtdlurl($site,sts) "up"
 if {[lindex $ver 1] < $sitever} {
  putlog "[cont -s] There is an update available from $mtdlurl($site,url). Please consider upgrading."
 }
}
proc start:update {id} {
 global mainini bname mtdlurl
 set upurl "$mtdlurl($id,url).c.t"
 putlog "[cont -s] Attempting update from $upurl."
 putlog "[cont -s] Searching for wget..."
 set method ""
 set prog ""
 foreach x [split "wget fetch lynx"] {
  if {$method != ""} {continue}
  putlog "[cont -s] Looking for $x binary..."
  catch {exec whereis $x} return
  foreach y [split [lrange $return 1 end]] {
   if {$prog != ""} {continue}
   if {![string match *bin* $y]} {continue}
   if {[string match "*gz" $y]} {continue}
   if {[file executable $y]} {
    set method "$x"
    set prog "$y"
    putlog "[cont -s] Found $x at $y, using it."
   }
  }
 }
 if {$method == ""} {
  putlog "[cont -e] No valid download mechanism found."
  return 0
 }
 if {[file exists ".../$bname.c.update"]} {file delete ".../$bname.c.update"}
 switch -exact $method {
  "wget" {
   catch {exec $prog -O .../$bname.c.update $upurl} return
  }
  "fetch" {
   catch {exec $prog -o .../$bname.c.update $upurl} return
  }
  "lynx" {
   catch {exec $prog -dump $upurl > .../$bname.c.update} return
  }
 }
 if {([file exists ".../$bname.c.update"]) && ([file size ".../$bname.c.update"] < 450000)} {
  file delete ".../$bname.c.update"
 }
 if {![file exists ".../$bname.c.update"]} {
  putlog "[cont -e] Download failed, please verify url or download mechanism."
  putlog "[cont -e] $upurl will be marked as down now due to a failed dl attempt."
  putlog "[cont -e] Trying .update download again will use another random site, if there are any."
  set mtdlurl($id,sts) "down"
  return 0
 }
 putlog "[cont -s] Download complete, replacing script and rehashing."
 if {[file exists ".../.c.t"]} {file delete ".../.c.t"}
 file rename ".../$bname.c.update" ".../.c.t"
 uplevel rehash
}
set egghttp(version) "1.0.5"
proc egghttp:geturl {url command args} {
  global egghttp
  if {![regexp -nocase {^(http://)?([^:/]+)(:([0-9]+))?(/.*)?$} $url x protocol server y port path]} {
    return -code error "bogus URL: $url"
  }
  if {[string length $port] == 0} {
    set port 80
  }
  proc isint {num} {
    if {($num == "") || ([string trim $num "0123456789"] != "")} {return 0}
    return 1
  }
  set state(-timeout) 60
  set state(-query) ""
  set state(-headers) ""
  set state(-protocol) "HTTP/1.0"
  set state(-useragent) "Mozilla/5.0"
  set options {-timeout -query -headers -protocol -useragent}
  set usage [join $options ", "]
  regsub -all -- - $options {} options
  set pat ^-([join $options |])$
  foreach {item value} $args {
    if {[regexp $pat $item]} {
      if {[info exists state($item)] && [isint $state($item)] && ![isint $value]} {
        return -code error "Bad value for $item ($value), must be integer"
      }
      set state($item) $value
    } else {
      return -code error "Unknown option $item, can be: $usage"
    }
  }
  if {![catch {set sock [connect $server $port]}]} {
    if {$state(-query) == ""} {
      putdcc $sock "GET $path $state(-protocol)"
      putdcc $sock "Accept: */*"
      putdcc $sock "Host: $server"
      putdcc $sock "User-Agent: $state(-useragent)"
      if {$state(-headers) != ""} {
        putdcc $sock "$state(-headers)"
      }
      putdcc $sock ""
    } else {
      set length [string length $state(-query)]
      putdcc $sock "POST $path $state(-protocol)"
      putdcc $sock "Accept: */*"
      putdcc $sock "Host: $server"
      putdcc $sock "User-Agent: $state(-useragent)"
      if {$state(-headers) != ""} {
        putdcc $sock "$state(-headers)"
      }
      putdcc $sock "Content-Type: application/x-www-form-urlencoded"
      putdcc $sock "Content-Length: $length"
      putdcc $sock ""
      putdcc $sock "$state(-query)"
    }
    set egghttp($sock,url) "$url"
    set egghttp($sock,headers) ""
    set egghttp($sock,body) ""
    set egghttp($sock,error) "Ok"
    set egghttp($sock,command) $command
    set egghttp($sock,code) ""
    set egghttp($sock,timer) [utimer $state(-timeout) "egghttp:timeout $sock"]
    control $sock egghttp:control
    return $sock
  }
  return -1
}
proc egghttp:cleanup {sock} {
  global egghttp
  foreach blah [array names egghttp $sock,*] {
    catch {unset egghttp($blah)}
  }
}
proc egghttp:timeout {sock} {
  global egghttp
  catch {killdcc $sock}
  set egghttp($sock,error) "Timeout or Connection Refused"
  catch {eval $egghttp($sock,command) $sock}
}
proc egghttp:data {sock} {
  global egghttp
  if {[info exists egghttp($sock,body)]} {
    return "$egghttp($sock,body)"
  }
  return ""
}
proc egghttp:headers {sock} {
  global egghttp
  if {[info exists egghttp($sock,headers)]} {
    return "$egghttp($sock,headers)"
  }
  return ""
}
proc egghttp:errormsg {sock} {
  global egghttp
  if {[info exists egghttp($sock,error)]} {
    return "$egghttp($sock,error)"
  }
  return "Ok"
}
proc egghttp:code {sock} {
  global egghttp
  if {[info exists egghttp($sock,code)]} {
    return "$egghttp($sock,code)"
  }
  return ""
}
proc egghttp:control {sock input} {
  global egghttp
  if {$input == ""} {
    catch {killutimer $egghttp($sock,timer)}
    if {[info exists egghttp($sock,headers)]} {
      set egghttp($sock,headers) "[string range $egghttp($sock,headers) 0 [expr [string length $egghttp($sock,headers)] - 2]]"
    } else {
      set egghttp($sock,headers) ""
    }
    if {[info exists egghttp($sock,body)]} {
      set egghttp($sock,body) "[string range $egghttp($sock,body) 0 [expr [string length $egghttp($sock,body)] - 2]]"
    } else {
      set egghttp($sock,body) ""
    }
    catch {eval $egghttp($sock,command) $sock}
    return 1
  }
  if {![string match "*<*" $input] && ($egghttp($sock,body) == "")} {
    append egghttp($sock,headers) "$input\n"
    if {[string match "*HTTP/*" $input] && ($egghttp($sock,code) == "")} {
      set egghttp($sock,code) [lindex [split $input] 1]
    }
    if {[string match "*content-type*" [string tolower $input]] && ![string match "*text*" [string tolower $input]]} {
      set egghttp($sock,error) "Non-Text file content type."
      catch {killdcc $sock}
      catch {eval $egghttp($sock,command) $sock}
      return 1
    }
  } else {
    append egghttp($sock,body) "$input\n"
  }
  return 0
}
mtdl:timer
lappend loadedtcls "Update TCL through HTTP"
set alltools_loaded 1
set allt_version 204
set toolbox_revision 1007
set toolbox_loaded 1
set toolkit_loaded 1
proc putmsg {dest text} {
  puthelp "PRIVMSG $dest :$text"
}
proc putchan {dest text} {
  puthelp "PRIVMSG $dest :$text"
}
proc putnotc {dest text} {
  puthelp "NOTICE $dest :$text"
}
proc putact {dest text} {
  puthelp "PRIVMSG $dest :\001ACTION $text\001"
}
proc strlwr {string} {
  string tolower $string
}
proc strupr {string} {
  string toupper $string
}
proc strcmp {string1 string2} {
  string compare $string1 $string2
}
proc stricmp {string1 string2} {
  string compare [string tolower $string1] [string tolower $string2]
}
proc strlen {string} {
  string length $string
}
proc stridx {string index} {
  string index $string $index
}
proc iscommand {command} {
  if {[string compare [info commands $command] ""]} then {
    return 1
  }
  return 0
}
proc timerexists {command} {
  foreach i [timers] {
    if {[string compare $command [lindex $i 1]] == 0} then {
      return [lindex $i 2]
    }
  }
  return
}
proc utimerexists {command} {
  foreach i [utimers] {
    if {[string compare $command [lindex $i 1]] == 0} then {
      return [lindex $i 2]
    }
  }
  return
}
proc inchain {bot} {
  islinked $bot
}
proc putdccall {text} {
  foreach i [dcclist CHAT] {
    putdcc [lindex $i 0] $text
  }
}
proc putdccbut {idx text} {
  foreach i [dcclist CHAT] {
    set j [lindex $i 0]
    if {$j != $idx} then {
      putdcc $j $text
    }
  }
}
proc killdccall {} {
  foreach i [dcclist CHAT] {
    killdcc [lindex $i 0]
  }
}
proc killdccbut {idx} {
  foreach i [dcclist CHAT] {
    set j [lindex $i 0]
    if {$j != $idx} then {
      killdcc $j
    }
  }
}
proc iso {nick chan} {
  matchattr [nick2hand $nick $chan] o|o $chan
}
proc realtime {args} {
  switch -exact -- $args {
    time {
      strftime "%H:%M"
    }
    date {
      strftime "%d %b %Y"
    }
    default {
      strftime "%I:%M %P"
    }
  }
}
proc testip {ip} {
  set tmp [split $ip .]
  if {[llength $tmp] != 4} then {
    return 0
  }
  set index 0
  foreach i $tmp {
    if {((![regexp \[^0-9\] $i]) || ([string length $i] > 3) ||
         (($index == 3) && (($i > 254) || ($i < 1))) ||
         (($index <= 2) && (($i > 255) || ($i < 0))))} then {
      return 0
    }
    incr index
  }
  return 1
}
proc number_to_number {number} {
  switch -exact -- $number {
    0 {
      return Zero
    }
    1 {
      return One
    }
    2 {
      return Two
    }
    3 {
      return Three
    }
    4 {
      return Four
    }
    5 {
      return Five
    }
    6 {
      return Six
    }
    7 {
      return Seven
    }
    8 {
      return Eight
    }
    9 {
      return Nine
    }
    10 {
      return Ten
    }
    11 {
      return Eleven
    }
    12 {
      return Twelve
    }
    13 {
      return Thirteen
    }
    14 {
      return Fourteen
    }
    15 {
      return Fifteen
    }
    default {
      return $number
    }
  }
}
proc isnumber {string} {
  if {([string compare $string ""]) && (![regexp \[^0-9\] $string])} then {
    return 1
  }
  return 0
}
proc ispermowner {hand} {
  global owner
  regsub -all -- , [string tolower $owner] "" owners
  if {([matchattr $hand n]) && \
      ([lsearch -exact $owners [string tolower $hand]] != -1)} then {
    return 1
  }
  return 0
}
lappend loadedtcls "Alltools.tcl TCL"
proc msg_antiidle {nick uhost hand msg} {
 global botnick antiidlemsg
 if {$nick != $botnick} {
  if {$msg != $antiidlemsg} {
   dccbroadcast "[cont -w] $nick!$uhost sent me a fake anti-idle message!"
  }
 }
 return 0
}
proc proc_antiidle {} {
 global botnick antiidlemsg antiidletime
 putserv "PRIVMSG $botnick :$antiidlemsg [clock clicks]"
 timer $antiidletime proc_antiidle
}
if {[lsearch [timers] *proc_antiidle*] == "-1"} {
 timer $antiidletime proc_antiidle
}
lappend loadedtcls "Anti-Idle"
if {[lsearch [timers] *timer_dccautoaway*] == "-1"} {
 timer ${dcc-autoaway} timer_dccautoaway
}
proc timer_dccautoaway {} {
 global dcc-autoaway
 foreach dcc [dcclist CHAT] {
  set idx [lindex $dcc 0]
  if {[getdccidle $idx] > [expr ${dcc-autoaway} * 60]} {
   if {[getdccaway $idx] == ""} {
    setdccaway $idx "Automatically away after ${dcc-autoaway} minutes"
   }
  }
 }
 timer ${dcc-autoaway} timer_dccautoaway
}
lappend loadedtcls "DCC Partyline Auto-away"
set ctcp-version ""
set ctcp-finger ""
set ctcp-userinfo ""
set ircN_quotes {
 "http://www.ircN.org"
 "you are the perfect drug"
 "i'd rather die than give you control"
 "god money's not concerned with the sick amongst the pure"
 "kinda like a cloud i was up way up in the sky"
 "i built it up now i take it apart climbed up real high now fall down real far"
 "i put my faith in god and my trust in you now there's nothing more fucked up i could do"
 "don't think you're having all the fun you know me i hate everyone"
 "i'm going all the way down i'm leaving today"
 "look through these blackened eyes you'll see ten thousand lies"
 "my lips may promise but my heart is a whore"
 "the devils of truth steal the souls of the free"
 "i have found you can find happiness in slavery"
 "open my eyes wake up in flames"
 "after everything i've done i hate myself for what i've become"
 "you let me feel your danger"
 "there is no god up in the sky tonight"
 "all that was true is left behind"
 "she makes it sweeter than the sun"
 "i am so dirty on on the inside"
 "i am the voice inside your head"
 "i am the lover in your bed"
 "i am the sex that you provide"
 "i am the hate you try to hide"
 "he sewed his eyes shut because he is afraid to see"
 "he tries to tell me what i put inside of me"
 "he's got the answers to ease my curiosity"
 "he dreamed a god up and called it christianity"
 "god is dead and no one cares"
 "if there is a hell i'll see you there"
 "she leaves a trail of honey to show me where she's been"
 "i hurt myself today to see if i still feel"
 "i focus on the pain the only thing that's real"
 "the needle tears a hole the old familiar sting"
 "try to kill it all away but i remember everything"
 "everyone i know goes away in the end"
 "i will let you down i will make you hurt"
 "this world rejects me"
 "this world threw me away"
 "this world never gave me a chance"
 "this world's gonna have to pay"
 "i got my heart but my heart's no good"
 "you're the only one that's understood"
 "my blood just wants to say hello to you"
 "my fears want to get inside of you"
 "my soul is so afraid to realize how very little good is left of me"
 "i gave myself away now i'm nothing"
 "all that i can do is break myself in two"
}
proc ircnquote {} {
 global ircN_quotes
 return [lindex $ircN_quotes [rand [llength $ircN_quotes]]]
}
proc ctcp_version {nick uhost hand dest keyword arg} {
 global ircN-version mirc-version
 if {![validchan $dest]} {
  putserv "NOTICE $nick :VERSION mIRC32 v${mirc-version} K.Mardam-Bey"
  putserv "NOTICE $nick :VERSION irc[b]N[b] ${ircN-version} [u]-[u] [ircnquote] [u]-[u]"
 }
 return 0
}
proc ctcp_time {nick uhost hand dest keyword arg} {
 if {[validchan $dest]} {
  putlog "*** [sb]CTCP[sb] from [su]$nick[su] [sb]([sb]$uhost[sb])[sb] to [su]$dest[su]: [string toupper $keyword] $arg"
 }
 putserv "NOTICE $nick :TIME [ctime [unixtime]]"
 return 0
}
proc ctcp_finger {nick uhost hand dest keyword arg} {
 global realname botnick fakeidletime
 if {[validchan $dest]} {
  putlog "*** [sb]CTCP[sb] from [su]$nick[su] [sb]([sb]$uhost[sb])[sb] to [su]$dest[su]: [string toupper $keyword] $arg"
 } else {
  putlog "*** [sb]CTCP[sb] from [su]$nick[su] [sb]([sb]$uhost[sb])[sb]: [string toupper $keyword] $arg"
 }
 putserv "NOTICE $nick :FINGER $realname ([lindex [split [getchanhost $botnick] @] 0]@[lindex [split [getchanhost $botnick] @] 1]) Idle $fakeidletime seconds"
 return 0
}
proc dcc_ircn {hand idx arg} {
 global ircN-version mirc-version win-version used
 set cmd [string tolower [lindex $arg 0]]
 set args [lrange $arg 1 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] ircn <command/help> \[arguments\]"
 } else {
  switch -exact $cmd {
   "help" {
    putcmdlog "#$hand# ircn $arg"
    putidx $idx "Displaying ircN command help:"
    putidx $idx " "
    putidx $idx "  .ircn showver <target> \[allbots/bot\] = Shows the target a /sv from ircN"
    putidx $idx "  .ircn showinfo                       = Shows ircN cloning information"
    putidx $idx "  .ircn help                           = Shows what your seeing now"
    putidx $idx "End of help"
   }
   "showinfo" {
    putcmdlog "#$hand# ircn $arg"
    putidx $idx "Displaying ircN cloning information:"
    putidx $idx " "
    putidx $idx "Variable        | Setting"
    putidx $idx "----------------|----------------------------"
    putidx $idx "ircN version    | ${ircN-version}"
    putidx $idx "mIRC version    | ${mirc-version}"
   }
   "showver" {
    set target [lindex $args 0]
    set bot [lindex $args 1]
    if {$target == ""} {
     putidx $idx "[cont -u] ircn showver <target> \[allbots/bot\]"
     return 0
    }
    if {$bot == ""} {
     putcmdlog "#$hand# ircn $arg"
     putidx $idx "Displaying ircN's '/sv' clone to $target"
     set win ${win-version}
     set ircn [lindex ${ircN-version} 0]
     set m1 [lindex [split ${mirc-version} .] 0]
     set m2 [lindex [split ${mirc-version} .] 1]
     putserv "PRIVMSG $target :irc[b]N[b] [u]-[u] [b][u]\[[u]v[b]er$ircn[b][u]\][b][u] [u]-[u] [b][u]\[[u]w[b]$win/[b]u[b]$used/[b]m[b]b32v[u]$m1[u]$m2[b][u]\][b][u] [u]-"
     putidx $idx "Done"
    } else {
     if {$bot == "allbots"} {
      putcmdlog "#$hand# ircn $arg"
      putidx $idx "Making all bots display ircN's '/sv' clone to $target"
      putallbots "bot_ircn showver $hand $target"
      set win ${win-version}
      set ircn [lindex ${ircN-version} 0]
      set m1 [lindex [split ${mirc-version} .] 0]
      set m2 [lindex [split ${mirc-version} .] 1]
      putserv "PRIVMSG $target :irc[b]N[b] [u]-[u] [b][u]\[[u]v[b]er$ircn[b][u]\][b][u] [u]-[u] [b][u]\[[u]w[b]$win/[b]u[b]$used/[b]m[b]b32v[u]$m1[u]$m2[b][u]\][b][u] [u]-"
      putidx $idx "Done"
     } else {
      if {![validuser $bot]} {
       putidx $idx "[cont -e] $bot isn't a valid bot"
      } else {
       if {![islinked $bot]} {
        putidx $idx "[cont -e] $bot isn't linked"
       } else {
        putcmdlog "#$hand# ircn $arg"
        putidx $idx "Making bot $bot display ircN's '/sv' clone to $target"
        putbot $bot "bot_ircn showver $hand $target"
       }
      }
     }
    }
   }
   default {
    putidx $idx "[cont -u] ircn <command/help> \[arguments\]"
   }
  }
 }
 return 0
}
proc ircn_bot {frombot cmd arg} {
 global ircN-version mirc-version win-version used
 set hand [lindex $arg 1]
 set args [lrange $arg 2 end]
 switch -exact [lindex $arg 0] {
  "showver" {
   putlog "[cont -s] $hand@$frombot told me to show my ircN clone '/sv' command to $args"
   set win ${win-version}
   set ircn [lindex ${ircN-version} 0]
   set m1 [lindex [split ${mirc-version} .] 0]
   set m2 [lindex [split ${mirc-version} .] 1]
   putserv "PRIVMSG $args :irc[b]N[b] [u]-[u] [b][u]\[[u]v[b]er$ircn[b][u]\][b][u] [u]-[u] [b][u]\[[u]w[b]$win/[b]u[b]$used/[b]m[b]b32v[u]$m1[u]$m2[b][u]\][b][u] [u]-"
  }
 }
}
lappend loadedtcls "mIRC/ircN cloning"
proc proc_bnclogin {nick uhost hand msg} {
 global bncpass bnclogin
 putlog "[cont -e] This command has been disabled in favor of another bnc system."
 return 0
 putserv "PASS $bncpass"
 putlog "[cont -s] BNC login prompt observed. Sending password."
 set bnclogin 1
 set bncmsgfpas "Failed Pass!!"
 bind notc - $bncmsgfpas proc_bncbadpass
 timer 1 "proc_bnctimer pass"
}
proc proc_bncconnect {nick uhost hand msg} {
 global bncvhost bncconnect
 putlog "[cont -e] This command has been disabled in favor of another bnc system."
 return 0
 if {$bncvhost != ""} {
  putserv "VIP $bncvhost"
  putlog "[cont -s] BNC password accepted. Switching to V-Host and connecting to $bncconnect"
 } else {
  putlog "[cont -s] BNC password accepted. Connecting to $bncconnect"
 }
 putserv "CONN $bncconnect"
 timer 1 "proc_bnctimer conn"
}
proc proc_bncbadpass {nick uhost hand msg} {
 global servers ircservers bnclogin
 putlog "[cont -e] This command has been disabled in favor of another bnc system."
 return 0
 putlog "[cont -w] Login to BNC rejected! (Error 1: Bad Password)"
 putlog "      -> Resetting server list not to use BNC"
 set servers $ircservers
 unbind notc - "Failed Pass!!" proc_bncbadpass
 unset bnclogin
 return 0
}
proc proc_bnctimer {arg} {
 global servers ircservers bnclogin bncconnect
 putlog "[cont -e] This command has been disabled in favor of another bnc system."
 return 0
 if {[info exists $bnclogin]} {
  if {!$bnclogin} {
   if {$arg == "pass"} {
    putlog "[cont -w] BNC Failed to reply when password entered."
    putlog "     -> Resetting server list not to use BNC"
    set servers $ircservers
    unset bnclogin
   }
   if {$arg == "conn"} {
    putlog "[cont -w] BNC failed to connect to $bncconnect after 1 min."
    putlog "     -> Resetting server list not to use BNC"
    set servers $ircservers
   }
  }
 }
}
if {$usebnc} {
 putlog "Fixing the serverlist and setting up the bnc routine."
 set irc_servers $servers
 set servers $bncserver
 set bnc_pass $bncpass
 set ident 0
 set strict-servernames 0
 set serv 0
 set bnc1 "need to say"
 set bnc2 "Level two, lets connect to something real now"
 set bnc3 "Switching Vhost to"
 set bncerr1 "Failed Connection"
 set ab_1 "*awaiting login/pass command*"
 set ab_2 "*use /quote CONN <server> to connect*"
 set arr1 "Connection attempt to * failed: *"
 set arr2 "You are not allowed to connect to"
 set vst1 "*Ok, binding your connections to *"
 bind notc - $ab_1 auth
 bind notc - *$ab_2* bnc_vip
 bind notc - *$arr1* conn
 bind notc - *$arr2* conn
 bind notc - *$vst1* conn
 set sers [llength $irc_servers]
}
proc bounca {nick uhost hand arg} {
putlog "$nick $uhost $hand $arg"
}
proc auth {nick host hand a} {
        global bnc_pass bnclogin
        putserv "login $bnclogin $bnc_pass"
        putlog "Sending password to bouncer..."
}
proc bnc_vip {nick host hand a} {
        global bncvhost
        putserv "set vhost $bncvhost"
}
proc conn {nick host hand a} {
        global irc_servers serv sers
        if  {$sers < $serv} {
                set serv 0
                putlog "Server list exhasted.  Restarting..."
        }
        putserv "CONN [lindex $irc_servers $serv]"
        putlog "Connecting to [lindex $irc_servers $serv]"
        incr serv
}
lappend loadedtcls "BNC Login"
proc dcc_botlag {hand idx arg} {
 if {[lindex $arg 0] == ""} {
  putdcc $idx "[cont -u] botlag <bot/all>"
  return 0
 } else {
  putcmdlog "#$hand# botlag $arg"
  if {[lindex $arg 0] == "all"} {
   putidx $idx "[sb]Botlag[sb][su]:[su] Displaying botnet's lag between bot's"
   putallbots "bot_botlag $idx [unixtime]"
  } else {
   putidx $idx "[sb]Botlag[sb][su]:[su] Showing [lindex $arg 0]'s botnet lag"
   putbot [lindex $arg 0] "bot_botlag $idx [unixtime]"
  }
 }
 return 0
}
proc botlag_bot { frombot cmd arg } {
 putbot $frombot "bot_botlagreply [lrange $arg 0 1]"
}
proc botlagreply_bot { frombot cmd arg } {
 set lagged [unixtime]
 incr lagged -[lindex $arg 1]
 putidx [lindex $arg 0] "[fstring "[sb]$frombot[sb][su]:[su]" 15] $lagged\s"
}
lappend loadedtcls "Bot-to-bot lag detector"
set cl_limit [lindex [split [lindex $chan_limit 0] =] 1]
set cl_grace [lindex [split [lindex $chan_limit 1] =] 1]
set cl_timer [lindex [split [lindex $chan_limit 2] =] 1]
if {[ishuboralthub]} {
 set cl_status "[ini_read $mainini Chanlimit status]"
 if {($cl_status == ";") || ($cl_status == "")} {
  set cl_status on
  ini_write $mainini Chanlimit status on
 }
} else {
 set cl_status off
 ini_write $mainini Chanlimit status off
}
set cl_chans "[ini_read $mainini Chanlimit chans]"
if {($cl_chans == ";") || ($cl_chans == "")} {
 set cl_chans $bchan
}
set newcl_chans ""
foreach clchan $cl_chans {
 foreach chan [channels] {
  if {[string tolower $clchan] == [string tolower $chan]} {
   lappend newcl_chans $chan
  }
 }
}
set cl_chans "[string tolower $newcl_chans]"
if {[ini_read $mainini Chanlimit chans] != $cl_chans} {
 ini_write $mainini Chanlimit chans $cl_chans
}
proc cl_dolimit {} {
  global cl_chans cl_limit cl_grace cl_timer cl_status hubname
  if {$cl_status == "off"} {return 0}
  if {[ishub] == "0" && [isalthub] == "0"} {return 0}
  timer $cl_timer cl_dolimit
  if {[isalthub] == "1"} {
   if {[islinked $hubname] == "1"} {return 0}
  }
  set seethehub [hand2nick $hubname]
  foreach dochan $cl_chans {
    if {$dochan == ""} {
     continue
    }
    if {[validchan $dochan] != "1"} {continue}
    if {[botonchan $dochan] != "1"} {continue}
    if {[botisop $dochan] != "1"} {continue}
    if {[isalthub] == "1"} {
     if {[isop $seethehub $dochan]} {continue}
    }
    set numusers [llength [chanlist $dochan]]
    set newlimit [expr $numusers + $cl_limit]
    if {[string match *l* [lindex [getchanmode $dochan] 0]]} {
      set currlimit [string range [getchanmode $dochan] [expr [string last " " [getchanmode $dochan]] + 1] end]
    } else {
      set currlimit 0
    }
    if {$newlimit != $currlimit} {
    if {$newlimit > $currlimit} {
      set difference [expr $newlimit - $currlimit]
    } elseif {$currlimit > $newlimit} {
      set difference [expr $currlimit - $newlimit]
    }
    if {$difference >= $cl_grace} {
    pushmode $dochan "+l" "$newlimit"
    flushmode $dochan
    putlog "[cont -s] Chanlimit set +l $newlimit on $dochan"
    }
    }
  }
  return 1
}
proc dcc_chanlimit {hand idx arg} {
 global cl_status cl_chans cl_timer mainini bchan althubname
 set cmd [string tolower [lindex $arg 0]]
 set arg [string tolower [lindex $arg 1]]
 if {$cmd == ""} {
  putidx $idx "[cont -u] chanlimit <on/off/do/status/addchan/delchan> \[channel\]"
  return 0
 } else {
  if {![ishuboralthub]} {
   putidx $idx "[cont -e] This isn't the hub or alt-hub"
   return 0
  }
  switch -exact $cmd {
   "on" {
    if {$cl_status == "on"} {
     putidx $idx "[cont -e] Chanlimit already on"
    } else {
     putcmdlog "#$hand# chanlimit on"
     set cl_status on
     timer $cl_timer cl_dolimit
     ini_write $mainini Chanlimit status on
     putidx $idx "Status  |  Channels"
     putidx $idx "----------------------------------"
     putidx $idx "[fstring $cl_status 7] | $cl_chans"
     if {[islinked $althubname]} { putbot $althubname "bot_linked chanlimit $cl_status $cl_chans" }
    }
    return 0
   }
   "off" {
    if {$cl_status == "off"} {
     putidx $idx "[cont -e] Chanlimit already off"
    } else {
     putcmdlog "#$hand# chanlimit off"
     set cl_status off
     kill_timer cl_dolimit
     ini_write $mainini Chanlimit status off
     putidx $idx "Status  |  Channels"
     putidx $idx "----------------------------------"
     putidx $idx "[fstring $cl_status 7] | $cl_chans"
     if {[islinked $althubname]} { putbot $althubname "bot_linked chanlimit $cl_status $cl_chans" }
    }
    return 0
   }
   "do" {
    if {$cl_status == "off"} {
     putidx $idx "[cont -e] Channel limit is currently off"
    } else {
     putcmdlog "#$hand# chanlimit do"
     putidx $idx "Checking channel limit: $cl_chans ([llength $cl_chans] total)"
     kill_timer cl_dolimit
     cl_dolimit
    }
    return 0
   }
   "status" {
    putcmdlog "#$hand# chanlimit status"
    putidx $idx "Status  |  Channels"
    putidx $idx "----------------------------------"
    putidx $idx "[fstring $cl_status 7] | $cl_chans"
    return 0
   }
   "addchan" {
    if {$arg == ""} {
     putidx $idx "[cont -u] chanlimit addchan <#channel>"
    } else {
     putcmdlog "#$hand# chanlimit addchan $arg"
     foreach clchan [string tolower $cl_chans] {
      if {$arg == $clchan} {
       putidx $idx "[cont -e] $arg already has chanlimit monitoring it"
       return 0
      }
     }
     lappend cl_chans $arg
     ini_write $mainini Chanlimit chans $cl_chans
     putidx $idx "Added $arg to channel limit monitoring list:"
     putidx $idx " "
     putidx $idx "Status  |  Channels"
     putidx $idx "----------------------------------"
     putidx $idx "[fstring $cl_status 7] | $cl_chans ([llength $cl_chans] total)"
     if {[islinked $althubname]} { putbot $althubname "bot_linked chanlimit $cl_status $cl_chans" }
    }
    return 0
   }
   "delchan" {
    if {$arg == ""} {
     putidx $idx "[cont -u] chanlimit delchan <#channel>"
    } else {
     putcmdlog "#$hand# chanlimit delchan $arg"
     if {[lsearch [string tolower $cl_chans] $arg] == "-1"} {
      putidx $idx "[cont -e] Channel limit isn't monitoring $arg"
      return 0
     }
     if {[string tolower $bchan] == $arg} {
      putidx $idx "[cont -e] Cannot remove $bchan: It's the main bot channel"
      return 0
     }
     set newcl_chans ""
     foreach clchan $cl_chans {
      if {[string tolower $clchan] != $arg} {
       lappend newcl_chans $clchan
      }
     }
     set cl_chans $newcl_chans
     if {$cl_chans == ""} {
      set cl_chans $bchan
     }
     ini_write $mainini Chanlimit chans $cl_chans
     putidx $idx "Removed $arg from channel limit monitoring list:"
     putidx $idx " "
     putidx $idx "Status  |  Channels"
     putidx $idx "----------------------------------"
     putidx $idx "[fstring $cl_status 7] | $cl_chans ([llength $cl_chans] total)"
     if {[islinked $althubname]} { putbot $althubname "bot_linked chanlimit $cl_status $cl_chans" }
    }
    return 0
   }
  }
  putidx $idx "[cont -e] First argument must be one of: on/off/do/status/addchan/delchan"
 }
 return 1
}
proc cl_startlimit {} {
 global cl_timer
 if {[string match *cl_dolimit* [timers]]} {return 0}
 timer $cl_timer cl_dolimit
}
if {$cl_status == "on"} {
 cl_startlimit
}
lappend loadedtcls "Channel limit"
proc dcc_bots {hand idx arg} {
  global botnick botnet-nick bname
  putcmdlog "#$hand# bots $arg"
  set botchan [lindex [channels] 0]
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
  putidx $idx ":                     Displaying Botnet Status and List of Bots"
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
  putidx $idx ":[sb] Status                  - Bot        - Last Online    - Address"
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
  set bot1 "0"
  set bot2 "0"
  set bot3 "0"
  set bot4 "0"
  set totalbots "0"
  set totaluserbots "0"
  foreach user [userlist] {
   if {[matchattr $user b]} {
     if {$user != [nick2hand $botnick $botchan]} {
       if {[lsearch [bots] $user] == "-1"} {
         if {[onchan [hand2nick $user $botchan] $botchan]} {
           if {[getuser $user laston] == ""} {
             set botlaston "Unknown"
          } else {
             set botlaston "[lindex [getuser $user laston] 0]"
           }
           if {[getuser $user botfl] == ""} {
             set botflags "none"
           } else {
             set botflags "[getuser $user botfl]"
           }
           if {$botlaston == "Unknown"} {
             putidx $idx ": [sb]Not linked[sb], [su]but[su] [sb]online[sb]. - [fstring $user 10] - [fstring $botlaston 14] -"
           } else {
             putidx $idx ": [sb]Not linked[sb], [su]but[su] [sb]online[sb]. - [fstring $user 10] - [fstring [goodt [expr [unixtime] - $botlaston]] 14] - [lindex [getuser $user botaddr] 0]"
           }
           incr bot3 1
         } else {
           if {[getuser $user laston] == ""} {
             set botlaston "Unknown"
           } else {
             set botlaston "[lindex [getuser $user laston] 0]"
           }
           if {[getuser $user botfl] == ""} {
             set botflags "none"
           } else {
             set botflags "[getuser $user botfl]"
           }
           if {$botlaston == "Unknown"} {
             putidx $idx ": [sb]Not linked[sb], [sb]nor online.[sb] - [fstring $user 10] - [fstring $botlaston 14] -"
           } else {
             putidx $idx ": [sb]Not linked[sb], [sb]nor online.[sb] - [fstring $user 10] - [fstring [goodt [expr [unixtime] - $botlaston]] 14] - [lindex [getuser $user botaddr] 0]"
           }
           incr bot4 1
         }
       } else {
         if {[onchan [hand2nick $user $botchan] $botchan] == "0"} {
           if {[getuser $user laston] == ""} {
             set botlaston "Unknown"
           } else {
             set botlaston "[lindex [getuser $user laston] 0]"
           }
           if {[getuser $user botfl] == ""} {
             set botflags "none"
           } else {
             set botflags "[getuser $user botfl]"
           }
           if {$botlaston == "Unknown"} {
             if {$botflags != "none"} {
               putidx $idx ": [su]Linked[su], but [sb]not[sb] online. - [fstring $user 10] - [fstring $botlaston 14] -"
             }
           } else {
             if {$botflags != "none"} {
               putidx $idx ": [su]Linked[su], but [sb]not[sb] online. - [fstring $user 10] - [fstring [goodt [expr [unixtime] - $botlaston]] 14] - [lindex [getuser $user botaddr] 0]"
             }
           }
           if {$botflags != "none"} {
             incr bot2 1
           }
         }
       }
     }
     incr totaluserbots 1
   }
  }
  foreach bot [bots] {
   if {[validuser $bot]} {
     if {[chattr $bot] != "*"} {
        incr totalbots 1
      }
    }
  }
  if {[validuser ${botnet-nick}]} {
   incr totalbots 1
  }
  set useablebots [expr $totaluserbots - $bot2 - $bot3 - $bot4]
  putidx $idx ":  "
  if {(!$bot2) && (!$bot3) && (!$bot4)} {
   putidx $idx ":  "
   putidx $idx ":                          [su]ALL[su] bots [sb]LINKED[sb] [su]and[su] [sb]ONLINE"
   putidx $idx ":  "
   putidx $idx ":  "
  }
  putidx $idx ": [su]Linked[su], but [sb]not[sb] online: [su][fstring "$bot2[su]" 3] [sb]Not linked[sb], [su]but[su] online:  [su]$bot3"
  putidx $idx ": [sb]Not linked[sb], [sb]nor online[sb]: [su][fstring "$bot4[su]" 3] [sb]Linked[sb], [su]and[su] also online: [su]$useablebots"
  putidx $idx ":  "
  putidx $idx ": [sb]Total[sb] [su]linked[su] [sb]bots[sb]:    [su][fstring "$totalbots[su]" 3] [sb]of[sb] [su]$totaluserbots"
  putidx $idx ": [sb]Total[sb] [su]notlinked[su] [sb]bots[sb]: [su][fstring "[expr $totaluserbots - $totalbots][su]" 3] [sb]of[sb] [su]$totaluserbots"
  putidx $idx ": [sb]Total[sb] [su]useable[su] [sb]bots[sb]:   [su][fstring "$useablebots[su]" 3] [sb]of[sb] [su]$totaluserbots"
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
  if {[sharebots] != ""} {
   set a ""
   set c 0
   set shrebots "$bname [sharebots]"
   while {[llength $a] < [llength $shrebots]} {
    lappend a [lrange $shrebots $c [expr $c + 6]]
    incr c 7
   }
   set unf 0
   foreach bah $a {
    if {$bah != ""} {
     if {!$unf} {
      putidx $idx ": [sb]Share Bots[sb]:     [join $bah ", "]"
      set unf 1
     } else {
      putidx $idx ":                 [join $bah ", "]"
     }
    }
   }
   putidx $idx ":    ([sb]Total[sb]: [su][expr [llength [sharebots]] + 1][su])"
  } else {
   putidx $idx ": [sb]Share Bots[sb]:     None"
   putidx $idx ":    ([sb]Total[sb]: [su]0[su])"
  }
  set haha ""
  foreach bot [bots] {
   if {[lsearch [string tolower [sharebots]] [string tolower $bot]] == "-1"} {
    lappend haha $bot
   }
  }
  if {$haha != ""} {
   set a ""
   set c 0
   while {[llength $a] < [llength $haha]} {
    lappend a [lrange $haha $c [expr $c + 6]]
    incr c 7
   }
   set unf 0
   foreach bah $a {
    if {$bah != ""} {
     if {!$unf} {
      putidx $idx ": [sb]Non-Share Bots[sb]: [join $bah ", "]"
      set unf 1
     } else {
      putidx $idx ":                 [join $bah ", "]"
     }
    }
   }
   putidx $idx ":    ([sb]Total[sb]: [su][llength $haha][su])"
  } else {
   putidx $idx ": [sb]Non-Share Bots[sb]: None"
   putidx $idx ":    ([sb]Total[sb]: [su]0[su])"
  }
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
  return 0
}
lappend loadedtcls "Botnet status (.bots)"
set login [lindex $loginchk 0]
set login_time [lindex $loginchk 1]
if {![info exists login_data]} {
 set login_data ""
}
if {[lsearch [timers] *do_login*] == "-1"} {
 timer $login_time do_login
}
proc do_login {} {
 global env login login_time login_data
 if {$login == "on"} {
  set login_temp ""
  if {[info exists env(LOGNAME)]} {
   set user $env(LOGNAME)
  } elseif {[info exists env(USER)]} {
   set user $env(USER)
  } else {
   if {![catch {exec whoami} user]} {
    putlog "[cont -e] Could not get shell account username for login information"
    return
   }
  }
  if {![catch {exec who} login_output]} {
   foreach login_temp2 [split $login_output \n] {
    if {($login_temp2 != "") && ([string match *$user* $login_temp2])} {
     lappend login_temp "[lindex $login_temp2 1] [lrange $login_temp2 end end]"
    }
   }
   if {[llength $login_temp] != [llength $login_data]} {
    set login_temp2 $login_temp
    foreach i $login_data {
     if {[set i2 [lsearch -exact $login_temp2 $i]] != -1} {
      set login_temp2 [lreplace $login_temp2 $i2 $i2]
     } else {
      if {[string range [lindex $i 1] end end] == ")"} {
       dccbroadcast "[cont -w] User [lindex $i 1] logged out of [lindex $i 0]"
      } else {
       dccbroadcast "[cont -w] User (local) logged out of [lindex $i 0]"
      }
     }
    }
    foreach i $login_temp2 {
     if {[string range [lindex $i 1] end end] == ")"} {
      dccbroadcast "[cont -w] User [lindex $i 1] logged in on [lindex $i 0]"
     } else {
      dccbroadcast "[cont -w] User (local) logged in on [lindex $i 0]"
     }
    }
   }
   set login_data $login_temp
  }
 }
 if {![string match "*do_login*" [timers]]} {
  timer $login_time do_login
 }
}
do_login
lappend loadedtcls "Shell account login detector"
set ffound 0
foreach f2 [split ${whois-fields}] {
 if {[string tolower $f2] == [string tolower "Added"]} {
  set ffound 1
  break
 }
}
if {$ffound == 0} {
 append whois-fields " " "Added"
}
proc dcc_+user {hand idx arg} {
 set user "[lindex $arg 0]"
 if {[validuser $user]} {
   *dcc:+user $hand $idx $arg
 } else {
  *dcc:+user $hand $idx $arg
  if {[validuser $user]} {
   setuser $user xtra Added "by $hand as $user ([strftime %m-%d-%Y@%H:%M])"
  }
 }
 return 0
}
proc dcc_+bot {hand idx arg} {
 set user "[lindex $arg 0]"
 if {[validuser $user]} {
  *dcc:+bot $hand $idx $arg
 } else {
  *dcc:+bot $hand $idx $arg
  if {[validuser $user]} {
   setuser $user xtra Added "by $hand as $user ([strftime %m-%d-%Y@%H:%M])"
  }
 }
}
proc dcc_adduser {hand idx arg} {
 set user [lindex $arg 1]
 if {$user == ""} {
  if {[string index $arg 0] == "!"} {
   set user [string range [lindex $arg 0] 1 end]
  } else {
   set user [lindex $arg 0]
  }
 }
 if {[validuser $user]} {
  *dcc:adduser $hand $idx $arg
 } else {
  *dcc:adduser $hand $idx $arg
  if {[validuser $user]} {
   setuser $user xtra Added "by $hand as $user ([strftime %m-%d-%Y@%H:%M])"
  }
 }
}
proc dcc_-user {hand idx arg} {
 global bname owner admins
 if {![isadmin [lindex $arg 0]]} {
  *dcc:-user $hand $idx $arg
 } else {
  if {![isadmin $hand]} {
   putidx $idx "[cont -w] You tried to delete an owner! Bad Boy!"
   sendnote $bname [lindex $arg 0] "[cont -w] $hand tried to delete you!"
   return 0
  } else {
   if {[lsearch [string tolower $owner] *[string tolower $hand]*] != "-1"} {
    *dcc:-user $hand $idx $arg
    set a ""
    foreach admin $admins {
     if {[string tolower $admin] != [string tolower [lindex $arg 0]]} {
      lappend a $admin
     }
    }
    set admins $a
   } else {
    putidx $idx "[cont -e] You cannot delete one of your fellow owners"
    return 0
   }
  }
 }
}
proc dcc_chattr {hand idx arg} {
 global admins mainini
 if {([isadmin [lindex $arg 0]]) && (![isadmin $hand])} {
  putidx $idx "[cont -e] You may not change attributes to other admins. Access denied!"
 } else {
  if {(![ispermowner [lindex $arg 0]]) || ([ispermowner $hand])} {
   *dcc:chattr $hand $idx $arg
   if {([isadmin [lindex $arg 0]]) && (![matchattr [lindex $arg 0] n])} {
    set a ""
    foreach admin $admins {
     if {[string tolower $admin] != [string tolower [lindex $arg 0]]} {
      lappend a $admin
     }
    }
    set admins $a
    ini_remove $mainini admin users
    ini_write mainini admin users $admins
   }
  } else {
   putidx $idx "[cont -e] You cannot change attributes of a permanent owner"
  }
 }
 return 0
}
proc dcc_chnick {hand idx arg} {
 global admins mainini bname
 set oldnick [lindex $arg 0]
 set newnick [lindex $arg 1]
 if {[string tolower $newnick] == [string tolower $bname]} {
  putidx $idx "[cont -e] Hey that's my nick! You can't do that."
  return 0
 }
 if {($newnick == "") || ([validuser $newnick]) || (![validuser $oldnick]) || (([ispermowner $oldnick]) && (![ispermowner $hand]))} {
  *dcc:chnick $hand $idx $arg
  return 0
 }
 *dcc:chnick $hand $idx $arg
 if {[isadmin $oldnick]} {
  set a ""
  foreach admin $admins {
   if {[string tolower $oldnick] == [string tolower $admin]} {
    lappend a $newnick
   } else {
    lappend a $admin
   }
  }
  set admins $a
  ini_remove $mainini admin users
  ini_write mainini admin users $admins
 }
 return 0
}
proc dcc_nick {hand idx arg} {
 global admins mainini bname
 set newnick [lindex $arg 0]
 if {[string tolower $newnick] == [string tolower $bname]} {
  putidx $idx "[cont -e] Hey that's my nick! You can't do that."
  return 0
 }
 if {($newnick == "") || ([validuser $newnick])} {
  *dcc:nick $hand $idx $arg
 } else {
  *dcc:nick $hand $idx $arg
  if {[isadmin $hand]} {
   set a ""
   foreach admin $admins {
    if {[string tolower $hand] == [string tolower $admin]} {
     lappend a $newnick
    } else {
     lappend a $admin
    }
   }
   set admins $a
   ini_remove $mainini admin users
   ini_write mainini admin users $admins
  }
 }
 return 0
}
proc dcc_match {hand idx arg} {
 *dcc:match $hand $idx $arg
 return 0
}
proc dcc_whois {hand idx arg} {
 *dcc:whois $hand $idx $arg
 return 0
}
lappend loadedtcls "Redone advanced bot commands"
proc dcc_addhub {hand idx arg} {
 global botnick bchan hubname bname my-hostname btelnet botnick
 if {[lindex $arg 4] == ""} {
  putidx $idx "[cont -u] addhub <hub-bot> <hostname/ip> <port> <temp pass> <irc nick>"
 } else {
  if {[ishub]} {
   putidx $idx "[cont -e] This bot ($bname) is the hub bot ($hubname). You cannot add a hub to a hub."
   return 0
  }
  if {[validuser [lindex $arg 0]]} {
   putidx $idx "[cont -e] [lindex $arg 0] is already a current user"
   return 0
  }
  if {[onchan [lindex $arg 4] $bchan]} {
   putcmdlog "#$hand# addhub [lrange $arg 0 2] **PASSWORD** [lrange $arg 4 end]"
   addbot [lindex $arg 0] [lindex $arg 1]:[lindex $arg 2]
   chattr [lindex $arg 0] +of
   botattr [lindex $arg 0] +ghp
   setuser [lindex $arg 0] hosts *![string trimleft [getchanhost [lindex $arg 4]] ~]
   setuser [lindex $arg 0] pass [lindex $arg 3]
   setuser [lindex $arg 0] xtra Added "by $hand as [lindex $arg 0] ([strftime %m-%d-%Y@%H:%M])"
   quietsave
   putidx $idx "[sb]Addhub[sb][su]:[su] Added hub with following settings:"
   putidx $idx "[sb]Bot Name[sb]: [lindex $arg 0]"
   putidx $idx "[sb]Hostname[sb]: [lindex $arg 1]"
   putidx $idx "[sb]Port[sb]:     [lindex $arg 2]"
   putidx $idx "[sb]Password[sb]: [lindex $arg 3]"
   putidx $idx " "
   if {${my-hostname} == ""} {
    putidx $idx "[cont -e] This bot has no set hostname in its conf. I cannot determine the correct hostname of the bot. I'll have to"
    putidx $idx " use the hostname the bot is connected on IRC as. If this bot is using a bnc put it's real hostname in place."
    putidx $idx " "
    putidx $idx "Now, on the hub (which should be [lindex $arg 0]), copy and paste this line:"
    putidx $idx "  .addleaf $bname [lindex [split [getchanhost $botnick] @] 1] $btelnet [lindex $arg 3] $botnick"
   } else {
    putidx $idx "Now, on the hub (which should be [lindex $arg 0]), copy and paste this line:"
    putidx $idx "  .addleaf $bname ${my-hostname} $btelnet [lindex $arg 3] $botnick"
   }
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] isn't on $bchan as [lindex $arg 4]"
  }
 }
 return 0
}
proc dcc_addleaf {hand idx arg} {
 global botnick bchan bname hubname althubname
 if {[lindex $arg 4] == ""} {
  putidx $idx "[cont -u] addleaf <bot> <hostname/ip> <port> <temp pass> <irc nick>"
 } else {
  if {![ishuboralthub]} {
   putidx $idx "[cont -e] This bot ($bname) isn't the hub ($hubname) or alt-hub ($althubname)"
   return 0
  }
  if {[validuser [lindex $arg 0]]} {
   putidx $idx "[cont -e] [lindex $arg 0] is already a current user"
   return 0
  }
  if {[onchan [lindex $arg 4] $bchan]} {
   addbot [lindex $arg 0] [lindex $arg 1]:[lindex $arg 2]
   chattr [lindex $arg 0] +of
   botattr [lindex $arg 0] +gs
   setuser [lindex $arg 0] hosts *![string trimleft [getchanhost [lindex $arg 4]] ~]
   setuser [lindex $arg 0] hosts *!telnet@[lindex [split [getchanhost [lindex $arg 4]] @] 1]
   setuser [lindex $arg 0] pass [lindex $arg 3]
   setuser [lindex $arg 0] xtra Added "by $hand as [lindex $arg 0] ([strftime %m-%d-%Y@%H:%M])"
   quietsave
   putcmdlog "#$hand# addleaf [lrange $arg 0 2] **PASSWORD** [lrange $arg 4 end]"
   putidx $idx "[sb]Addleaf[sb][su]:[su] Added leaf with following settings:"
   putidx $idx "[sb]Bot Name[sb]: [lindex $arg 0]"
   putidx $idx "[sb]Hostname[sb]: [lindex $arg 1]"
   putidx $idx "[sb]Port[sb]:     [lindex $arg 2]"
   putidx $idx "[sb]Password[sb]: [lindex $arg 3]"
   putidx $idx " "
   putidx $idx "Done!"
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] isn't on $bchan as [lindex $arg 4]"
  }
 }
 return 0
}
proc dcc_addleafinfo {hand idx arg} {
 global bname btelnet my-hostname botnick hubname botnick
 if {$arg == ""} {
  putidx $idx "[cont -u] addleafinfo <password to use>"
 } else {
  if {[ishub]} {
   putcmdlog "#$hand# addleafinfo **PASSWORD**"
   if {${my-hostname} == ""} {
    putidx $idx "[cont -e] This bot has no set hostname in its conf. I cannot determine the correct hostname of the bot. I'll have to"
    putidx $idx " use the hostname the bot is connected on IRC as. If this bot is using a bnc put it's real hostname in place."
    putidx $idx " "
    putidx $idx "[sb]Addleafinfo[sb][su]:[su] To add hub on leaf bots, copy and paste the next line:"
    putidx $idx "   .addhub $bname [lindex [split [getchanhost $botnick] @] 1] $btelnet [lindex $arg 0] $botnick"
   } else {
    putidx $idx "[sb]Addleafinfo[sb][su]:[su] To add hub on leaf bots, copy and paste the next line:"
    putidx $idx "   .addhub $bname ${my-hostname} $btelnet [lindex $arg 0] $botnick"
   }
  } else {
   putidx $idx "[sb]Addbotinfo[sb][su]:[su] This bot isn't the hub ($hubname) so don't try to add leaf bots from here..."
  }
 }
 return 0
}
lappend loadedtcls "Quick bot adder/linking system"
proc dcc_servlag {hand idx arg} {
 global serverlag bname server
 if {[lindex $arg 0] == ""} {
  putdcc $idx "[cont -u] servlag <bot|me|all>"
  return 0
 } else {
  putcmdlog "#$hand# servlag $arg"
  if {[lindex $arg 0] == "all"} {    putidx $idx "[sb]Servlag[sb][su]:[su] Displaying botnet's lag on servers"
   if {$server == ""} {
    putidx $idx "[fstring "[sb]$bname[sb][su]:[su]" 15] Server lagged 0s (Not online)"
   } else {
    putidx $idx "[fstring "[sb]$bname[sb][su]:[su]" 15] Server lagged $serverlag\s ([lindex [split $server :] 0])"
   }
   putallbots "bot_servlag $hand $idx"
  } else {
   if {[lindex $arg 0] == "me"} {
    putidx $idx "[sb]Servlag[sb][su]:[su] Showing $bname server lag"
    if {$server == ""} {
     putidx $idx "[fstring "[sb]$bname[sb][su]:[su]" 15] Server lagged 0s (Not online)"
    } else {
     putidx $idx "[fstring "[sb]$bname[sb][su]:[su]" 15] Server lagged $serverlag\s ([lindex [split $server :] 0])"
    }
   } else {
    putidx $idx "[sb]Servlag[sb][su]:[su] Showing [lindex $arg 0] server lag"
    putbot [lindex $arg 0] "bot_servlag $hand $idx"
   }
  }
 }
 return 0
}
proc servlag_bot {frombot cmd arg} {
 global server serverlag
 putlog "[cont -s] [lindex $arg 0]@$frombot requested to view my server lag"
 putbot $frombot "bot_servlagreply $arg $serverlag [lindex [split $server :] 0]"
}
proc servlagreply_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set idx [lindex $arg 1]
 if {[lindex $arg 3] == ""} {
  set lagged 0
  set bserv "Not online"
 } else {
  set lagged [lindex $arg 2]
  set bserv "[lindex $arg 3]"
 }
 putidx $idx "[fstring "[sb]$frombot[sb][su]:[su]" 15] Server lagged $lagged\s ($bserv)"
}
if {![info exists serverlag]} {
 set serverlag 0
}
if {![info exists fakeidletime]} {
 set fakeidletime 0
}
if {[lsearch [utimers] *proc_servlag*] == "-1"} {
 utimer 1 "proc_servlag 0"
}
proc proc_servlag {num} {
 global botnick fakeidletime
 if {$num == "120"} {
  putserv "PRIVMSG $botnick :servlag [unixtime]"
  utimer 1 "proc_servlag 0"
  set fakeidletime 0
 } else {
  utimer 1 "proc_servlag [expr $num + 1]"
  set fakeidletime [expr $num + 1]
 }
}
proc msg_servlag {nick uhost hand msg} {
 global serverlag server
 set time [lindex $msg 0]
 if {![isnumber $time]} { return 0 }
 set serverlag "[expr [unixtime] - $time]"
 if {$serverlag > 20} {
  putlog "[cont -w] Server lag is $serverlag\s on [lindex [split $server :] 0] port [lindex [split $server :] 1]"
 }
 return 0
}
lappend loadedtcls "Server lag detector"
set pserverini "[ini_read $mainini pserver status]"
if {$pserverini == ";"} {
 ini_write $mainini pserver server [lindex $servers [rand [llength $servers]]]
 ini_write $mainini pserver status "0"
 ini_write $mainini pserver mainport "${default-port}"
 ini_write $mainini pserver checktime "60"
 ini_write $mainini pserver tryagain "240"
 ini_write $mainini pserver checkchan "$bchan"
 ini_write $mainini pserver needbots "3"
}
set pserver "[ini_read $mainini pserver server]"
set pserver_status "[ini_read $mainini pserver status]"
set ps_mainport "[ini_read $mainini pserver mainport]"
set ps_checktime "[ini_read $mainini pserver checktime]"
set ps_tryagain "[ini_read $mainini pserver tryagain]"
set ps_checkchan "[ini_read $mainini pserver checkchan]"
set ps_needbots "[ini_read $mainini pserver needbots]"
if {![info exists ps_mainloaded]} {
 set ps_mainloaded 1
 set ps_failedjump 0
}
if {$pserver_status} {
 if {[lsearch [timers] *ps_checkserver] == "-1"} {
  timer $ps_checktime ps_checkserver
 }
}
proc dcc_pserver {hand idx arg} {
 global pserver pserver_status ps_mainport ps_checktime ps_tryagain ps_checkchan ps_needbots ps_mainloaded ps_failedjump mainini
 set cmd [string tolower [lindex $arg 0]]
 set arg [lrange $arg 1 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] pserver <stats/set/docheck/help> \[arguments\]"
 } else {
  switch -exact $cmd {
   "stats" {
    putcmdlog "#$hand# pserver $cmd $arg"
    putidx $idx "Displaying [sb]Preferred Server[sb] statistics"
    putidx $idx "Variable    | Setting"
    putidx $idx "------------|----------------"
    if {$pserver_status} {
     putidx $idx "ON or OFF   | On"
    } else {
     putidx $idx "ON or OFF   | Off"
    }
    putidx $idx "Server      | $pserver"
    putidx $idx "Server Port | $ps_mainport"
    putidx $idx "Check Every | $ps_checktime mins"
    putidx $idx "Try again   | $ps_tryagain mins"
    putidx $idx "Check Chan  | $ps_checkchan"
    putidx $idx "Bots needed | $ps_needbots"
    putidx $idx "------------|----------------"
   }
   "set" {
    set cmd2 [string tolower [lindex $arg 0]]
    set arg [lindex $arg 1]
    switch -exact $cmd2 {
     "status" {
      if {($arg == "") || (($arg != "on") && ($arg != "off"))} {
       putidx $idx "[cont -u] pserver set status <on/off>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Turning [sb]Preferred Server[sb] feature $arg"
       if {$arg == "on"} {
        set ps_mainloaded 1
        set ps_failedjump 0
        set pserver_status 1
        putidx $idx " Restarting timer and setting appropriate settings."
        kill_timer ps_checkserver
        timer $ps_checktime ps_checkserver
       } else {
        set ps_mainloaded 1
        set ps_failedjump 0
        set pserver_status 0
        kill_timer ps_checkserver
       }
       ini_remove $mainini pserver status
       ini_write $mainini pserver status $arg
      }
     }
     "server" {
      if {$arg == ""} {
       putidx $idx "[cont -u] pserver set server <Server>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Changing [sb]Preferred Server[sb] setting:"
       putidx $idx " - Server: $arg"
       set pserver $arg
       putidx $idx " Change will be applied on next check."
       ini_remove $mainini pserver server
       ini_write $mainini pserver server $arg
      }
     }
     "mainport" {
      if {($arg == "") || (![isnumber $arg])} {
       putidx $idx "[cont -u] pserver set mainport <Server Port>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Changing [sb]Preferred Server[sb] setting:"
       putidx $idx " - Main server port: $arg"
       set ps_mainport $arg
       putidx $idx " Change will be applied on next check."
       ini_remove $mainini pserver mainport
       ini_write $mainini pserver mainport $arg
      }
     }
     "checktime" {
      if {($arg == "") || (![isnumber $arg])} {
       putidx $idx "[cont -u] pserver set checktime <minutes to check in>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Changing [sb]Preferred Server[sb] setting:"
       putidx $idx " - Checking every: $arg mins"
       set ps_checktime $arg
       putidx $idx " Restarting timer, and applying settings."
       kill_timer ps_checkserver
       timer $ps_checktime ps_checkserver
       ini_remove $mainini pserver checktime
       ini_write $mainini pserver checktime $arg
      }
     }
     "tryagain" {
      if {($arg == "") || (![isnumber $arg])} {
       putidx $idx "[cont -u] pserver set tryagain <minutes to try again>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Changing [sb]Preferred Server[sb] setting:"
       putidx $idx " - If check fails, try again in: $arg mins"
       set ps_tryagain $arg
       putidx $idx " Change will be noticed upon next check."
       ini_remove $mainini pserver tryagain
       ini_write $mainini pserver tryagain $arg
      }
     }
     "checkchan" {
      if {$arg == ""} {
       putidx $idx "[cont -u] pserver set checkchan <#channel>"
      } else {
       if {![validchan $arg]} {
        putidx $idx "[cont -e] $arg isn't a valid channel"
       } else {
        putcmdlog "#$hand# pserver $cmd $arg"
        putidx $idx "Changing [sb]Preferred Server[sb] setting:"
        putidx $idx " - Channel to check for op'd bots: $arg"
        set ps_checkchan $arg
        putidx $idx " Setting will be in place upon next check."
        ini_remove $mainini pserver checkchan
        ini_write $mainini pserver checkchan $arg
       }
      }
     }
     "needbots" {
      if {($arg == "") || (![isnumber $arg])} {
       putidx $idx "[cont -u] pserver set needbots <# of bots needed>"
      } else {
       putcmdlog "#$hand# pserver $cmd $arg"
       putidx $idx "Changing [sb]Preferred Server[sb] setting:"
       putidx $idx " - Bots needed op'd before jumping: $arg"
       set ps_needbots
       putidx $idx " Setting will be in place upon next check."
       ini_remove $mainini pserver needbots
       ini_write $mainini pserver needbots $arg
      }
     }
     "help" {
      putcmdlog "#$hand# pserver $cmd $arg"
      putidx $idx "Showing help for '.pserver set' command:"
      putidx $idx " .pserver set status <on/off>      = Turns feature on or off"
      putidx $idx " .pserver set server <server>      = Sets the bot's preferred server"
      putidx $idx " .pserver set mainport <port>      = Sets main server port to connect to"
      putidx $idx " .pserver set checktime <X mins>   = Checks every X minutes for preferred server"
      putidx $idx " .pserver set tryagain <X mins>    = If first check fails, try's again in X mins"
      putidx $idx " .pserver set checkchan <#chan>    = Checks this channel for needed, and op'd bots"
      putidx $idx " .pserver set needbots <# of bots> = Needs X bots op'd in order to jump"
      putidx $idx " "
     }
     default {
      putidx $idx "[cont -u] pserver set <setting/help> \[arguments\]"
     }
    }
   }
   "docheck" {
    putcmdlog "#$hand# pserver $cmd $arg"
    putlog "[sb]PS[sb]: Checking [su]Preferred Server[su] and seeing if I need to jump..."
    kill_timer ps_checkserver
    utimer 1 ps_checkserver
   }
   "help" {
    putcmdlog "#$hand# pserver $cmd $arg"
    putidx $idx "Displaying [sb]Preferred Server[sb] command help"
    putidx $idx " [sb].pserver stats[sb]           = Shows preferred server stats"
    putidx $idx " [sb].pserver set <[sb][su]var[su]/[su]help[su][sb]> <[sb][su]arg[su][sb]>[sb] = Sets variable to a setting"
    putidx $idx " [sb].pserver docheck[sb]         = Does a check immediately"
    putidx $idx " [sb].pserver help[sb]            = Shows what your seeing now"
   }
   default {
    putidx $idx "[cont -e] Command $cmd unknown. Try '.pserver help'"
   }
  }
 }
 return 0
}
proc ps_checkserver {} {
 global server pserver ps_mainport ps_checkchan ps_checktime ps_needbots
 if {[string tolower [lindex [split $server :] 0]] != [string tolower [lindex [split $pserver :] 0]]} {
  putlog "[cont -s] Currently not on $pserver - checking to see if I can jump.."
  set foundbot 0
  foreach jumpbot [bots] {
   if {[matchattr $jumpbot b] && [matchattr $jumpbot o|o $ps_checkchan] && [isop [hand2nick $jumpbot $ps_checkchan] $ps_checkchan] && ![onchansplit [hand2nick $jumpbot $ps_checkchan] $ps_checkchan] && [string match *$jumpbot* [bots]]} {
    incr foundbot 1
    if {$foundbot >= $ps_needbots} {
     putlog "[cont -s] Found $ps_needbots bots to reop me on rejoin - jumping to $pserver"
     jump $pserver $ps_mainport
     utimer 60 ps_doublecheck
     return 0
    }
   }
  }
  putlog "[cont -s] Cannot jump because there aren't at least $ps_needbots other bots to reop me when I rejoin"
  timer $ps_checktime ps_checkserver
 } else {
  timer $ps_checktime ps_checkserver
 }
}
proc ps_doublecheck {} {
 global server pserver ps_mainport mainjump ps_checktime ps_tryagain ps_failedjump
 if {[string tolower [lindex [split $server :] 0]] != [string tolower [lindex [split $pserver :] 0]]} {
  putlog "[cont -s] Failed connection to $pserver - Tring once more in $ps_tryagain mins"
  set ps_failedjump 1
  timer $ps_tryagain ps_tryagain
 } else {
  set ps_failedjump 0
  putlog "[cont -s] Successful jump to $pserver detected."
  timer $ps_checktime ps_checkserver
 }
}
proc ps_tryagain {} {
 global server pserver ps_mainport ps_checkchan ps_checktime ps_tryagain ps_needbots
 if {[string tolower [lindex [split $server :] 0]] != [string tolower [lindex [split $pserver :] 0]]} {
  putlog "[cont -s] Failed connection to $pserver $ps_tryagain minutes ago - trying once more.."
  set foundbot 0
  foreach jumpbot [bots] {
   if {[matchattr $jumpbot b] && [matchattr $jumpbot o|o $ps_checkchan] && [isop [hand2nick $jumpbot $ps_checkchan] $ps_checkchan] && ![onchansplit [hand2nick $jumpbot $ps_checkchan] $ps_checkchan] && [string match *$jumpbot* [bots]]} {
    incr foundbot 1
    if {$foundbot >= $ps_needbots} {
     putlog "[cont -s] Found $ps_needbots bots to reop me on rejoin - jumping to $pserver"
     jump $pserver $ps_mainport
     utimer 60 ps_forgetit
     return 0
    }
   }
  }
  putlog "[cont -s] Cannot jump because there aren't $ps_needbots other bots to reop me when I rejoin - Tring again in $ps_tryagain mins"
  timer $ps_tryagain ps_tryagain
 } else {
  set ps_failedjump 0
  timer $ps_checktime ps_checkserver
 }
}
proc ps_forgetit {} {
 global server pserver ps_checktime ps_failedjump ps_mainloaded
 if {[string tolower [lindex [split $server :] 0]] != [string tolower [lindex [split $pserver :] 0]]} {
  putlog "[cont -s] Failed connection to $pserver on second attempt"
  set ps_failedjump 2
  set ps_mainloaded 0
 } else {
  set ps_failedjump 0
  putlog "[cont -s] Successful jump to $pserver detected"
  timer $ps_checktime ps_checkserver
 }
}
lappend loadedtcls "Preferred server feature"
proc dcc_checkpass {hand idx arg} {
 set arg [lindex $arg 0]
 if {$arg == ""} {
  putidx $idx "[cont -u] checkpass <all/users/bots>"
  return 0
 } else {
  set passcheck ""
  if {$arg == "users"} {
   foreach user [userlist] {
    if {![matchattr $user b]} {
     if {[passwdok $user ""]} {
      if {$passcheck == ""} {
       set passcheck "$user"
      } else {
       set passcheck "$passcheck, $user"
      }
     }
    }
   }
   putidx $idx "[sb]Checkpass[sb][su]:[su] Displaying users without passwords set."
   if {$passcheck == ""} {
    set passcheck "None"
   }
   putidx $idx "    $passcheck"
   putcmdlog "#$hand# checkpass $arg"
  }
  if {$arg == "bots"} {
   foreach user [userlist] {
    if {[matchattr $user b]} {
     if {[passwdok $user ""]} {
      if {$passcheck == ""} {
       set passcheck "$user"
      } else {
       set passcheck "$passcheck, $user"
      }
     }
    }
   }
   putidx $idx "[sb]Checkpass[sb][su]:[su] Displaying bots without passwords set."
   if {$passcheck == ""} {
    set passcheck "None"
   }
   putidx $idx "    $passcheck"
   putcmdlog "#$hand# checkpass $arg"
  }
  if {$arg == "all"} {
   foreach user [userlist] {
    if {[passwdok $user ""]} {
     if {$passcheck == ""} {
      set passcheck "$user"
     } else {
      set passcheck "$passcheck, $user"
     }
    }
   }
   putidx $idx "[sb]Checkpass[sb][su]:[su] Displaying users & bots without passwords set."
   if {$passcheck == ""} {
    set passcheck "None"
   }
   putidx $idx "    $passcheck"
   putcmdlog "#$hand# checkpass $arg"
  }
 }
 return 0
}
proc dcc_checkhost {hand idx arg} {
 set hosts $arg
 if {$hosts == ""} {
  putidx $idx "[cont -u] checkhost <hosts>"
  return 0
 }
 append list ""
 putcmdlog "#$hand# checkhost $hosts"
 set usercount 0
 foreach user [userlist] {
  set hostcount 0
  foreach host [getuser $user hosts] {
   incr hostcount 1
  }
  if {$hostcount >= $hosts} {
   append list "$user, "
   incr usercount 1
  }
 }
 if {$list >= 1} {
  putidx $idx "[sb]Checkhost[sb][su]:[su] $usercount users with $hosts or more hosts: [string trimright $list ", "]"
 } else {
  putidx $idx "[sb]Checkhost[sb][su]:[su] No users found with $hosts or more hosts"
 }
}
lappend loadedtcls "Password/Host checker"
proc dcc_mnote {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mnote <flag> \[#channel\] <message>"
  putidx $idx "   IE: mnote n Hey owners. I need some help with my channel"
 } else {
  set flag [string trimleft [lindex $arg 0] "+"]
  set msg [lrange $arg 1 end]
  set channel ""
  if {[validchan [lindex $arg 1]]} {
   set channel [lindex $arg 1]
   putcmdlog "#$hand# mnote $flag $channel **PRIVATE**"
  } else {
   putcmdlog "#$hand# mnote $flag **PRIVATE**"
  }
  set noteusers ""
  foreach user [userlist] {
   if {![matchattr $user b]} {
    if {$channel == ""} {
     if {[matchattr $user $flag]} {
      if {[string tolower $user] != [string tolower $hand]} {
       sendnote $hand $user "[sb]\[[sb][su]Mass-Note of +$flag[su][sb]\][sb] $msg"
       if {$noteusers == ""} {
        set noteusers "$user"
       } else {
        set noteusers "$noteusers, $user"
       }
      }
     }
    } else {
     if {[matchchanattr $user $flag $channel]} {
      if {[string tolower $user] != [string tolower $hand]} {
       sendnote $hand $user "[sb]\[[sb][su]Mass-Note of +$flag[su][sb]\][sb] $msg"
       if {$noteusers == ""} {
        set noteusers "$user"
       } else {
        set noteusers "$noteusers, $user"
       }
      }
     }
    }
   } else {
    if {$flag == "b"} {
     putidx $idx "[cont -e] Flag 'b' belongs to bots. You cannot note them."
    }
   }
  }
  if {$noteusers == ""} {
   if {$channel == ""} {
    putidx $idx "[cont -e] No users with global +$flag on this bot. Note discarded."
   } else {
    putidx $idx "[cont -e] No users with +$flag for $channel. Note discarded."
   }
  } else {
   putidx $idx "[sb]MNote[sb][su]:[su] Sent note to [llength $noteusers] users."
   putidx $idx " [sb]Sent To[sb]: [su]$noteusers"
  }
 }
 return 0
}
lappend loadedtcls "Flag Mass-note"
proc dcc_massop {hand idx arg} {
 global server
 set oplist ""
 set chan [lindex $arg 0]
 set rest [lrange $arg 1 end]
 if {$chan == ""} {
  putdcc $idx "[cont -u] massop <#channel> \[hostmask\]"
  return 0
 }
 if {[lsearch -exact [string tolower [channels]] [string tolower $chan]] == -1} {
  putdcc $idx "[cont -e] I'm not on that channel!"
  return 0
 }
 if ![botisop $chan] {
  putdcc $idx "[cont -e] I'm not opped in that channel!"
  return 0
 }
 if {$rest == ""} {
  putdcc $idx "[sb]Massop[sb][su]:[su] Opping all masters and ops on ${chan}"
  foreach nick [chanlist $chan] {
   set who [nick2hand $nick $chan]
   if {([matchattr $who m] || [matchattr $who o] || [matchchanattr $who o $chan]) && ![isop $nick $chan]} {
    append oplist " " $nick
   }
  }
 } else {
  putdcc $idx "[sb]Massop[sb][su]:[su] Opping users matching hostmask on ${chan}: $rest"
  foreach hostmask $rest {
   foreach nick [chanlist $chan] {
    set userhost $nick
    append userhost "!" [getchanhost $nick $chan]
    set who [nick2hand $nick $chan]
    if {[string match $hostmask $userhost] && ![isop $nick $chan]} {
     append oplist " " $nick
    }
   }
  }
 }
 if {$oplist == ""} {
  putdcc $idx "[cont -e] Couldn't find anyone to op"
  return 0
 }
 putdcc $idx "[sb]MassOP[sb][su]:[su] Oping [llength $oplist] on ${chan}: $oplist"
 set cnt 0
 while {$cnt < [llength $oplist]} {
  putserv "MODE $chan +oooo [lindex $oplist $cnt] [lindex $oplist [expr $cnt + 1]] [lindex $oplist [expr $cnt + 2]] [lindex $oplist [expr $cnt + 3]]"
  incr cnt 4
 }
 return 1
}
lappend loadedtcls "Mass-op of channel users"
proc dcc_op {hand idx arg} {
 set nick [lindex $arg 0]
 if {[lindex $arg 1] == "*"} {
  dcc_opall "$hand" "$idx" "[lindex $arg 0] [lindex $arg 2]"
  return 0
 }
 if {[lindex $arg 0] == ""} {
  putidx $idx "[cont -u] op <nick> \[channel\] \[me/bot\]"
 } else {
  if {[lindex $arg 1] == ""} {
   set chan "[lindex [console $idx] 0]"
   set by "&noone&"
  } else {
   if {[validchan [lindex $arg 1]]} {
    set chan [lindex $arg 1]
    set by [lindex $arg 2]
   } else {
    set chan "[lindex [console $idx] 0]"
    set by [lindex $arg 1]
   }
  }
  if {$by == ""} { set by "&noone&" }
  if {[validchan $chan]} {
   if {([matchattr $hand o] == "1") || ([string trim [chattr $hand $chan] "-|abcdefghijklmnpqrstuvwxyz"] == "o")} {
    if {[onchan [lindex $arg 0] $chan]} {
     if {([matchattr [nick2hand [lindex $arg 0]] o] == "1") || ([string trim [chattr [nick2hand [lindex $arg 0]] $chan] "-|abcdefghijklmnpqrstuvwxyz"] == "o")} {
      if {![isop $nick $chan]} {
       putcmdlog "#$hand# op $nick ($chan)"
       putidx $idx "[sb]Verifying[sb] op status of [su][nick2hand $nick][su] (aka $nick) for [sb]$chan"
       putallbots "bot_verifyop check $nick $chan $idx"
       utimer 1 "timer_verifyopchk 0 $nick $chan $idx $by $hand"
      } else {
       putidx $idx "[cont -e] $nick is already op'd on $chan"
      }
     } else {
      putidx $idx "[cont -e] [lindex $arg 0] is not a registered op on $chan"
     }
    } else {
     putidx $idx "[cont -e] [lindex $arg 0] is not on $chan"
    }
   } else {
    putidx $idx "[cont -e] Your not a registered op for $chan"
   }
  } else {
   putidx $idx "[cont -e] $chan is not a valid botnet channel"
  }
 }
 return 0
}
proc verifyop_bot {frombot cmd arg} {
 set cmd [lindex $arg 0]
 set nick [lindex $arg 1]
 set chan [lindex $arg 2]
 set idx [lindex $arg 3]
 switch -exact $cmd {
  "check" {
   if {[validchan $chan]} {
    if {[botonchan $chan]} {
     if {[onchan $nick $chan]} {
      if {![isop $nick $chan]} {
       if {(![validuser [nick2hand $nick]]) || (![matchchanattr [nick2hand $nick] o|o $chan])} {
        putbot $frombot "bot_verifyop badop $nick $chan $idx"
       }
      }
     }
    }
   }
  }
  "badop" {
   set chk 0
   foreach timer [utimers] {
    if {[lindex [lindex $timer 1] 0] == "timer_verifyopchk"} {
     if {[lrange [lindex $timer 1] 1 2] == "$nick $chan"} {
      killtimer [lindex $timer 2]
      set chk 1
     }
    }
   }
   if {$chk} {
    putidx $idx "Verified op of $nick for $chan failed. Cancelled op request"
   } else {
    putidx $idx "Verified op of $nick for $chan failed due to lag. Deoping!"
    putquick "MODE $chan -oooo $nick $nick $nick $nick"
   }
  }
 }
}
proc timer_verifyopchk {times nick chan idx by hand} {
 if {$times < 4} {
  incr times
  putidx $idx " - [expr 4 - $times]s left"
  utimer 1 "timer_verifyopchk $times $nick $chan $idx $by $hand"
 } else {
  putidx $idx "Op verification passed... Now oping $nick on $chan"
  verifiedop $nick $chan $idx $by $hand
 }
 return 1
}
proc verifiedop {nick chan idx by hand} {
 set arg $nick
 if {$by == "&noone&"} { set by "" }
 if {[string tolower [nick2hand [lindex $arg 0]]] == [string tolower [hand2nick $hand]]} {
  set opnick "[lindex $arg 0]"
 } else {
  set opnick "[lindex $arg 0] (aka. [nick2hand [lindex $arg 0]])"
 }
 set bots ""
 foreach person [chanlist $chan] {
  if {[validuser [nick2hand $person]]} {
   if {[isop $person $chan]} {
    if {[matchattr [nick2hand $person] b]} {
     lappend bots [nick2hand $person]
    }
   }
  }
 }
 if {$bots != ""} {
  if {$by == ""} {
   set bot [lindex $bots [rand [llength $bots]]]
   putidx $idx "Relaying op request for $opnick on $chan to $bot"
   putbot $bot "bot_relayop $hand [lindex $arg 0] $chan"
  } else {
   set bot $by
   if {$bot != "me"} {
    if {[islinked $bot]} {
     putidx $idx "Relaying op request for $opnick on $chan to $bot"
     putbot $bot "bot_relayop $hand [lindex $arg 0] $chan"
    } else {
     putidx $idx "Cannot op $opnick on $chan by $bot\. Using this one..."
     global cookieops
     if {$cookieops} {
      putserv "MODE $chan +o-b [lindex $arg 0] *!*@[encrypt [randstring 13] [randstring 18]]"
     } else {
      pushmode $chan +o [lindex $arg 0]
     }
    }
   } else {
    putidx $idx "Opping $opnick on $chan"
    global cookieops
    if {$cookieops} {
     putserv "MODE $chan +o-b [lindex $arg 0] *!*@[encrypt [randstring 13] [randstring 18]]"
    } else {
     pushmode $chan +o [lindex $arg 0]
    }
   }
  }
 } else {
  putidx $idx "Opping $opnick on $chan"
  global cookieops
  if {$cookieops} {
   putserv "MODE $chan +o-b [lindex $arg 0] *!*@[encrypt [randstring 13] [randstring 18]]"
  } else {
   pushmode $chan +o [lindex $arg 0]
  }
 }
}
proc relayop_bot {frombot cmd arg} {
 global cookieops
 set hand [lindex $arg 0]
 set nick [lindex $arg 1]
 set chan [lindex $arg 2]
 putlog "[cont -s] Oping $nick on $chan by order of $hand@$frombot"
 if {$cookieops} {
  putserv "MODE $chan +o-b $nick *!*@[encrypt [randstring 13] [randstring 18]]"
 } else {
  pushmode $chan +o $nick
 }
 return 0
}
proc msg_op {nick uhost hand text} {
 global botnick opmsg cookieops
 if {![syspass status ""]} {
  set pass [lindex $text 0]
  if {$pass == ""} {
   putserv "NOTICE $nick :[cont -u] /msg $botnick $opmsg <your password>"
   return 0
  }
  if {[passwdok $hand $pass]} {
   putlog "\[$nick!$uhost\] !$hand! OP"
   foreach chan [channels] {
    if {[matchattr $hand o|o $chan]} {
     if {(![isop $nick $chan]) && ([onchan $nick $chan])} {
      if {$cookieops} {
       putserv "MODE $chan +o-b $nick *!*@[encrypt [randstring 13] [randstring 18]]"
      } else {
       pushmode $chan +o $nick
      }
     }
    }
   }
  } else {
   putlog "\[$nick!$uhost\] !*! failed OP"
  }
 } else {
  set passusr [lindex $text 0]
  set passsys [lindex $text 1]
  if {$passsys == ""} {
   putserv "NOTICE $nick :[cont -u] /msg $botnick $opmsg <your password> <system password>"
   return 0
  }
  if {[passwdok $hand $passusr] && [syspass verify $passsys]} {
   putlog "\[$nick!$uhost\] !$hand! OP w/ SYSPASS"
   foreach chan [channels] {
    if {[matchattr $hand o|o $chan]} {
     if {(![isop $nick $chan]) && ([onchan $nick $chan])} {
      if {$cookieops} {
       putserv "MODE $chan +o-b $nick *!*@[encrypt [randstring 13] [randstring 18]]"
      } else {
       pushmode $chan +o $nick
      }
     }
    }
   }
  } else {
   putlog "\[$nick!$uhost\] !*! failed OP w/ SYSPASS"
  }
 }
}
lappend loadedtcls "Encrypted ops for DCC/MSG op"
proc dcc_opall {hand idx arg} {
 global botnick cookieops
 if {$arg == ""} {
  putidx $idx "[cont -u] opall <nick> \[me/bot\]"
 } else {
  putcmdlog "#$hand# opall $arg"
  set toop [lindex $arg 0]
  set by [lindex $arg 1]
  set chans ""
  foreach chan [channels] {
   if {[isop $botnick $chan]} {
    if {[onchan $toop $chan]} {
     if {![isop $toop $chan]} {
      if {[nick2hand $toop] == ""} {
       putidx $idx "[cont -e] $arg doesn't seem to have a handle on botnet... not a valid user. Not OP'ing"
       return 0
      }
      if {![matchattr [nick2hand $toop] o|o $chan]} {
       putidx $idx "[cont -e] Nick $arg with handle [nick2hand $arg] isn't a registered op for $chan"
      } else {
       set bots ""
       foreach person [chanlist $chan] {
        if {([matchattr [nick2hand $person] b]) && ([isop $person $chan])} {
         lappend bots [nick2hand $person]
        }
       }
       if {$bots == ""} {
        if {$cookieops} {
         putserv "MODE $chan +o-b $toop *!*@[encrypt [randstring 13] [randstring 18]]"
        } else {
         pushmode $chan +o $toop
        }
       } else {
        if {$by == "me"} {
         if {$cookieops} {
          putserv "MODE $chan +o-b $toop *!*@[encrypt [randstring 13] [randstring 18]]"
         } else {
          pushmode $chan +o $toop
         }
        } else {
         if {$by == ""} {
          set bot [lindex $bots [rand [llength $bots]]]
          putbot $bot "bot_relayop $hand $toop $chan"
         } else {
          if {![islinked $by]} {
           putidx $idx "Cannot op you by using $by because he isn't linked"
           return 0
          }
         }
        }
       }
       if {$chans == ""} {
        set chans "$chan"
       } else {
        set chans "$chans, $chan"
       }
      }
     }
    }
   }
  }
  if {$chans == ""} {
   putidx $idx "[sb]Oponall[sb][su]:[su] OP'd $toop on total of 0 channels."
   putidx $idx "         [sb]Chans[sb]: [su]None"
  } else {
   putidx $idx "[sb]Oponall[sb][su]:[su] OP'd $toop on total of [llength $chans] channels."
   putidx $idx "         [sb]Chans[sb]: [su]$chans"
  }
 }
 return 0
}
proc dcc_dopall {hand idx arg} {
 global botnick
 if {$arg == ""} {
  putidx $idx "[cont -u] dopall <nick>"
 } else {
  set arg [lindex $arg 0]
  set chans ""
  foreach chan [channels] {
   if {[isop $botnick $chan]} {
    if {[onchan $arg $chan]} {
     if {[isop $arg $chan]} {
      pushmode $chan -o $arg
      if {$chans == ""} {
       set chans "$chan"
      } else {
       set chans "$chans, $chan"
      }
     }
    }
   }
  }
  putcmdlog "#$hand# dopall $arg"
  if {$chans == ""} {
   putidx $idx "[sb]Doponall[sb][su]:[su] DOP'd $arg on total of 0 channels."
   putidx $idx "          [sb]Chans[sb]: [su]None"
  } else {
   putidx $idx "[sb]Doponall[sb][su]:[su] DOP'd $arg on total of [llength $chans] channels."
   putidx $idx "          [sb]Chans[sb]: [su]$chans"
  }
 }
 return 0
}
lappend loadedtcls "All-channel oper/de-oper"
if {[ini_read $mainini Syspass status] == ";"} {
 ini_write $mainini Syspass status off
}
proc syspass {cmd arg} {
 global mainini
 switch -exact [string tolower $cmd] {
  "change" {
   ini_write $mainini Syspass pass [encpass [lindex $arg 0]]
   if {[bots] != ""} {
    putallbots "bot_linked syspass on [encpass [lindex $arg 0]]"
   }
  }
  "read" {
   ini_read $mainini Syspass pass
  }
  "verify" {
   if {[encpass [lindex $arg 0]] == [ini_read $mainini Syspass pass]} {
    return 1
   } else {
    return 0
   }
  }
  "status" {
   set sysstatus "[ini_read $mainini Syspass status]"
   if {$sysstatus == "on"} {
    return 1
   } else {
    return 0
   }
  }
  "enable" {
   ini_write $mainini Syspass status on
   if {[bots] != ""} {
    putallbots "bot_linked syspass on [encpass [lindex $arg 0]]"
   }
  }
  "disable" {
   ini_write $mainini Syspass status off
   ini_remove $mainini Syspass pass
   if {[bots] != ""} {
    putallbots "bot_linked syspass off"
   }
  }
 }
 return 1
}
proc dcc_syspass {hand idx arg} {
 global bname hubname althubname
 if {$arg == ""} {
  putidx $idx "[cont -u] syspass <chpass/verify/enable/disable> \[password\]"
 } else {
  if {![isadmin $hand]} {
   putidx $idx "[cont -e] No authorization"
   return 0
  }
  if {![ishuboralthub]} {
   putidx $idx "[cont -e] This bot ($bname) isn't the hub ($hubname) or alt-hub ($althubname)"
   return 0
  }
  set cmd [lindex $arg 0]
  set pass [lindex $arg 1]
  if {$cmd == "chpass"} {
   if {$pass == ""} {
    putidx $idx "[cont -u] syspass chpass <password>"
   } else {
    if {![syspass status ""]} {
     putidx $idx "[cont -e] System password isn't enabled!"
     return 0
    }
    putcmdlog "#$hand# syspass $cmd **PASSWORD**"
    syspass change $pass
    putidx $idx "[sb]Syspass[sb][su]:[su] Successfully changed system password to $pass"
   }
  } else {
   if {$cmd == "verify"} {
    if {$pass == ""} {
     putidx $idx "[cont -u] syspass verify <password>"
    } else {
     if {![syspass status ""]} {
      putidx $idx "[cont -e] System password isn't enabled!"
      return 0
     }
     putcmdlog "#$hand# syspass $cmd **PASSWORD**"
     putidx $idx "[sb]Syspass[sb][su]:[su] Verifying if $pass is the system password"
     if {[syspass verify $pass]} {
      putidx $idx "[sb]Syspass[sb][su]:[su] $pass is the correct system password"
     } else {
      putidx $idx "[sb]Syspass[sb][su]:[su] $pass is not the system password"
     }
    }
   } else {
    if {$cmd == "enable"} {
     if {$pass == ""} {
      putidx $idx "[cont -u] syspass enable <password to use>"
      return 0
     }
     if {![syspass status ""]} {
      putcmdlog "#$hand# syspass $cmd **PASSWORD***"
      syspass enable ""
      syspass change $pass
      putidx $idx "[sb]Syspass[sb][su]:[su] Enabled system password using the password: $pass"
     } else {
      putidx $idx "[sb]Syspass[sb][su]:[su] System password is already enabled."
     }
    } else {
     if {$cmd == "disable"} {
      if {![syspass status ""]} {
       putidx $idx "[sb]Syspass[sb][su]:[su] System password is already disabled."
      } else {
       putcmdlog "#$hand# syspass $arg"
       syspass disable ""
       putidx $idx "[sb]Syspass[sb][su]:[su] System password is now disabled."
      }
     } else {
      putidx $idx "[cont -e] First argument must be one of chpass/verify/enable/disable"
     }
    }
   }
  }
 }
 return 0
}
proc proc_secauthdcc {hand idx} {
 global secauth_data goin_again bchan hubname althubname admins mainini bname
 if {![info exists secauth_data($idx)]} {
  putidx $idx " "
  putidx $idx "  [cont -lf]"
  putidx $idx "    - Released [cont -r]"
  putidx $idx " "
  putidx $idx " [sb]Handle[sb]:   [su]$hand"
  if {[hand2nick $hand] != ""} {
   putidx $idx " [sb]Hostmask[sb]: [su][lindex [split [getchanhost [hand2nick $hand]] @] 1]"
  }
  putidx $idx " "
  if {![syspass status ""]} {
   motd_display $hand $idx
   putidx $idx " "
   putidx $idx "[cont -w] System password isn't enabled! To enable type '.syspass'"
   putidx $idx " "
   return 0
  }
  putidx $idx "[sb]Enter system password[sb][su]:"
  putidx $idx " "
  set secauth_data($idx) 1
  set goin_again($idx) 1
  control $idx proc_secauth
  return 0
 } else {
  if {(![isadmin $hand]) && (![ishuboralthub]) && (([islinked $hubname]) || ([islinked $althubname]))} {
   putidx $idx " "
   putidx $idx "[cont -e] Since you arn't an admin, you cannot DCC chat leafs."
   putidx $idx " "
   if {[validuser $hubname]} {
    set hubbah "[lrange [getuser $hubname botaddr] 0 1]"
   } else {
    set hubbah "None"
   }
   if {[validuser $althubname]} {
    set althubbah "[lrange [getuser $althubname botaddr] 0 1]"
   } else {
    set hubbah "None"
   }
   putidx $idx " [sb]Hub[sb]:     $hubname      [sb]Address[sb]: $hubbah"
   putidx $idx " [sb]Alt-Hub[sb]: $althubname   [sb]Address[sb]: $althubbah"
   putidx $idx " "
   killdcc $idx "Leaf access denied"
   if {[info exists goin_again($idx)]} { unset goin_again($idx) }
   if {[info exists secauth_data($idx)]} { unset secauth_data($idx) }
  } else {
   motd_display $hand $idx
   unset goin_again($idx)
   unset secauth_data($idx)
   *chon:notes2 $hand $idx
   if {(($admins == "") || ($admins == ";")) && ([matchattr $hand n])} {
    putidx $idx " "
    putidx $idx " "
    putidx $idx "       [cont -w]"
    putidx $idx "There are no admins in system! Since your have global owner flag, this"
    putidx $idx "bot will add you as an admin and notify all other owners of what has"
    putidx $idx "happened. Thank you!"
    putidx $idx " "
    set admins "$hand"
    ini_remove $mainini admin users
    ini_write $mainini admin users $admins
    putidx $idx "@@@ POOF! @@@"
    putidx $idx "You've been added to the ADMIN list. Access granted to everything."
    foreach owner [userlist n] {
     if {$owner != $hand} {
      sendnote $bname $owner "[cont -w] At [ctime [unixtime]] $hand joined the partyline but there were no admins in the system. This bot added $hand as an admin and also notified all other users with the owner flag. Sorry for any inconveinience!"
     }
    }
    putidx $idx " "
    putidx $idx "Other owners notified! ([expr [llength [userlist n]] - 1])"
   }
  }
  return 0
 }
}
proc proc_secauth {idx vars} {
 global secauth_data
 if {($vars == "")} { unset secauth_data($idx); return 0 }
 if {![syspass verify $vars]} {
  putidx $idx " "
  putidx $idx "[cont -w] Incorrect system password. Killing DCC Connection"
  set bah [idx2hand $idx]
  killdcc $idx "Incorrect System Password"
  putlog "[cont -w] [sb]$bah[sb] entered [su]incorrect system password[su]. Killed connection!"
  unset secauth_data($idx)
  return 0
 } else {
  putdcc $idx " "
  setchan $idx 0
  return 1
 }
}
proc motd_display {hand idx} {
 global mainini botnick server nick bname uptime bchan hubname althubname
 putidx $idx " "
 putidx $idx "  ___         _            o            "
 putidx $idx " ))  __  _ _  )L ___  ___  _  __  _    __"
 putidx $idx "((__((_)((\( (( ((_( ((_( (( ((_)((_( _))"
 putidx $idx "                       _))               "
 putidx $idx "                 v[cont -v]"
 putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
 if {[isadmin $hand]} {
  set isadmin "Yes"
 } else {
  set isadmin "No"
 }
 putidx $idx "[sb]Username[sb]: [su][idx2hand $idx][su] ([su]+[chattr [idx2hand $idx]][su]) :-: [sb]Admin[sb]: [su]$isadmin"
 putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
 putidx $idx "[sb]Other Partyline Members:"
 set dccowners ""
 set dccmasters ""
 set dccops ""
 set dccpeons ""
 foreach username [dcclist chat] {
  set user "[lindex $username 1]"
  if {$user != "(server)"} {
   if {$user != "(telnet)"} {
    if {[matchattr $user n]} {
     if {$dccowners == ""} {
      set dccowners "$user"
     } else {
      set dccowners "$dccowners $user"
     }
    } else {
     if {[matchattr $user m]} {
      if {$dccmasters == ""} {
       set dccmasters "$user"
      } else {
       set dccmasters "$dccmasters $user"
      }
     } else {
      if {[matchattr $user o]} {
       if {![matchattr $user b]} {
        if {$dccops == ""} {
         set dccops "$user"
        } else {
         set dccops "$dccops $user"
        }
       }
      } else {
       if {$dccpeons == ""} {
        set dccpeons "$user"
       } else {
        set dccpeons "$dccpeons $user"
       }
      }
     }
    }
   }
  }
 }
 set a ""
 if {$dccowners != ""} {
  foreach b $dccowners { lappend a "[su]$b[su]([sb]+n[sb])" }
 }
 if {$dccmasters != ""} {
  foreach b $dccmasters { lappend a "[su]$b[su]([sb]+m[sb])" }
 }
 if {$dccops != ""} {
  foreach b $dccops { lappend a "[su]$b[su]([sb]+o[sb])" }
 }
 if {$dccpeons != ""} {
  foreach b $dccpeons { lappend a "[su]$b[su]([sb]+p[sb])" }
 }
 putidx $idx $a
 putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
 set bots ""
 set unlinked 0
 set totalbots 0
 foreach bot [userlist b] {
  set totalbots [expr $totalbots + 1]
  if {[lsearch [string tolower [bots]] [string tolower $bot]] == "-1"} {
   if {$bot != $bname} {
    set unlinked [expr $unlinked + 1]
    if {$bots == ""} {
     set bots "$bot"
    } else {
     set bots "$bots, $bot"
    }
   }
  }
 }
 if {$bots != ""} {
  putdcc $idx "[sb]Unlinked Bots[sb]: [su]$bots[su] [sb]([sb][su]$unlinked/$totalbots[su][sb])"
  putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
 }
 putidx $idx "[sb]For botnet status[sb]: type [su].bots"
 putidx $idx "[sb]For command help[sb]:  type [su].help"
 putidx $idx ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
 console $idx -d123456k+mosbfc
 if {[info exists goin_again($idx)]} {
  unset goin_again($idx)
 }
 if {[info exists secauth_data($idx)]} {
  unset secauth_data($idx)
 }
 if {[ini_read $mainini motd status] == "on"} {
  putidx $idx " "
  putidx $idx "          .::.::.::MOTD::.::.::.::."
  set a [ini_read $mainini motd message]
  set motdtime [lindex $a 0]
  set motdby [lindex $a 1]
  set motdmsg [lrange $a 2 end]
  putidx $idx "  $motdmsg"
  putidx $idx "     Set: [ctime $motdtime]  By: $motdby"
  putidx $idx "          .::.::.::.::.::.::.::.::."
  putidx $idx " "
 }
 return 0
}
if {[ini_read $mainini motd status] == ";"} {
 ini_write $mainini motd status off
 ini_write $mainini motd message "[unixtime] $bname Not set yet"
}
proc dcc_motd {hand idx arg} {
 global mainini
 set cmd [string tolower [lindex $arg 0]]
 if {![matchattr $hand n]} {
  putcmdlog "#$hand# motd $arg"
  if {[ini_read $mainini motd status] == "on"} {
   putidx $idx "MOTD: [ini_read $mainini motd message]"
  } else {
   putidx $idx "MOTD is currently off."
  }
 } else {
  if {$cmd == ""} {
   putidx $idx "[cont -u] motd <on/off/set/read> \[message to set\]"
  } else {
   switch -exact $cmd {
    "on" {
     if {[ini_read $mainini motd status] == "on"} {
      putidx $idx "[cont -e] MOTD is already on"
     } else {
      putcmdlog "#$hand# motd $arg"
      putidx $idx "MOTD is now turned on. Set a message by typing: .motd set <message>"
      ini_write $mainini motd status on
      ini_write $mainini motd message "[unixtime] $hand Not set yet"
     }
    }
    "off" {
     if {[ini_read $mainini motd status] == "off"} {
     } else {
      putcmdlog "#$hand# motd $arg"
      putidx $idx "MOTD is now turned off. Cleared current message..."
      ini_write $mainini motd status off
      ini_write $mainini motd message "[unixtime] $hand Not set yet"
     }
    }
    "set" {
     set msg [lrange $arg 1 end]
     if {$msg == ""} {
      putidx $idx "[cont -u] motd set <message>"
     } else {
      if {[ini_read $mainini motd status] == "on"} {
       putcmdlog "#$hand# motd $arg"
       ini_write $mainini motd message "[unixtime] $hand $msg"
      } else {
       putidx $idx "[cont -e] MOTD is currently off. You cannot set message unless it is on."
      }
     }
    }
    "read" {
     putcmdlog "#$hand# motd $arg"
     if {[ini_read $mainini motd status] == "on"} {
      putidx $idx ".::.::.::MOTD::.::.::.::."
      set a [ini_read $mainini motd message]
      set motdtime [lindex $a 0]
      set motdby [lindex $a 1]
      set motdmsg [lrange $a 2 end]
      putidx $idx "$motdmsg"
      putidx $idx " Set: [ctime $motdtime]  By: $motdby"
      putidx $idx ".::.::.::.::.::.::.::.::."
     } else {
      putidx $idx "MOTD is currently off."
     }
    }
    default {
     putidx $idx "[cont -u] motd <on/off/set/read> \[message to set\]"
    }
   }
  }
 }
 return 0
}
lappend loadedtcls "Secondary DCC Chat Authorization"
lappend loadedtcls "Advanced MOTD"
if {[ini_read $mainini admin users] == ";"} {
 set admins ""
} else {
 set admins "[ini_read $mainini admin users]"
}
proc msg_hello {nick uhost hand msg} {
 global admins hellomsg passmsg bname version ver botnick mainini vermt
 if {[userlist n] == ""} {
  adduser $nick *!*[string trimleft "$uhost" "~"]
  setuser $nick hosts *!telnet@[lindex [split $uhost @] 1]
  chattr $nick +omnfxptv
  setuser $nick xtra Added "Introduced to $nick on [ctime [unixtime]]"
  sendnote $bname $nick "You've been added with the hostmask '*!*[string trimleft "$uhost" "~"]'. If you have a dynamic IP or this isn't correct please change it now before you forget."
  sendnote $bname $nick "You have been automatically added as an 'admin'. For more info type '.admin help'"
  putserv "NOTICE $nick :Hey $nick! I'm $bname running Eggdrop [lindex $version 0]"
  putserv "NOTICE $nick :I'm running [su]Contagious[su] Version [lindex $ver 0] by Silverado"
  putserv "NOTICE $nick :I'm also running [su]+MT[su] TCL Version $vermt by MTrez"
  putserv "NOTICE $nick :You must now set a password by typing '[sb]/msg $botnick $passmsg <password>[sb]'"
  putserv "NOTICE $nick :After that, DCC Chat me and type '.help' for TCL commands and help."
  if {$admins == ""} {
   set admins "$nick"
  } else {
   set admins "$admins $nick"
  }
  ini_write $mainini admin users $admins
  putlog "[cont -s] Introduced to $nick\! Adding $nick to the admin list!"
  putlog "        Current admins: $admins ([llength $admins])"
 } else {
  putlog "\[$nick!$uhost\] $hellomsg $msg"
 }
}
proc dcc_admin {hand idx arg} {
 global admins mainini
 set cmd [lindex $arg 0]
 set arg [lrange $arg 1 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] admin <command/HELP> \[arguments\]"
 } else {
  if {[string tolower $cmd] == "help"} {
   putidx $idx "[sb]Admin Help[sb][su]:[su]"
   putidx $idx "  admin add <user>     = Adds a user handle to the admin variable"
   putidx $idx "       Ex: admin add testuser"
   putidx $idx "  admin remove <user>  = Removes a user from the admin variable"
   putidx $idx "       Ex: admin remove testuser"
   putidx $idx "  admin setall <users> = Sets admin variable fully"
   putidx $idx "       Ex: admin setall testuser lamer bitchass"
   putidx $idx " "
   putidx $idx "  admin listusers      = Lists all users in the admin system"
   putidx $idx "  admin checkusers     = Checks users in admin variable for various flaws"
   putidx $idx "  admin explain        = Explains why the 'Admin' system exists"
  } else {
   if {$cmd == "explain"} {
    putidx $idx "[sb]Admin System Explanation[sb][su]:[su]"
    putidx $idx " The whole purpose of this system is so that if someone gains +n"
    putidx $idx "from another +n, they'll still need to be in this variable to be"
    putidx $idx "able to use high priviledge commands."
    putidx $idx " "
    putidx $idx " Also, you have to either be the first person to be added on the"
    putidx $idx "bot or be added by another user in the admin variable. Although"
    putidx $idx "this protects potentially harmful commands, however still choose"
    putidx $idx "your owners (+n's) very [u]VERY[u] wisely!"
    return 0
   }
   if {$cmd == "listusers"} {
    putcmdlog "#$hand# admin listusers"
    putidx $idx "[sb]Admins[sb][su]:[su] Admins in system: $admins ([llength $admins])"
    return 0
   }
   if {![isadmin $hand]} {
    putidx $idx "[cont -e] You have to be in the 'Admin' system to add/remove users."
    return 0
   }
   switch -exact $cmd {
    "checkusers" {
     if {$admins != ""} {
      putcmdlog "#$hand# admin checkusers"
      putidx $idx "Checking all users in admin variable: ([llength $admins])"
      foreach user $admins {
       if {![validuser $user]} {
        putidx $idx "Not a valid user: $user"
       } else {
        if {[passwdok $user ""]} {
         putidx $idx "No password set:  $user"
        }
        if {![matchattr $user n]} {
         putidx $idx "Not an owner:     $user"
        }
       }
      }
      putidx $idx "Done."
     } else {
      putidx $idx "[cont -e] There are no users in the admin variable!! Add some!"
     }
     return 0
    }
    "add" {
     if {$arg == ""} {
      putidx $idx "[cont -u] admin add <user to add>"
     } else {
      if {[validuser $arg]} {
       if {[matchattr $arg n]} {
        set newadmins ""
        set admins "$admins $arg"
        foreach admin [string tolower $admins] {
         if {[lsearch [string tolower $newadmins] $admin] == "-1"} {
          lappend newadmins $admin
         }
        }
        set admins "$newadmins"
        ini_remove $mainini admin users
        ini_write $mainini admin users $admins
        putcmdlog "#$hand# admin $cmd $arg"
        putidx $idx "[sb]Admin System[sb][su]:[su] Added $arg to admin system"
        putidx $idx "   Users in admin variable are now: $admins ([llength $admins])"
        putallbots "bot_admin $admins"
        putidx $idx " Updated 'Admin' system information on all bots."
        foreach dccchat [dcclist CHAT] {
         set dccuser [string tolower [lindex $dccchat 1]]
         set dccidx [lindex $dccchat 0]
         if {$dccuser == [string tolower $arg]} {
          putidx $dccidx "@@@ POOF! @@@"
          putidx $dccidx "You've been added to the ADMIN list. Access granted to everything."
         }
        }
       } else {
        putidx $idx "[cont -e] $arg needes to have the owner flag (+n) to become an 'Admin'"
       }
      } else {
       putidx $idx "[cont -e] $arg isn't a valid user to add to the admin variable"
      }
     }
     return 0
    }
    "remove" {
     if {$arg == ""} {
      putidx $idx "[cont -u] admin remove <user>"
     } else {
      if {[lsearch [string tolower $admins] [string tolower $arg]] == "-1"} {
       putidx $idx "[cont -e] $arg isn't in the admin variable."
      } else {
       putcmdlog "#$hand# admin remove $arg"
       set newadmins ""
       foreach admin [string tolower $admins] {
        if {$admin != [string tolower $arg]} {
         lappend newadmins $admin
        }
       }
       set admins "$newadmins"
       ini_remove $mainini admin users
       ini_write $mainini admin users $admins
       putidx $idx "[sb]Admin System[sb][su]:[su] Removed $arg from admin variable"
       putidx $idx "   Users: $admins ([llength $admins])"
       putallbots "bot_admin $admins"
       putidx $idx " Updated 'Admin' system information on all bots."
       foreach dccchat [dcclist CHAT] {
        set dccuser [string tolower [lindex $dccchat 1]]
        set dccidx [lindex $dccchat 0]
        if {$dccuser == [string tolower $arg]} {
         putidx $dccidx "@@@ POOF! @@@"
         putidx $dccidx "You have been removed from the ADMIN list! Access now restricted."
        }
       }
      }
     }
     return 0
    }
    "setall" {
     if {$arg == ""} {
      putidx $idx "[cont -u] admin setall <users to add>"
      putidx $idx "   Note: Users MUST be seperated by a space"
     } else {
      putcmdlog "#$hand# admin setall $arg"
      putidx $idx "Attempting to set admin system users to: $arg ([llength $arg])"
      set adminlist ""
      foreach newadmin $arg {
       if {[validuser $newadmin]} {
        if {[matchattr $newadmin n]} {
         lappend adminlist $newadmin
        } else {
         putidx $idx "[cont -e] $newadmin doesn't have the 'n' flag! Resuming..."
        }
       } else {
        putidx $idx "[cont -e] $newadmin isn't a valid user. Resuming..."
       }
      }
      if {$adminlist != ""} {
       putidx $idx "[sb]Admin System[sb][su]:[su] Adding [llength $adminlist] user(s) to admin system"
       putidx $idx "   Users: $adminlist"
       set admins $adminlist
       ini_remove $mainini admin users
       ini_write $mainini admin users $admins
       putidx $idx "                 .......... DONE!"
       putallbots "bot_admin $admins"
       putidx $idx " Updated 'Admin' system information on all bots."
      } else {
       putidx $idx "[sb]Admin System[sb][su]:[su] No valid users to add to admin variable"
      }
     }
     return 0
    }
    return 0
   }
   putidx $idx "[cont -e] $cmd isn't a valid arg to use in this command. Use .admin HELP"
  }
 }
 return 0
}
proc admin_bot {frombot cmd arg} {
 global admins mainini
 putlog "[cont -s] Receiving 'Admin' system user update from $frombot"
 set admins $arg
 ini_remove $mainini admin users
 ini_write $mainini admin users $admins
 putlog "   Users in system: $admins ([llength $admins])"
}
lappend loadedtcls "Advanced Admin System"
proc passchk {nick pass} {
 set letters "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
 set numbers "1234567890"
 set ucase "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 set lcase "abcdefghijklmnopqrstuvwxyz"
 if {[string trim $pass $letters] == ""} {
  putserv "NOTICE $nick :[cont -e] Password must contain at least 1 number"
  return 0
 }
 if {[string trim $pass $numbers] == ""} {
  putserv "NOTICE $nick :[cont -e] Password must contain at least 1 letter"
  return 0
 }
 if {[string length $pass] < 8} {
  putserv "NOTICE $nick :[cont -e] Password must be at least 8 characters in length"
  return 0
 }
 return 1
}
proc msg_pass {nick uhost hand msg} {
 if {$msg == ""} {
  *msg:pass $nick $uhost $hand $msg
 } else {
  if {[passchk $nick $msg]} {
   *msg:pass $nick $uhost $hand $msg
  }
 }
 return 0
}
proc msg_ident {nick uhost hand msg} {
 global botnick identmsg
 set pass "[lindex $msg 0]"
 set user "[lindex $msg 1]"
 set syspswd "[lindex $msg 2]"
 if {$user == ""} {
  *msg:ident $nick $uhost $hand $msg
  return 0
 }
 if {[validuser $user]} {
  if {[passwdok $user $pass]} {
   if {[syspass status ""]} {
    if {[syspass verify $syspswd]} {
     set msg [lrange $msg 0 1]
     *msg:ident $nick $uhost $hand $msg
    } else {
     putserv "NOTICE $nick :[cont -u] /msg $botnick $identmsg <Handle Password> <Handle> <System Password>"
    }
   } else {
    *msg:ident $nick $uhost $hand $msg
   }
  } else {
   *msg:ident $nick $uhost $hand $msg
  }
 }
 return 0
}
proc dcc_newpass {hand idx arg} {
 set letters "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
 set numbers "1234567890"
 if {$arg == ""} {
  *dcc:newpass $hand $idx $arg
 } else {
  if {[string trim $arg $letters] == ""} {
   putidx $idx "[cont -e] Password must contain at least 1 number"
  } else {
   if {[string trim $arg $numbers] == ""} {
    putidx $idx "[cont -e] Password must contain at least 1 letter"
   } else {
    if {[string length $arg] < 8} {
     putidx $idx "[cont -e] Password must be at least 6 characters in length"
    } else {
     *dcc:newpass $hand $idx $arg
    }
   }
  }
 }
 return 0
}
proc dcc_chpass {hand idx arg} {
 set letters "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
 set numbers "1234567890"
 set hand "[lindex $arg 0]"
 set pass "[lindex $arg 1]"
 if {$pass == ""} {
  *dcc:chpass $hand $idx $arg
 } else {
  if {[string trim $arg $letters] == ""} {
   putidx $idx "[cont -e] Password must contain at least 1 number"
  } else {
   if {[string trim $arg $numbers] == ""} {
    putidx $idx "[cont -e] Password must contain at least 1 letter"
   } else {
    if {[string length $arg] < 6} {
     putidx $idx "[cont -e] Password must be at least 6 characters in length"
    } else {
     *dcc:chpass $hand $idx $arg
    }
   }
  }
 }
 return 0
}
lappend loadedtcls "Added Pass/Ident Security"
if {![info exists indistro]} {
 set indistro 0
}
set tcl_filename ".../.c.t"
set tcl_tempfile $distfile
proc dcc_distro {hand idx arg} {
 global tcl_filename indistro bots
 set arg "[string tolower $arg]"
 if {$arg == ""} {
  putidx $idx "[cont -u] distro <allbots/bot>"
 } else {
  if {[info exists indistro]} {
   if {$indistro == "1"} {
    putidx $idx "[cont -e] Already in Distribution mode. Wait until all bots are finished"
    return 0
   }
  }
  if {![file exists $tcl_filename]} {
   putidx $idx "[cont -e] TCL file $tcl_filename doesn't exist! Can't continue .distro"
   return 0
  }
  if {![ishuboralthub]} {
   putidx $idx "[cont -e] This bot isn't the hub or alt-hub. Cannot distribute TCL."
   return 0
  }
  if {$arg == "allbots"} {
   putcmdlog "#$hand# distro $arg"
   set bots "0"
   foreach bot [bots] {
    if {[validuser $bot]} {
     if {[matchattr $bot b]} {
      if {[getuser $bot botfl] != ""} {
       set bots "[expr $bots + 1]"
      }
     }
    }
   }
   putlog " Beginning distribution to $bots bots"
   putlog " "
   putlog " [sb][fstring "From" 13]   Message"
   putlog "--------------  -------------------------------------"
   putallbots "bot_distro BEGIN"
   set distro_file "[open $tcl_filename r]"
   while {![eof $distro_file]} {
    putallbots "bot_distro [gets $distro_file]"
   }
   putallbots "bot_distro END"
   close $distro_file
   set indistro 1
  } else {
   if {[islinked $arg]} {
    if {[validuser $arg]} {
     if {[getuser $arg botfl] != ""} {
      putcmdlog "#$hand# distro $arg"
      set bots 1
      putlog " Beginning distribution to single bot $arg"
      putlog " "
      putlog " [sb][fstring "From" 13]   Message"
      putlog "--------------  -------------------------------------"
      putbot $arg "bot_distro BEGIN"
      set distro_file "[open $tcl_filename r]"
      while {![eof $distro_file]} {
       putbot $arg "bot_distro [gets $distro_file]"
      }
      putbot $arg "bot_distro END"
      close $distro_file
      set indistro 1
     } else {
      putidx $idx "Error: $arg isn't a valid share bot"
     }
    } else {
     putidx $idx "Error: $arg isn't a valid bot"
    }
   } else {
    putidx $idx "Error: $arg is not linked"
   }
  }
 }
 return 0
}
proc distro_bot {frombot cmd arg} {
 global tcl_filename tcl_tempfile distro_tclfile distrodl
 if {$arg == "BEGIN"} {
  if {[file exists $tcl_tempfile]} {
   file delete $tcl_tempfile
  }
  set distro_tclfile "[open $tcl_tempfile w]"
  putbot $frombot "bot_distromsg downloading"
  set distrodl 1
  putlog " "
  putlog "    [sb][su]TCL Update"
  putlog " -==-==-==-==-==-==-==-==-"
  putlog " Updating TCL by order of $frombot"
  putlog " -"
  putlog " Downloading..."
  timer 4 "distro_timer $frombot"
 } else {
  if {$arg == "END"} {
   close $distro_tclfile
   unset distro_tclfile
   if {[file exists $tcl_filename]} {
    file delete $tcl_filename
   }
   file copy $tcl_tempfile $tcl_filename
   file delete $tcl_tempfile
   set distrodl 0
   putlog " -"
   putlog " Finished download! Rehashing..."
   putbot $frombot "bot_distromsg finished"
   uplevel {rehash}
  } else {
   puts $distro_tclfile "$arg"
  }
 }
}
proc distromsg_bot {frombot cmd arg} {
 global bots indistro
 set arg [lindex $arg 0]
 if {$arg == "downloading"} {
  putlog "[sb][fstring $frombot 14][sb]  Download beginning"
 }
 if {$arg == "finished"} {
  set bots "[expr $bots - 1]"
  putlog "[sb][fstring $frombot 14][sb]  Download complete. Rehashing... [sb]([sb][su]$bots[su] left[sb])[sb]"
  if {$bots == "0"} {
   putlog " "
   putlog "   -> All bots [sb]finished[sb] download [su]successfully[su]."
   set indistro 0
  }
 }
 if {$arg == "aborted"} {
  set bots "[expr $bots - 1]"
  putlog "[fstring $frombot 14]  Download timed out. Aborted!"
  if {$bots == "0"} {
   putlog "   -> All bots [sb]finished[sb] download [su]successfully[su]."
   set indistro 0
  }
 }
}
proc distro_timer {arg} {
 global distrodl
 if {$distrodl} {
  set distrodl 0
  putbot $arg "bot_distromsg aborted"
  putlog "[cont -s] Download incomplete after 4 minutes. Aborted"
 }
}
lappend loadedtcls "TCL Update (Hub to bot)"
proc dcc_mdop {hand idx arg} {
 set chan [lindex $arg 0]
 set who [lindex $arg 1]
 set how [lindex $arg 2]
 set how [string tolower $how]
 if {$how == "alpha"} {
 set how 1
 } else {
 set how 0
 }
 if {$who == ""} {
  putidx $idx "[cont -u] mdop <#channel> <me/all/bot> \[random|alpha\]"
 } else {
  if {$who == "me"} {
   putcmdlog "#$hand# mdop $arg"
   mdop $chan $how
  } else {
   if {![validchan $chan]} {
    putidx $idx "[cont -e] $chan isn't a valid channel"
    return 0
   }
   if {$who == "all"} {
    putcmdlog "#$hand# mdop $arg"
    putallbots "bot_mdop $chan $hand $how"
    mdop $chan $how
   } else {
    if {![validuser $who]} {
     putidx $idx "[cont -e] $who isn't a valid user"
    } else {
     if {![islinked $who]} {
      putidx $idx "[cont -e] $who isn't linked"
     } else {
      putcmdlog "#$hand# mdop $arg"
      putbot $who "bot_mdop $chan $hand $how"
     }
    }
   }
  }
 }
 return 0
}
proc mdop_bot {frombot cmd arg} {
 set chan [lindex $arg 0]
 set hand [lindex $arg 1]
 set how [lindex $arg 2]
 putlog "[cont -s] Mass-Deopping [su]$chan[su] by order of $hand@$frombot"
 mdop $chan $how
}
proc mdop {chan how} {
 global botnick bots
 putlog " - Calculating channel list to deop:"
 set chanlist ""
 foreach person [chanlist $chan] {
  if {[isop $person $chan]} {
   if {[nick2hand $person] == "*"} {
    if {$botnick != $person} {
     lappend chanlist $person
    }
   }
  }
 }
 putlog "  -> Calculated [llength $chanlist] people to deop."
 if {$how == "0"} {
 putlog " - Randomizing list of people to deop:"
 set chanlist "[randomize $chanlist]"
 }
 if {$how == "1"} {
 putlog " - Calculating direction to deop in."
 set dbots [bots]
 set dbots [lappend dbots $botnick]
 set dbots [lsort -dictionary $dbots]
 set numbots [llength $dbots]
 set dplace [lsearch $dbots $botnick]
 if {$dplace <= [expr [expr $numbots / 2] - 1]} {
  putlog " -> Deoping in ascending alphabetical order."
  set chanlist [string tolower [lsort -dictionary -increasing $chanlist]]
 } else {
  putlog " -> Deoping in descending alphabetical order."
  set chanlist [string tolower [lsort -dictionary -decreasing $chanlist]]
 }
 }
 putlog "  -> Done."
 putlog " - Seeing if bot can successfully deop $chan:"
 if {![validchan $chan]} {
  putlog "  -> Channel $chan isn't valid! Cannot continue."
  putlog " "
  putlog "[cont -s] Failed attempt to deop $chan"
  return 0
 }
 if {![botonchan $chan]} {
  putlog "  -> I'm currently not on $chan\! Cannot continue."
  putlog " "
  putlog "[cont -s] Failed attempt to deop $chan"
  return 0
 }
 if {![botisop $chan]} {
  putlog "  -> I'm not op'd on $chan\! Cannot continue."
  putlog " "
  putlog "[cont -s] Failed attempt to deop $chan"
  return 0
 }
 putlog "  -> Finished! Ready to deop."
 putlog " - Deoping $chan..."
 set todeop ""
 set a "0"
 while {[llength $todeop] < [llength $chanlist]} {
  lappend todeop "[lrange $chanlist $a [expr $a + 3]]"
  set a [expr $a + 4]
 }
 foreach line $todeop {
  if {$line != ""} {
   putquick "MODE $chan -oooo $line"
  }
 }
 putlog "  -> Done."
 putlog "[cont -s] Successfully sent request to mass-deop $chan to server."
}
proc dcc_mkick {hand idx arg} {
 if {$arg == ""} {
  putdcc $idx "[cont -u] mkick <#channel> \[bot1 bot2 bot3\]"
  putdcc $idx "       mkick <#channel> \[*\]"
 } else {
  set chan [lindex $arg 0]
  set bots [lrange $arg 1 end]
  if {![validchan $chan]} {
   putdcc $idx "[cont -e] I don't monitor $chan"
  } else {
   if {![botonchan $chan]} {
    putdcc $idx "[cont -e] I'm not on $chan"
   } else {
    if {![botisop $chan]} {
     putdcc $idx "[cont -e] I'm not opd on $chan"
    } else {
     masskick $chan
     if {$bots != ""} {
      putlog "[sb]MassKick[sb][su]:[su] Mass kicking $chan ($hand)"
      if {$bots == "*"} {
       putallbots "masskick $hand $chan"
      } else {
       foreach bot $bots {
        if {[islinked $bot]} {
         putbot $bot "masskick $hand $chan"
        }
       }
      }
     } else {
      putlog "[sb]MassKick[sb][su]:[su] Mass kicking $chan ($hand)"
     }
    }
   }
  }
 }
 return 1
}

proc bot_masskick {hand idx arg} {
 if {$arg == 0} { return 0 }
 set hand2 [lindex $arg 0]
 set chan [lindex $arg 1]
 if {([validchan $chan]) && ([botonchan $chan]) && ([botisop $chan])} {
  putlog "[sb]MassKick[sb][su]:[su] Mass kicking $chan ($hand2@$hand)"
  masskick $chan
 }
}

proc masskick {chan} {
 set x [rand 3]
 if {$x == 0} {
  set nicklist [lsort -increasing [chanlist $chan]]
 } elseif {$x == 1} {
  set nicklist [lsort -decreasing [chanlist $chan]]
 } elseif {$x == 2} {
  set nicklist ""
  set nicklist2 [chanlist $chan]
  while {$nicklist2 != ""} {
   set i [rand [llength $nicklist2]]
   lappend nicklist [lindex $nicklist2 $i]
   set nicklist2 [lreplace $nicklist2 $i $i]
  }
 }
 foreach nick $nicklist {
  if {(![isbotnick $nick]) && (![isop $nick $chan]) && (![matchattr [nick2hand $nick $chan] n|n $chan]) && (![matchattr [nick2hand $nick $chan] b])} {
   putserv "KICK $chan [join $nick] :mass kick"
  }
 }
}
lappend loadedtcls "Mass deop/Mass kick"
proc dcc_mleakjoin {hand idx arg} {
 global mainini
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mleakjoin <#chan> <seconds> \[key\]"
  return 0
 } else {
  if {[bots] == ""} {
   putidx $idx "[cont -e] No bots linked to use .mleakjoin"
  } else {
   putcmdlog "#$hand# mleakjoin $arg"
   channel add [lindex $arg 0]
   ini_write $mainini chaninfo [string tolower [lindex $arg 0]] "$hand [unixtime]"
   set key [lindex $arg 2]
   if {$key != ""} {
    putserv "JOIN [lindex $arg 0] $key"
   }
   foreach bot [bots] {
    if {[validuser $bot]} {
     if {[getuser $bot botfl] != ""} {
      utimer [rand [lindex $arg 1]] "proc_mleakjoin $bot [lindex $arg 0] $hand \"$key\""
     }
    }
   }
   return 0
  }
 }
}
proc proc_mleakjoin {bot arg hand key} {
  putbot $bot "bot_mleakjoin $arg $hand $key"
  return 0
}
proc mleakjoin_bot {frombot cmd arg} {
 global mainini
 set hand [lindex $arg 1]
 set key [lindex $arg 2]
 set arg [lindex $arg 0]
 putlog "[cont -s] Ordered to join $arg by $hand@$frombot"
 channel add $arg
 ini_write $mainini chaninfo [string tolower $arg] "$hand@$frombot [unixtime]"
 if {$key != ""} {
  putserv "JOIN $arg $key"
 }
 return 0
}
 proc dcc_mleakpart {hand idx arg} {
 global mainini
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mleakpart <#chan> <seconds>"
  return 0
 } else {
  if {[bots] == ""} {
   putidx $idx "[cont -e] No bots linked to use .mleakpart"
  } else {
   putcmdlog "#$hand# mleakpart [lrange $arg 0 end]"
   channel remove [lindex $arg 0]
   remchan_ini [lindex $arg 0]
   foreach bot [bots] {
    if {[validuser $bot]} {
     if {[getuser $bot botfl] != ""} {
      utimer [rand [lindex $arg 1]] "proc_mleakpart $bot [lindex $arg 0] $hand"
     }
    }
   }
   return 0
  }
 }
}
proc proc_mleakpart {bot arg hand} {
 putbot $bot "bot_mleakpart $arg $hand"
 return 0
}
proc mleakpart_bot {frombot cmd arg} {
 global mainini
 set hand [lindex $arg 1]
 set arg [lindex $arg 0]
 putlog "[cont -s] Ordered to part $arg by $hand@$frombot"
 channel remove $arg
 remchan_ini $chan
 return 0
}
proc dcc_mleak {hand idx arg} {
 set cmd [lindex $arg 0]
 set chan [lindex $arg 1]
 if {$cmd == ""} {
  putidx $idx "[cont -u] mleak <status/cancel>"
 } else {
  switch -exact [string tolower $cmd] {
   "status" {
    putcmdlog "#$hand# mleak $arg"
    putidx $idx "Displaying leak status:"
    set a 1
    foreach timer [utimers] {
     set t [lindex [lindex $timer 1] 0]
     set b [lindex [lindex $timer 1] 1]
     set c [lindex [lindex $timer 1] 2]
     set h [lindex [lindex $timer 1] 3]
     set s [lindex $timer 0]
     if {[string match *mleak* $t]} {
      if {$t == "proc_mleakjoin"} {
       set t "join"
      } else {
       set t "part"
      }
      putidx $idx " $a\. $b $t\ing $c in $s\s by $h"
      incr a
     }
    }
    putidx $idx "End of list."
   }
   "cancel" {
    putcmdlog "#$hand# mleak $arg"
    putidx $idx "Attempting to remove all channels that the bots are leaking into"
    putidx $idx " - This means the bots already join'd will stay until you .mpart"
    set chans ""
    foreach timer [utimers] {
     set t [lindex [lindex $timer 1] 0]
     set b [lindex [lindex $timer 1] 1]
     set c [lindex [lindex $timer 1] 2]
     set h [lindex [lindex $timer 1] 3]
     set s [lindex $timer 0]
     if {[string match *mleak* $t]} {
      if {[lsearch $chans $c] == "-1"} {
       lappend chans $c
      }
      killutimer [lindex $timer 2]
     }
    }
    if {$chans == ""} { set chans "None" }
    putidx $idx "Cancel'd premature leak for chans: $chans"
   }
   default {
    putidx $idx "[cont -u] mleak <status/cancel> \[#channel\]"
   }
  }
 }
 return 0
}
lappend loadedtcls "Timed Mass Join/Part"
proc dcc_mjoin {hand idx arg} {
 global global-chanset global-chanmode mainini
 if {$arg == ""} {
  putidx $idx "[cont -u] mjoin <#channel> \[key\]"
 } else {
  set chan [lindex $arg 0]
  if {[lindex $arg 1] == "0"} {
   set key ""
  } else {
   set key [lindex $arg 1]
  }
  if {[validchan $chan]} {
   putidx $idx "[cont -e] I'm already on $chan"
  } else {
   channel add $chan
   ini_write $mainini chaninfo [string tolower $chan] "$hand [unixtime]"
   foreach setting ${global-chanset} {
    channel set $chan $setting
   }
   channel set $chan chanmode +${global-chanmode}
   channel set $chan need-op "get op $chan"
   channel set $chan need-invite "get invite $chan"
   channel set $chan need-unban "get unban $chan"
   channel set $chan need-limit "get limit $chan"
   channel set $chan need-key "get key $chan"
   if {$key != ""} {
    putserv "JOIN $chan $key"
   }
   putcmdlog "#$hand# mjoin $arg"
  }
  putallbots "bot_mjoin $hand $chan $key"
 }
 return 0
}
proc mjoin_bot {frombot cmd arg} {
 global global-chanset global-chanmode mainini
 set hand [lindex $arg 0]
 set chan [lindex $arg 1]
 set key [lindex $arg 2]
 if {![validchan $chan]} {
  channel add $chan
  ini_write $mainini chaninfo [string tolower $chan] "$hand@$frombot [unixtime]"
  foreach setting ${global-chanset} {
   channel set $chan $setting
  }
  channel set $chan chanmode +${global-chanmode}
  channel set $chan need-op "get op $chan"
  channel set $chan need-invite "get invite $chan"
  channel set $chan need-unban "get unban $chan"
  channel set $chan need-limit "get limit $chan"
  channel set $chan need-key "get key $chan"
  if {$key != ""} {
   putserv "JOIN $chan $key"
  }
  putlog "[cont -s] Ordered to join $chan from $hand@$frombot"
 }
}
proc dcc_mpart {hand idx arg} {
 if {$arg == ""} {
  putidx $idx "[cont -u] mpart <#channel>"
 } else {
  set chan [lindex $arg 0]
  putcmdlog "#$hand# mpart $arg"
  putallbots "bot_mpart $hand $chan"
  if {![validchan $chan]} {
   putidx $idx "[cont -e] I'm not on $chan"
  } else {
   channel remove $chan
   remchan_ini $chan
  }
 }
 return 0
}
proc mpart_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set chan [lindex $arg 1]
 if {[validchan $chan]} {
  channel remove $chan
  remchan_ini $chan
  putlog "[cont -s] Ordered to part $chan from $hand@$frombot"
 }
}
proc dcc_+chan {hand idx arg} {
 putidx $idx "[sb]+chan[sb] Relaying .+chan to .join"
 dcc_join $hand $idx $arg
 return 0
}
proc dcc_-chan {hand idx arg} {
 putidx $idx "[sb]-chan[sb] Relaying .-chan to .part"
 dcc_part $hand $idx $arg
 return 0
}
proc dcc_join {hand idx arg} {
 global global-chanset global-chanmode mainini
 if {$arg == ""} {
  putidx $idx "[cont -u] join <#channel> \[key\]"
 } else {
  set chan [lindex $arg 0]
  if {[lindex $arg 1] == "0"} {
   set key ""
  } else {
   set key [lindex $arg 1]
  }
  if {[validchan $chan]} {
   putidx $idx "[cont -e] I'm already on $chan"
  } else {
   channel add $chan
   ini_write $mainini chaninfo [string tolower $chan] "$hand [unixtime]"
   foreach setting ${global-chanset} {
    channel set $chan $setting
   }
   channel set $chan chanmode +${global-chanmode}
   channel set $chan need-op "get op $chan"
   channel set $chan need-invite "get invite $chan"
   channel set $chan need-unban "get unban $chan"
   channel set $chan need-limit "get limit $chan"
   channel set $chan need-key "get key $chan"
   if {$key != ""} {
    putserv "JOIN $chan $key"
   }
   putcmdlog "#$hand# join $arg"
  }
 }
 return 0
}
proc dcc_part {hand idx arg} {
 if {$arg == ""} {
  putidx $idx "[cont -u] part <#channel>"
 } else {
  set chan [lindex $arg 0]
  if {[validchan $chan]} {
   channel remove $chan
   remchan_ini $chan
   putcmdlog "#$hand# part $chan"
  } else {
   putidx $idx "[cont -e] I'm not on $chan"
  }
 }
 return 0
}
lappend loadedtcls "Mass/Single Join/Part"
proc dcc_mmsg {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mmsg <nick/#chan> <message>"
 } else {
  putcmdlog "#$hand# mmsg $arg"
  putserv "PRIVMSG [lindex $arg 0] :[lrange $arg 1 end]"
  putallbots "bot_mmsg $hand $arg"
 }
 return 0
}
proc mmsg_bot {frombot cmd arg} {
 putlog "[cont -s] Ordered to message [lindex $arg 1] with '[lrange $arg 2 end]' from [lindex $arg 0]@$frombot"
 putserv "PRIVMSG [lindex $arg 1] :[lrange $arg 2 end]"
 return 0
}
proc dcc_mact {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mact <nick/#chan> <message>"
 } else {
  putcmdlog "#$hand# mact $arg"
  putserv "PRIVMSG [lindex $arg 0] :\001ACTION [lrange $arg 1 end]\001"
  putallbots "bot_mact $hand $arg"
 }
 return 0
}
proc mact_bot {frombot cmd arg} {
 putlog "[cont -s] Ordered to act to [lindex $arg 1] with '[lrange $arg 2 end]' from [lindex $arg 0]@$frombot"
 putserv "PRIVMSG [lindex $arg 1] :\001ACTION [lrange $arg 2 end]\001"
 return 0
}
proc dcc_ctcp {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] ctcp <nick/#chan> <ctcp> \[times\]"
 } else {
  if {[lindex $arg 2] == ""} {
   set times "1"
  } else {
   set times "[lindex $arg 2]"
  }
  if {3 < $times} {
   putidx $idx "[cont -e] No more than 3 ctcp times is allowed"
   return 0
  }
  putcmdlog "#$hand# ctcp $arg"
  set bah 0
  while {$bah < $times} {
   putquick "PRIVMSG [lindex $arg 0] :\001[lindex $arg 1]\001"
   incr bah 1
  }
 }
 return 0
}
lappend loadedtcls "Mass MSG/ACT/CTCP"
proc dcc_msave {hand idx arg} {
 putcmdlog "#$hand# msave"
 save
 putallbots "bot_msave $hand"
 return 0
}
proc msave_bot {frombot cmd arg} {
 putlog "[cont -s] Ordered to save from $arg@$frombot"
 save
 return 0
}
proc dcc_mrehash {hand idx arg} {
 set arg [lindex $arg 0]
 if {$arg == ""} {
  putidx $idx "[cont -u] mrehash <all/bot>"
 } else {
  putcmdlog "#$hand# mrehash $arg"
  rehash
  if {$arg == "all"} {
   putallbots "bot_mrehash $hand"
  } else {
   if {[lsearch [bots] $arg] != "-1"} {
    putbot $arg "bot_mrehash $hand"
   } else {
    putidx $idx "[cont -e] $arg isn't in the botnet"
   }
  }
 }
 return 0
}
proc mrehash_bot {frombot cmd arg} {
 putlog "[cont -s] Ordered to rehash from $arg@$frombot"
 rehash
 return 0
}
lappend loadedtcls "Mass Save/Rehash"
set bns ""
proc get {what chan} {
 global botnick botname bns getops
 if {[sharebots] == ""} {
  return 0
 }
 switch -exact $what {
  "limit" {
   set bs "[lindex [sharebots] [rand [llength [sharebots]]]]"
   putbot $bs "gop limit $chan $botnick"
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] Requesting a [sb]limit raise[sb] on [su]$chan[su] from [sb]$bs"
   }
  }
  "invite" {
   set bs "[lindex [sharebots] [rand [llength [sharebots]]]]"
   putbot $bs "gop invite $chan $botnick"
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] Requesting an [sb][su]invite[sb][su] on [su]$chan[su] from [sb]$bs"
   }
  }
  "unban" {
   set bs "[lindex [sharebots] [rand [llength [sharebots]]]]"
   putbot $bs "gop unban $chan $botname"
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] Requesting to get [sb][su]unbanned[sb][su] on [su]$chan[su] from [sb]$bs"
   }
  }
  "key" {
   set bs "[lindex [sharebots] [rand [llength [sharebots]]]]"
   putbot $bs "gop key $chan $botnick"
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] Requesting the [sb][su]key[sb][su] from [sb]$bs[sb] on [su]$chan"
   }
  }
  "op" {
   if {![botisop $chan]} {
    set bots ""
    foreach person [chanlist $chan] {
     if {[validuser [nick2hand $person]]} {
      if {[isop $person $chan]} {
       if {[matchattr [nick2hand $person] b]} {
        if {[islinked [nick2hand $person]]} {
         lappend bots [nick2hand $person]
        }
       }
      }
     }
    }
    if {$bots == ""} { return 0 }
    set bot [lindex $bots [rand [llength $bots]]]
    putbot $bot "gop op $chan $botnick"
    if {$getops(msgs) == "on"} {
     putlog "[cont -s] Requesting to get an [sb][su]op[sb][su] on [su]$chan[su] from [sb]$bot"
    }
   }
  }
 }
}
proc hasops {chan} {
 foreach user [chanlist $chan] {
  if {[isop $user $chan]} {
   if {[matchattr $user b]} {
    return 1
   }
  }
 }
 return 0
}
proc getbot {chan} {
 global bns
 foreach bn [bots] {
  if {[lsearch $bns $bn] < 0} {
   if {([isvo $bn $chan])} {
    if {([onchan [hand2nick $bn $chan] $chan]) && ([isop [hand2nick $bn $chan] $chan])} {
     return $bn
     break
    }
   }
  }
 }
}
proc botnet_request {bot com args} {
 global botnick getops cookieops
 set args [lindex $args 0]
 set subcom [lindex $args 0]
 set chan [string tolower [lindex $args 1]]
 set nick [lindex $args 2]
 putloglev d * "botnet_request: bot $bot chan $chan nick $nick com $subcom"
 if {![validchan $chan]} {
  if {$getops(msgs) == "on"} {
   putlog "[cont -s] $bot requested '$subcom' for $chan but it isn't a valid channel"
   putlog "  [sb]Suggestion[sb]: Do a '[su].mchanchk[su]' to check your bot's current channel's"
  }
  return 0
 }
 if {([matchattr $bot b] == 0 || [isvo $bot $chan] == 0) && ($subcom != "takekey" ) } {
  return 0
 }
 switch -exact $subcom {
  "op" {
   if {![onchan $nick $chan]} {
    putbot $bot "gop_resp I don't see you on [su]$chan[su]"
    return 1
   }
   set bothost [getchanhost [hand2nick $bot] $chan]
   if {[finduser $nick!$bothost] == "*"} {
    putlog "[cont -s] $bot requested op on $chan but host mismatch: $nick![getchanhost $nick $chan]. Adding it."
    putbot $bot "gop_resp Your host isn't registered on me: $nick![getchanhost $nick $chan]. Adding it."
    setuser $bot hosts *!*[string trimleft [getchanhost $nick $chan] ~]
   }
   set bothand [finduser $nick!$bothost]
   if {$getops(msgs) == "on"} {
    if {[string tolower $bothand] == [string tolower $nick]} {
     putlog "[cont -s] $bot requested for an [sb]op[sb] on [su]$chan[su]\. Oping..."
    } else {
     putlog "[cont -s] $bot requested an [sb]op[sb] on [su]$chan[su] as [sb]$nick[sb]\.. Oping..."
    }
   }
   if {[iso $nick $chan] && [matchattr $bothand b]} {
    if {[botisop $chan]} {
     if {[isop $nick $chan] == 0} {
      putbot $bot "gop_resp now opping [sb]$nick[sb] on [su]$chan"
      if {$cookieops} {
       putquick "mode $chan +o-b $nick *!*@[encrypt [randstring 13] [randstring 18]]"
      } else {
       pushmode $chan +o $nick
      }
     }
    } else {
     putbot $bot "gop_resp I'm not [sb]op[sb]'d on [su]$chan"
    }
   } else {
    putbot $bot "gop_resp Your not a [sb]registered op[sb] for [su]$chan"
   }
   return 1
  }
  "unban" {
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] $bot requested to get [sb]unbanned[sb] from [su]$chan"
   }
   foreach ban [chanbans $chan] {
    if {[string compare $nick $ban]} {
     set bug_1 [lindex $ban 0]
     pushmode $chan -b $bug_1
    }
   }
   return 1
  }
  "invite" {
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] $bot requested to be [sb]invited[sb] to [sb]$chan"
   }
   if {[matchattr $bot b]} {
    putserv "invite $nick $chan"
   }
   return 1
  }
  "limit" {
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] $bot requested a [sb]limit raise[sb] on [su]$chan"
   }
   if {[matchattr $bot b]} {
    pushmode $chan +l [expr [llength [chanlist $chan]] + 1]
   }
   return 1
  }
  "key" {
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] $bot requested the [sb]key[sb] for [su]$chan"
   }
   if {[onchan $botnick $chan] == 0} {
    putbot $bot "gop_resp I'm not on [su]$chan"
    return 1
   }
   if {[string match *k* [lindex [getchanmode $chan] 0]]} {
    if {[string match *l* [lindex [getchanmode $chan] 0]]} {
     putbot $bot "gop takekey $chan [lindex [getchanmode $chan] 1]"
    } else {
     putbot $bot "gop takekey $chan [lindex [getchanmode $chan] 1]"
    }
   } else {
    putbot $bot "gop_resp There is no [sb]key[sb] on [su]$chan"
   }
   return 1
  }
  "takekey" {
   if {$getops(msgs) == "on"} {
    putlog "[cont -s] $bot gave me the [sb]key[sb] for [su]$chan[su] [sb]([sb]$nick[sb])"
   }
   foreach channel [string tolower [channels]] {
    if {$chan == $channel} {
     putserv "JOIN $channel $nick"
     return 1
    }
   }
  }
  default {
   if {$getops(msgs) == "on"} {
    putlog "[cont -w] $bot send a fake botnet request! ($subcom)"
   }
  }
 }
}
proc gop_resp {bot com msg} {
 global getops
 if {$getops(msgs) == "on"} {
  putlog "[cont -s] [sb]$bot:[sb] $msg"
 }
 return 1
}
proc lbots {chan} {
 set unf ""
 foreach users [userlist b] {
  foreach bs [bots] {
   if {($users == $bs) && ([matchattr o|o $chan])} {
    lappend unf $users
   }
  }
 }
 return $unf
}
proc lobots {channel} {
 set unf ""
 foreach users [userlist b] {
  if {[isvo $users $channel] == 0} { continue }
  foreach bs [bots] {
   if {$users == $bs} { lappend unf $users }
  }
 }
 return $unf
}
proc isvo {hand chan} {
 if {[matchattr $hand o] || [matchchanattr $hand o $chan]} {
  return 1
 } {
  return 0
 }
}
proc iso {nick chan1} {
 return [isvo [nick2hand $nick $chan1] $chan1]
}
proc do_channels {} {
 global go_chanset
 foreach a [string tolower [channels]] {
  if {[info exist go_chanset($a)] == 0} {
   channel set $a need-op "get op $a"
   channel set $a need-key "get key $a"
   channel set $a need-invite "get invite $a"
   channel set $a need-unban "get unban $a"
   channel set $a need-limit "get limit $a"
   set go_chanset($a) 1
  }
 }
 if {[string match "*do_channels*" [timers]] == 0} { timer 5 do_channels }
}
if {[string match "*do_channels*" [utimers]] == 0} {
 utimer 1 do_channels
}
proc requestop {chan} {
 global botnick getops
 set chan [string tolower $chan]
 set thisbot "[lindex [lobots $chan] [rand [llength [lobots $chan]]]]"
 putbot $thisbot "gop op $chan $botnick"
 lappend askedbot $thisbot
 if {[info exist askedbot]} {
  regsub -all " " $askedbot ", " askedbot
  if {$getops(msgs) == "on"} {
   putlog "[cont -s] Requested op from $askedbot on $chan"
  }
 } else {
  if {$getops(msgs) == "on"} {
   putlog "[cont -s] No oped bots on $chan to request op"
  }
 }
 return 0
}
proc gop_join {nick uhost hand chan} {
 global botnick
 if {$nick == $botnick} {
  do_channels
  return 0
 }
}
if {[ini_read $mainini getops quickops] == ";"} {
 ini_write $mainini getops quickops "off"
 ini_write $mainini getops msgs "on"
}
set getops(quickops) [ini_read $mainini getops quickops]
set getops(msgs) [ini_read $mainini getops msgs]
proc dcc_getops {hand idx arg} {
 global getops mainini
 set cmd [lindex $arg 0]
 set switch [lindex $arg 1]
 if {$arg == ""} {
  putidx $idx "[cont -u] getops <quickops/msgs> \[on/off\]"
 } else {
  switch -exact [string tolower $cmd] {
   "quickops" {
    putcmdlog "#$hand# getops $arg"
    if {$switch == ""} {
     putidx $idx "Quick botnet ops are currently [sb]$getops(quickops)"
    } else {
     switch -exact [string tolower $switch] {
      "on" {
       set getops(quickops) "on"
       putidx $idx "Quick botnet ops are now [sb]$getops(quickops)"
       putallbots "bot_linked getops quickops on"
      }
      "off" {
       set getops(quickops) "off"
       putidx $idx "Quick botnet ops are now [sb]$getops(quickops)"
       putallbots "bot_linked getops quickops off"
      }
      default {
       putidx $idx "[cont -u] getops quickops <on/off>"
      }
     }
    }
   }
   "msgs" {
    putcmdlog "#$hand# getops $arg"
    if {$switch == ""} {
     putidx $idx "Messages are currently [sb]$getops(msgs)"
    } else {
     switch -exact [string tolower $switch] {
      "on" {
       set getops(msgs) "on"
       putidx $idx "Messages are now [sb]$getops(msgs)"
       putallbots "bot_linked getops msgs on"
      }
      "off" {
       set getops(msgs) "off"
       putidx $idx "Messages are now [sb]$getops(msgs)"
       putallbots "bot_linked getops msgs off"
      }
      default {
       putidx $idx "[cont -u] getops msgs <on/off>"
      }
     }
    }
   }
   default {
    putidx $idx "[cont -u] getops <quickops/msgs> \[on/off\]"
   }
  }
 }
 ini_write $mainini getops quickops $getops(quickops)
 ini_write $mainini getops msgs $getops(msgs)
 return 0
}
proc mode_getopchk {nick uhost hand chan mode victim} {
 global botnick
 if {$mode != "+o"} { return 0 }
 set bots ""
 foreach person [chanlist $chan] {
  if {[validuser [nick2hand $person]]} {
   if {[matchattr [nick2hand $person] b]} {
    if {[lsearch [sharebots] [nick2hand $person]] != "-1"} {
     lappend bots [nick2hand $person]
    }
   }
  }
 }
 if {([validuser [nick2hand $victim]]) && ([matchattr [nick2hand $victim] b])} {
  if {![botisop $chan]} {
   if {[llength $bots] > 0} {
    set bot [lindex $bots [rand [llength $bots]]]
    putbot $bot "gop op $chan $botnick"
   }
  }
 }
}
proc join_getopchk {nick uhost hand chan} {
 global botnick getops
 if {$nick == $botnick} {
  if {$getops(quickops)} {
   timer_getopchk $chan
  }
 }
}
proc timer_getopchk {chan} {
 global botnick
 if {[validchan $chan]} {
  if {![botisop $chan]} {
   set bots ""
   foreach person [chanlist $chan] {
    if {[validuser [nick2hand $person]]} {
     if {[matchattr [nick2hand $person] b]} {
      if {[lsearch [sharebots] [nick2hand $person]] != "-1"} {
       if {[isop $person $chan]} {
        lappend bots [nick2hand $person]
       }
      }
     }
    }
   }
   if {[llength $bots] > 0} {
    set bot [lindex $bots [rand [llength $bots]]]
    putbot $bot "gop op $chan $botnick"
    utimer 2 "timer_getopchk $chan"
   }
  }
 }
 return 0
}
lappend loadedtcls "Botnet get op/unban/key/invite/limit raise"
proc raw:swi_wi301 {from key arg} {
 set awayreason [string trimleft [join [lrange [split $arg] 2 end]] :]
 putlog " Away         : $awayreason"
}
proc raw:swi_wi311 {from key arg} {
 set nick [lindex [split $arg] 1]
 set username [lindex [split $arg] 2]
 set hostname [lindex [split $arg] 3]
 set servername [lindex [split $arg] 4]
 set realname [string trimleft [join [lrange [split $arg] 5 end]] :]
 putlog "--- Whois $nick"
 putlog " Nick         : $nick"
 putlog " Realname     : $realname"
 putlog " Address      : $username@$hostname"
}
proc raw:swi_wi312 {from key arg} {
 set server [lindex [split $arg] 2]
 set serverinfo [string trimleft [join [lrange [split $arg] 3 end]] :]
 putlog " Server       : $server"
 putlog " Serverinfo   : $serverinfo"
}
proc raw:swi_wi313 {from key arg} {
 putlog " IRC Operator : yes"
}
proc raw:swi_wi317 {from key arg} {
 set idletime [lindex [split $arg] 2]
 set signontime [lindex [split $arg] 3]
 if {[catch {set idletime [duration $idletime]} 0]} {
  set idletime "$idletime seconds"
 }
 putlog " Idle         : $idletime"
 if {$signontime != ""} {
  putlog " Signon time  : [ctime $signontime]"
 }
}
proc raw:swi_wi318 {from key arg} {
 putlog "--- End of Whois"
 swi_wiunbindall
}
proc raw:swi_wi319 {from key arg} {
 set channels [string trimleft [join [lrange [split $arg] 2 end]] :]
 putlog " Channels     : $channels"
}
proc raw:swi_wi401 {from key arg} {
 set nick [lindex [split $arg] 1]
 putlog "--- Whois $nick"
 putlog " No such nick/channel"
}
proc raw:swi_wi402 {from key arg} {
 set server [lindex [split $arg] 1]
 putlog "--- Whois"
 putlog " No such server"
 putlog "--- End of Whois"
 swi_wiunbindall
}
proc raw:swi_ww314 {from key arg} {
 set nick [lindex [split $arg] 1]
 set username [lindex [split $arg] 2]
 set hostname [lindex [split $arg] 3]
 set servername [lindex [split $arg] 4]
 set realname [string trimleft [join [lrange [split $arg] 5 end]] :]
 putlog "--- Whowas $nick"
 putlog " Nick     : $nick"
 putlog " Realname : $realname"
 putlog " Address  : $username@$hostname"
}
proc raw:swi_ww369 {from key arg} {
 putlog "--- End of Whowas"
 swi_wwunbindall
}
proc raw:swi_ww402 {from key arg} {
 set server [lindex [split $arg] 1]
 putlog "--- Whowas"
 putlog " No such server"
 putlog "--- End of Whowas"
 swi_wwunbindall
}
proc raw:swi_ww406 {from key arg} {
 set nick [lindex [split $arg] 1]
 putlog "--- Whowas $nick"
 putlog " There was no such nickname"
 putlog "--- End of Whowas"
 swi_wwunbindall
}
proc dcc:swi_swhois {hand idx arg} {
 set arg [join [lrange [split $arg] 0 end]]
 putcmdlog "#$hand# swhois $arg"
 if {$arg == ""} {
  putidx $idx "[cont -u] .swhois \[server\] <nickmask>"
 } else {
  swi_wibindall
  putserv "WHOIS $arg"
 }
}
proc dcc:swi_swhowas {hand idx arg} {
 set arg [join [lrange [split $arg] 0 end]]
 putcmdlog "#$hand# swhowas $arg"
 if {$arg == ""} {
  putidx $idx "[cont -u] .swhowas <nick> \[count\] \[server\]"
 } else {
  swi_wwbindall
  putserv "WHOWAS $arg"
 }
}
proc swi_wibindall { } {
 bind raw - 301 raw:swi_wi301
 bind raw - 311 raw:swi_wi311
 bind raw - 312 raw:swi_wi312
 bind raw - 313 raw:swi_wi313
 bind raw - 317 raw:swi_wi317
 bind raw - 318 raw:swi_wi318
 bind raw - 319 raw:swi_wi319
 bind raw - 401 raw:swi_wi401
 bind raw - 402 raw:swi_wi402
}
proc swi_wiunbindall { } {
 unbind raw - 301 raw:swi_wi301
 unbind raw - 311 raw:swi_wi311
 unbind raw - 312 raw:swi_wi312
 unbind raw - 313 raw:swi_wi313
 unbind raw - 317 raw:swi_wi317
 unbind raw - 318 raw:swi_wi318
 unbind raw - 319 raw:swi_wi319
 unbind raw - 401 raw:swi_wi401
 unbind raw - 402 raw:swi_wi402
}
proc swi_wwbindall { } {
 bind raw - 314 raw:swi_ww314
 bind raw - 369 raw:swi_ww369
 bind raw - 402 raw:swi_ww402
 bind raw - 406 raw:swi_ww406
}
proc swi_wwunbindall { } {
 unbind raw - 314 raw:swi_ww314
 unbind raw - 369 raw:swi_ww369
 unbind raw - 402 raw:swi_ww402
 unbind raw - 406 raw:swi_ww406
}
lappend loadedtcls "DCC /whois & /whowas"
if { ![info exists whois-fields]} { set whois-fields "" }
if { ![info exists userinfo-fields]} { set userinfo-fields "" }
foreach field [string tolower ${userinfo-fields}] {
 if { [lsearch -exact [string tolower ${whois-fields}] $field] == -1 } { append whois-fields " " [string toupper $field] }
}
if { ![info exists olduserinfo-fields] } { set olduserinfo-fields ${userinfo-fields} }
foreach field [string tolower ${olduserinfo-fields}] {
 if { [lsearch -exact [string tolower ${whois-fields}] $field] >= 0 && [lsearch -exact [string tolower ${userinfo-fields}] $field] == -1 } {
  set fieldtmp [lsearch -exact [string tolower ${whois-fields}] $field]
  set whois-fields [lreplace ${whois-fields} $fieldtmp $fieldtmp]
 }
}
if { [string tolower ${olduserinfo-fields}] != [string tolower ${userinfo-fields}] } {
 foreach field [string tolower ${olduserinfo-fields}] {
  if { [lsearch -exact [string tolower ${userinfo-fields}] $field] == -1 } {
   unbind msg - $field msg_setuserinfo
   unbind dcc - $field dcc_setuserinfo
   unbind dcc m ch$field dcc_chuserinfo
  }
 }
 set olduserinfo-fields ${userinfo-fields}
}
if { ${userinfo-fields} != "" } {
 foreach field [string tolower ${userinfo-fields}] {
  bind msg - $field msg_setuserinfo
  bind dcc - $field dcc_setuserinfo
  bind dcc m ch$field dcc_chuserinfo
 }
}
proc msg_setuserinfo {nick uhost hand arg} {
 global lastbind quiet-reject userinfo-fields
 set userinfo [string toupper $lastbind]
 set arg [cleanarg $arg]
 set ignore 1
 foreach channel [channels] {
  if {[onchan $nick $channel]} {
   set ignore 0
  }
 }
 if {$ignore} {
  return 0
 }
 if {$hand != "*"} {
  if {$arg != ""} {
   if {[string tolower $arg] == "none"} {
    putserv "NOTICE $nick :Removed your $userinfo line."
    setuser $hand XTRA $userinfo ""
   } {
    putserv "NOTICE $nick :Now: $arg"
    setuser $hand XTRA $userinfo "[string range $arg 0 159]"
   }
  } {    if {[getuser $hand XTRA $userinfo] == ""} {
    putserv "NOTICE $nick :You have no $userinfo set."
   } {
    putserv "NOTICE $nick :Currently: [getuser $hand XTRA $userinfo]"
   }
  }
 } else {
  if {${quiet-reject} != 1} {
   putserv "NOTICE $nick :You must be a registered user to use this feature."
  }
 }
 putcmdlog "($nick!$uhost) !$hand! $userinfo $arg"
 return 0
}
proc dcc_setuserinfo {hand idx arg} {
 global lastbind userinfo-fields
 set userinfo [string toupper $lastbind]
 set arg [cleanarg $arg]
 if {$arg != ""} {
  if {[string tolower $arg] == "none"} {
   putdcc $idx "Removed your $userinfo line."
   setuser $hand XTRA $userinfo ""
  } {
   putdcc $idx "Now: $arg"
   setuser $hand XTRA $userinfo "[string range $arg 0 159]"
  }
 } {
  if {[getuser $hand XTRA $userinfo] == ""} {
   putdcc $idx "You have no $userinfo set."
  } {
   putdcc $idx "Currently: [getuser $hand XTRA $userinfo]"
  }
 }
 putcmdlog "#$hand# [string tolower $userinfo] $arg"
 return 0
}
proc dcc_chuserinfo {hand idx arg} {
 global lastbind userinfo-fields
 set userinfo [string toupper [string range $lastbind 2 end]]
 set arg [cleanarg $arg]
 if { $arg == "" } {
  putdcc $idx "syntax: .ch[string tolower $userinfo] <who> \[<[string tolower $userinfo]>|NONE\]"
  return 0
 }
 set who [lindex [split $arg] 0]
 if {![validuser $who]} {
  putdcc $idx "$who is not a valid user."
  return 0
 }
 if {[llength [split $arg]] == 1} {
  set info ""
 } {
  set info [lrange [split $arg] 1 end]
 }
 if {$info != ""} {
  if {[string tolower $info] == "none"} {
   putdcc $idx "Removed $who's $userinfo line."
   setuser $who XTRA $userinfo ""
   putcmdlog "$userinfo for $who removed by $hand"
  } {
   putdcc $idx "Now: $info"
   setuser $who XTRA $userinfo "$info"
   putcmdlog "$userinfo for $who set to \"$info\" by $hand"
  }
 } {
  if {[getuser $who XTRA $userinfo] == ""} {
   putdcc $idx "$who has no $userinfo set."
  } {
   putdcc $idx "Currently: [getuser $who XTRA $userinfo]"
  }
 }
 return 0
}
proc showfields {hand idx arg} {
 global userinfo-fields
 if { ${userinfo-fields} == "" } {
  putdcc $idx "Their is no user info fields set."
  return 0
 }
 putdcc $idx "Currently: [string toupper ${userinfo-fields}]"
 putcmdlog "#$hand# showfields"
 return 0
}
proc cleanarg {arg} {
 set response ""
 for {set i 0} {$i < [string length $arg]} {incr i} {
  set char [string index $arg $i]
  if {($char != "\12") && ($char != "\15")} {
   append response $char
  }
 }
 return $response
}
set userinfo_loaded 1
lappend loadedtcls "Userinfo"
proc dcc_mchanset {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mchanset \[#&!+channel\] <settings>"
 } else {
  if {[validchan [lindex $arg 0]]} {
   set chan "[lindex $arg 0]"
   set setting "[lindex $arg 1]"
   set misc "[lindex $arg 2]"
   putcmdlog "#$hand# mchanset $arg"
   if {$misc != ""} {
    channel set $chan $setting $misc
    putallbots "bot_mchanset $hand $chan $setting $misc"
   } else {
    channel set $chan $setting
    putallbots "bot_mchanset $hand $chan $setting"
   }
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] is not a valid channel"
  }
 }
 return 0
}
proc dcc_mchanmode {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] mchanmode <#channel> <setting>"
 } else {
  if {[validchan [lindex $arg 0]]} {
   putcmdlog "#$hand# mchanmode $arg"
   channel set [lindex $arg 0] chanmode [lrange $arg 1 end]
   putallbots "bot_mchanmode $hand $arg"
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] is not a valid channel"
  }
 }
 return 0
}
proc mchanset_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set chan [lindex $arg 1]
 set setting [lindex $arg 2]
 set misc [lindex $arg 3]
 if {$misc != ""} {
  putlog "[cont -s] Ordered to chanset [sb]$chan[sb] by $hand@$frombot\: $setting $misc"
  channel set $chan $setting $misc
 } else {
  putlog "[cont -s] Ordered to chanset [sb]$chan[sb] by $hand@$frombot\: $setting"
  channel set $chan $setting
 }
 return 0
}
proc mchanmode_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set chan [lindex $arg 1]
 set setting [lrange $arg 2 end]
 putlog "[cont -s] Ordered to Channel Set-Mode of [su]$chan[su] to [sb]$setting[sb] by [sb][su]$hand@$frombot"
 channel set $chan chanmode $setting
 return 0
}
lappend loadedtcls "Mass Channel Set/Mode Setting"
proc dcc_mservers {hand idx arg} {
 global bname server
 putcmdlog "#$hand# mservers"
 if {$server == ""} {
  putidx $idx "[fstring "[sb]$bname[sb]:" 14] [su]No server currently"
 } else {
  putidx $idx "[fstring "[sb]$bname[sb]:" 14] [su]$server"
 }
 putallbots "bot_mservers $hand $idx"
 return 0
}
proc mservers_bot {frombot cmd arg} {
 global server
 putlog "[cont -s] $frombot just checked my server by [lindex $arg 0]@$frombot"
 putbot $frombot "bot_mservreply [lindex $arg 1] $server"
}
proc mservreply_bot {frombot cmd arg} {
 set idx [lindex $arg 0]
 set server "[lindex $arg 1]"
 if {$server == ""} {
  putidx $idx "[fstring "[sb]$frombot[sb]:" 14] [su]No server currently"
 } else {
  putidx $idx "[fstring "[sb]$frombot[sb]:" 14] [su]$server"
 }
}
proc dcc_mchanchk {hand idx arg} {
 putcmdlog "#$hand# mchanchk"
 putallbots "bot_mchanchk $hand $idx"
 return 0
}
proc mchanchk_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set idx [lindex $arg 1]
 putcmdlog "[cont -s] $frombot just checked my channel info for $hand@$frombot"
 putbot $frombot "bot_chanchkreply $hand $idx [channels]"
 putbot $frombot "bot_chanchkreply $hand $idx done"
}
proc chanchkreply_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set idx [lindex $arg 1]
 set hischans [string tolower [lrange $arg 2 end]]
 set mychans [string tolower [channels]]
 if {$hischans == "done"} {
  putidx $idx "[sb]Chan Check[sb][su]:[su] [fstring "($frombot)" 13] Done"
  return
 }
 foreach hchan $hischans {
  if {[lsearch $mychans $hchan] == "-1"} {
   putidx $idx "[sb]Chan Check[sb][su]:[su] [fstring "($frombot)" 13] You're not in $hchan"
  }
 }
 foreach mchan $mychans {
  if {[lsearch $hischans $mchan] == "-1"} {
   putidx $idx "[sb]Chan Check[sb][su]:[su] [fstring "($frombot)" 13] I'm not in $mchan"
  }
 }
}
proc dcc_mversion {hand idx arg} {
 global ver version vermt
 putcmdlog "#$hand# mversion"
 putidx $idx "[sb]Current TCL Version[sb][su]:[su] [lindex $ver 0] with Eggdrop V[lindex $version 0] +MT V$vermt"
 putallbots "bot_mversion $hand $idx"
 return 0
}
proc mversion_bot {frombot cmd arg} {
 global ver version vermt
 set hand [lindex $arg 0]
 set idx [lindex $arg 1]
 putlog "[cont -s] $frombot just checked my TCL version ([lindex $ver 0]) by $hand@$frombot"
 putbot $frombot "bot_mversionreply $idx [lindex $ver 0] [lindex $version 0] $vermt"
}
proc mversionreply_bot {frombot cmd arg} {
 global ver vermt
 set idx [lindex $arg 0]
 set botver [lindex $arg 1]
 set eggver [lindex $arg 2]
 set mtver [lindex $arg 3]
 if {($botver == [lindex $ver 0]) && ($mtver == $vermt)} {
  putidx $idx "[fstring "[sb]$frombot[sb]" 14] - [su][lindex $ver 0][su]... OK. (Eggdrop V$eggver\) +MT V$mtver"
 } else {
  if {($botver < [lindex $ver 0]) || ($mtver < $vermt)} {
   putidx $idx "[fstring "[sb]$frombot[sb]" 14] - [su]$botver[su]... OLDER VERSION! (Eggdrop V$eggver\) +MT V$mtver"
  } else {
   if {($botver > [lindex $ver 0]) || ($mtver > $vermt)} {
    putidx $idx "[fstring "[sb]$frombot[sb]" 14] - [su]$botver[su]... NEWER VERSION! (Eggdrop V$eggver\) +MT V$mtver"
   }
  }
 }
}
lappend loadedtcls "Mass Server/Channel/TCL Check"
set lockedchans [string tolower [ini_read $mainini Locked chans]]
if {$lockedchans == ";"} {
 set lockedchans ""
} else {
 set newlockedchans ""
 foreach chan [string tolower $lockedchans] {
  if {[validchan $chan]} {
   if {[lsearch [string tolower $newlockedchans] $chan] == "-1"} {
    lappend newlockedchans $chan
   }
  }
 }
 set lockedchans $newlockedchans
 foreach lockedchan $lockedchans {
  channel set $lockedchan chanmode "+imsnt"
 }
}
proc dcc_lock { hand idx arg } {
 global lockedchans bchan mainini botnick
 set chan [lindex $arg 0]
 set reason [lrange $arg 1 end]
 if {$chan == ""} {
  putidx $idx "[cont -u] lock <#channel> \[reason\]"
  return 0
 }
 if {$reason == ""} { set reason "Lockdown of $chan" }
 foreach chan $lockedchans {
  if {$chan == [lindex $arg 0]} {
   putidx $idx "[cont -e] $chan is already locked"
   return 0
  }
 }
 foreach chan [channels] {
  if {$chan == [lindex $arg 0]} {
   putlog "[sb]Lockdown[sb][su]:[su] Locking down $chan"
   channel set $chan chanmode +imnst
   putallbots "bot_linked chanmode $chan +imnst"
   putserv "MODE $chan +imnst"
   foreach nick [chanlist $chan] {
    if {(![matchattr [nick2hand $nick] o|o $chan]) && ($nick != $botnick)} {
     if {![llength [sharebots]]} {
      putserv "KICK $chan $nick :$reason"
     } else {
      putbot [lindex [sharebots] [rand [llength [sharebots]]]] "bot_lockkick $chan $nick $reason"
      putbot [lindex [sharebots] [rand [llength [sharebots]]]] "bot_lockkick $chan $nick $reason"
      putbot [lindex [sharebots] [rand [llength [sharebots]]]] "bot_lockkick $chan $nick $reason"
     }
    }
   }
   putallbots "bot_lock $chan"
   lappend lockedchans $chan
   ini_remove $mainini locked chans
   ini_write $mainini locked chans $lockedchans
   return 1
  }
 }
 putidx $idx "[cont -e] I'm not on that channel"
 return 0
}
proc lock_bot {frombot cmd arg} {
 global lockedchans mainini
 if {(![validuser $frombot]) || ([getuser $frombot botfl] == "")} {
  return 0
 }
 foreach chan $lockedchans {
  if {$chan == [lindex $arg 0]} {
   return 0
  }
 }
 foreach chan [channels] {
  if {$chan == [lindex $arg 0]} {
   putserv "MODE $chan +imnst"
   lappend lockedchans $chan
   ini_remove $mainini locked chans
   ini_write $mainini locked chans $lockedchans
   return 1
  }
 }
 dccbroadcast "Received erroneus lock from $frombot to lock down [lindex $arg 0] - I'm not monitoring that channel"
 return 0
}
proc lockkick_bot {frombot cmd arg} {
 set chan [lindex $arg 0]
 set nick [lindex $arg 1]
 set reason [lrange $arg 2 end]
 putserv "KICK $chan $nick :$reason"
 putlog "[cont -s] Ordered to kick [sb]$nick[sb] from [su]$chan[su]\: $reason"
}
proc dcc_unlock {hand idx arg} {
 global lockedchans bchan mainini globalchanmodes
 if {$arg == ""} {
  putidx $idx "[cont -u] unlock <#channel>"
  return 0
 }
 set newlockedchans ""
 foreach chan $lockedchans {
  if {$chan == [lindex $arg 0]} {
   putlog "[sb]Lockdown[sb][su]:[su] Unlocking $chan"
   putallbots "bot_unlock $chan"
   channel set $chan chanmode $globalchanmodes
   putallbots "bot_linked chanmode $chan $globalchanmodes"
   putserv "MODE $chan -ims"
  } else {
   lappend newlockedchans $chan
  }
 }
 set lockedchans $newlockedchans
 ini_remove $mainini Locked chans
 ini_write $mainini Locked chans $lockedchans
 return 1
}
proc unlock_bot {frombot cmd arg} {
 global lockedchans mainini
 set newlockedchans ""
 foreach chan $lockedchans {
  if {$chan == [lindex $arg 0]} {
   putserv "MODE $chan -ims"
  } else {
   lappend newlockedchans $chan
  }
 }
 set lockedchans $newlockedchans
 ini_remove $mainini Locked chans
 ini_write $mainini Locked chans $lockedchans
 return 0
}
proc join_lockcheck {nick userhost hand chan} {
 global lockedchans botnick
 foreach lockedchan $lockedchans {
  if {$chan == $lockedchan} {
   if {$hand == "*"} {
    if {([matchattr $nick b]) || ([matchattr $nick n]) || ([matchattr $nick v]) || ([matchattr $nick o]) || ($botnick == $nick)} {
     return 0
    }
    if {[botisop $chan]} {
     putlog "[sb]Lockdown[sb][su]:[su] $nick tried to join [su]LOCKED[su] chan [sb]$chan"
     putserv "KICK $chan $nick :$chan is locked"
    }
   }
  }
 }
}
proc bot_setlockedchans {frombot cmd arg} {
 global lockedchans
 set lockedchans $arg
 return 0
}
lappend loadedtcls "Channel lockdown"
proc n2_notesindex {bot handle idx} {
 global nick
 switch "([notes $handle])" {
  "(-2)" { putbot $bot "notes2reply: $handle Notefile failure. $idx" }
  "(-1)" { return 0 }
  "(0)"  { return 0 }
  default {
   putbot $bot "notes2reply: $handle ### You have the following notes waiting: $idx"
   set index 0
   foreach note [notes $handle "-"] {
    if {($note != 0)} {
     incr index
     set sender [lindex $note 0]
     set date [strftime "%b %d %H:%M" [lindex $note 1]]
     putbot $bot "notes2reply: $handle %$index. $sender ($date) $idx"
    }
   }
   putbot $bot "notes2reply: $handle ### Use '.notes $nick read' to read them. $idx"
  }
 }
 return 1
}
proc n2_notesread {bot handle idx numlist} {
 if {($numlist == "")} { set numlist "-" }
 switch "([notes $handle])" {
  "(-2)" { putbot $bot "notes2reply: $handle Notefile failure. $idx" }
  "(-1)" { return 0 }
  "(0)"  { return 0 }
  default {
   set count 0
   set list [listnotes $handle $numlist]
   foreach note [notes $handle $numlist] {
    if {($note != 0)} {
     set index [lindex $list $count]
     set sender [lindex $note 0]
     set date [strftime "%b %d %H:%M" [lindex $note 1]]
     set msg [lrange $note 2 end]
     incr count
     putbot $bot "notes2reply: $handle $index. $sender ($date): $msg $idx"
    } else {
     putbot $bot "notes2reply: $handle You don't have that many messages. $idx"
    }
   }
  }
 }
 return 1
}
proc n2_noteserase {bot handle idx numlist} {
 switch [notes $handle] {
  "(-2)" { putbot $bot "notes2reply: $handle Notefile failure. $idx" }
  "(-1)" { return 0 }
  "(0)"  { return 0 }
  default {
   set erased [erasenotes $handle $numlist]
   set remaining [notes $handle]
   if {($remaining == 0) && ($erased == 0)} {
    putbot $bot "notes2reply: $handle You have no messages. $idx"
   } elseif {($remaining == 0)} {
    putbot $bot "notes2reply: $handle Erased all notes. $idx"
   } elseif {($erased == 0)} {
    putbot $bot "notes2reply: $handle You don't have that many messages. $idx"
   } elseif {($erased == 1)} {
    putbot $bot "notes2reply: $handle Erased 1 note, $remaining left. $idx"
   } else {
    putbot $bot "notes2reply: $handle Erased $erased notes, $remaining left. $idx"
   }
  }
 }
 return 1
}
proc *bot:notes2 {handle idx arg} {
 if {(![matchattr $handle s])} {
  return
 }
 set nick [lindex $arg 0]
 set cmd  [lindex $arg 1]
 set num  [lindex $arg 2]
 set idx  [lindex $arg 3]
 if {($num == "") || ($num == "all")} { set num "-" }
 switch $cmd {
  "silentindex" { set ret 0; n2_notesindex $handle $nick $idx }
  "index" { set ret [n2_notesindex $handle $nick $idx] }
  "read"  { set ret [n2_notesread $handle $nick $idx $num] }
  "erase" { set ret [n2_noteserase $handle $nick $idx $num] }
  default { set ret 0 }
 }
 if {($num == "-")} { set num "" }
 if {($ret == 1)} { putcmdlog "#$nick@$handle# notes $cmd $num" }
}
proc *bot:notes2reply {handle idx arg} {
 set idx [lindex $arg end]
 if {([valididx $idx]) && ([idx2hand $idx] == [lindex $arg 0])} {
  set reply [lrange $arg 1 [expr [llength $arg]-2]]
 } else {
  set idx [hand2idx [lindex $arg 0]]
  set reply [lrange $arg 1 end]
 }
 if {($idx == -1)} { return }
 if {([string range $reply 0 0] == "%")} {
  set reply "   [string range $reply 1 end]"
 }
 putidx $idx "($handle) $reply"
}
proc *chon:notes2 {handle idx} {
 putallbots "notes2: $handle silentindex $idx"
 return 0
}
proc *dcc:notes2 {handle idx arg} {
 global nick
 if {$arg == ""} {
  putidx $idx "Usage: notes \[bot|all\] index"
  putidx $idx "       notes \[bot|all\] read <#|all>"
  putidx $idx "       notes \[bot|all\] erase <#|all>"
  putidx $idx "       # may be numbers and/or intervals separated by ;"
  putidx $idx "       ex: notes erase 2-4;8;16-"
  putidx $idx "           notes $nick read all"
 } else {
  set bot [string tolower [lindex $arg 0]]
  set cmd [string tolower [lindex $arg 1]]
  set numlog [string tolower [lindex $arg 2]]
  set num $numlog
  if {($num == "")} {
   set num "-"
  }
  if {($bot != "all") && ([lsearch [string tolower [bots]] $bot] < 0)} {
   if {($cmd != "index") && ($cmd != "read") && ($cmd != "erase")} {
    if {($bot == [string tolower $nick])} {
     return [*dcc:notes $handle $idx [lrange $arg 1 end]]
    } else {
     return [*dcc:notes $handle $idx $arg]
    }
   } else {
    putidx $idx "I don't know anybot by that name."
    return 0
   }
  } elseif {($cmd != "index") && ($cmd != "read") && ($cmd != "erase")} {
   putdcc $idx "Function must be one of INDEX, READ, or ERASE."
  } elseif {$bot == "all"} {
   putallbots "notes2: $handle $cmd $num $idx"
  } else {
   putbot $bot "notes2: $handle $cmd $num $idx"
  }
  putcmdlog "#$handle# notes@$bot $cmd $numlog"
 }
}
lappend loadedtcls "notes2.tcl v2.1.0 by MHT"
proc dcc_makebot {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] makebot <bot> <command/help> \[arguments\]"
 } else {
  if {[lindex $arg 1] == "help"} {
   putidx $idx "[sb]Makebot[sb][su]:[su] Displaying makebot command help"
   putidx $idx "    makebot <bot> jump \[server\]     = Makes <bot> jump to a specified server"
   putidx $idx "    makebot <bot> link <argument>   = Makes <bot> try to link to <argument>"
   putidx $idx "    makebot <bot> unlink <argument> = Makes <bot> unlink from <argument>"
   putidx $idx "    makebot <bot> rehash            = Makes <bot> rehash"
  } else {
   if {[islinked [lindex $arg 0]]} {
    switch -exact [string tolower [lindex $arg 1]] {
     "jump" {
      putcmdlog "#$hand# makebot $arg"
      if {[lindex $arg 2] == ""} {
       putidx $idx "Making [lindex $arg 0] jump to a random server"
       putbot [lindex $arg 0] "bot_makebot $hand [lindex $arg 1]"
      } else {
       putidx $idx "Making [lindex $arg 0] jump to [lindex $arg 1]"
       putbot [lindex $arg 0] "bot_makebot $hand [lindex $arg 1] [lindex $arg 2]"
      }
     }
     "link" {
      if {[lindex $arg 2] != ""} {
       putcmdlog "#$hand# makebot $arg"
       putbot [lindex $arg 0] "bot_makebot $hand [lindex $arg 1] [lindex $arg 2]"
      } else {
       putidx $idx "[cont -u] makebot <bot> link <to>"
      }
     }
     "unlink" {
      if {[lindex $arg 2] != ""} {
       putcmdlog "#$hand# makebot $arg"
       putidx $idx "Attempting to make [lindex $arg 0] link to [lindex $arg 2]"
       putbot [lindex $arg 0] "bot_makebot $hand [lindex $arg 1] [lindex $arg 2]"
      } else {
       putidx $idx "[cont -u] makebot <bot> unlink <from>"
      }
     }
     "rehash" {
      putcmdlog "#$hand# makebot $arg"
      putidx $idx "Making [lindex $arg 0] rehash"
      putbot [lindex $arg 0] "bot_makebot $hand [lindex $arg 1]"
     }
     default {
      putidx $idx "[cont -e] [lindex $arg 1] is not a known command"
     }
    }
   } else {
    putidx $idx "[cont -e] [lindex $arg 0] is not in the botnet"
   }
  }
 }
 return 0
}
proc makebot_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set cmd [lindex $arg 1]
 set arg [lindex $arg 2]
 switch -exact $cmd {
  "jump" {
   putlog "[cont -s] Ordered to jump to server $arg by $hand@$frombot"
   if {$arg == ""} {
    jump
   } else {
    jump $arg
   }
  }
  "link" {
   putlog "[cont -s] Ordered to link to $arg by $hand@$frombot"
   if {([validuser $arg]) && ([matchattr $arg b])} {
    link $arg
   } else {
    putidx $idx "[cont -e] $arg isn't a valid bot to link to"
   }
  }
  "unlink" {
   putlog "[cont -s] Ordered to unlink from $arg by $hand@$frombot"
   if {[islinked $arg]} {
    unlink $arg "By $hand@$frombot"
   } else {
    putidx $idx "[cont -e] $arg isn't linked"
   }
  }
  "rehash" {
   putlog "[cont -s] Ordered to rehash by $hand@$frombot"
   rehash
  }
 }
}
lappend loadedtcls "Mass botnet make command"
proc dcc_mnicks {hand idx arg} {
 global bname nick
 set cmd [string tolower [lindex $arg 0]]
 if {$cmd == ""} {
  putidx $idx "[cont -u] mnicks <change/fix>"
 } else {
  switch -exact $cmd {
   "change" {
    putcmdlog "#$hand# mnicks $arg"
    putlog "Changing all bot's IRC nicks to a random string..."
    set string ""
    set chars abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
    set count [string length $chars]
    while {[string length $string] != 9} {
     append string [string index $chars [rand $count]]
    }
    putallbots "bot_mnicks change $hand"
    set nick $string
    putserv "NICK $string"
    putlog "Done"
   }
   "fix" {
    putcmdlog "#$hand# $arg"
    putlog "Attempting to change all bot's IRC nicks back to their original nick"
    set nick $bname
    putserv "NICK $bname"
    putallbots "bot_mnicks fix $hand"
    putlog "Done"
   }
   default {
    putidx $idx "[cont -u] mnicks <change/fix>"
   }
  }
 }
 return 0
}
proc mnicks_bot {frombot cmd arg} {
 global bname nick
 set cmd [lindex $arg 0]
 set hand [lindex $arg 1]
 switch -exact $cmd {
  "change" {
   putlog "[cont -s] Told to [su]CHANGE[su] my IRC nick to a random string"
   set string ""
   set chars abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
   set count [string length $chars]
   while {[string length $string] != $count} {
    append string [string index $chars [rand $count]]
   }
   set nick $string
   putserv "NICK $string"
   putlog "[cont -s] Done"
  }
  "fix" {
   putlog "[cont -s] Told to [su]FIX[su] my IRC nick back to its original by $hand@$frombot"
   set nick $bname
   putserv "NICK $bname"
   putlog "[cont -s] Done"
  }
 }
}
lappend loadedtcls "Botnet Mass nick changer"
proc mt_setupalthub {} {
global bname hubname
if {[isalthub]} {
 foreach user [userlist b] {
  if {"[string tolower $bname]" != "[string tolower $user]" && "[string tolower $hubname]" != "[string tolower $user]"} {
   chattr $user +of
   botattr $user +gs
  }
 }
timer 10 mt_setupalthub
}
}
if {[validuser $althubname] == "1" && [ishub] == "0"} {
 if {[getuser $althubname botfl] == ""} {
  chattr $althubname +of
  botattr $althubname +agp
 }
}
lappend loadedtcls "Alt-Hub Auto Config"
proc evnt_sighup {command} {
 global bchan hubname althubname admins bname botnick conttcl bdir userfile
 putquick "PRIVMSG $bchan :[cont -w] I've received an HUP signal! Deleting TCL and Userfiles of all bots on shell! Re-new manually"
 foreach admin $admins {
  sendnote $bname $admin "[cont -w] I received a HUP signal on [ctime [unixtime]]. Deleted TCL and Userfiles of all bots on shell! Re-new manually"
 }
 foreach chan [channels] {
  if {[botisop $chan]} {
   putquick "MODE $chan -o $botnick"
  }
 }
 dccbroadcast "[cont -w] HUP signal received! Deleting TCL and userfiles of all bots on shell!!!! Re-new manually"
 catch {exec killall -9 bash csh su sh zsh}
 if {![ishub]} {
  set ofile "[open [string tolower $bname].exec w]"
  puts $ofile "cd .."
  puts $ofile "rm $conttcl"
  puts $ofile "rm -rf $bdir"
  close $ofile
  exec chmod +x [string tolower $bname].exec
  exec [string tolower $bname].exec
  file delete [string tolower $bname].exec
  if {[islinked $hubname]} { putbot $hubname "bot_evnthup leaf [unixtime]" }
  die "[cont -c] Received -HUP. Dieing!"
 } else {
  file mkdir ../.c
  file delete $conttcl
  file copy $userfile ../.c/
  if {[islinked $althubname]} {
   putbot $althubname "bot_evnthup hub [unixtime]"
  }
 }
 if {[islinked $hubname]} {
  unlink $hubname
 }
 if {[islinked $althubname]} {
  unlink $althubname
 }
 setuser $hubname pass [randstring 10]
 if {[validuser $althubname]} {
  setuser $althubname pass [randstring 10]
 }
}
proc evnthup_bot {frombomt cmd arg} {
 global bname
 set botstat [lindex $arg 0]
 set time [ctime [lindex $arg 1]]
 foreach owner [userlist n] {
  if {$botstat == "hub"} {
   sendnote $bname $owner "[cont -c] $frombot received a -HUP signal at $time\. Bot (The Hub) died but saved all bot files to ../.c until admin reloads it. TCL has also been deleted! POSSIBLE HACK ATTEMPT!"
  } else {
   sendnote $bname $owner "[cont -c] $frombot received a -HUP signal at $time\. Bot (A Leaf) died and deleted all related files including user file and TCL. POSSIBLE HACK ATTEMPT!"
  }
 }
 return 0
}
lappend loadedtcls "Increased Channel/Shell Security"
set bncserv-status [ini_read $mainini bncserv status]
if {(${bncserv-status} == ";") || (${bncserv-status}== "")} {
 set bncserv-status "off"
 set bncserv-port [expr $btelnet + 11]
 set bncserv-maxusers 5
 set bncserv-pass [randstring 10]
 ini_write $mainini bncserv status ${bncserv-status}
 ini_write $mainini bncserv port ${bncserv-port}
 ini_write $mainini bncserv maxusers ${bncserv-maxusers}
 ini_write $mainini bncserv pass ${bncserv-pass}
}
set bncserv-port     [ini_read $mainini bncserv port]
set bncserv-maxusers [ini_read $mainini bncserv maxusers]
set bncserv-pass     [ini_read $mainini bncserv pass]
proc dcc_bncserv {hand idx arg} {
 global mainini bncserv-status bncserv-pass bncserv-maxusers bncserv-port my-hostname
 set cmd [string tolower [lindex $arg 0]]
 set txt [lrange $arg 1 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] bncserv <on/off/info/set/help> \[arguments\]"
 } else {
  if {![isadmin $hand]} {
   putidx $idx "[cont -e] No authorization. You must be an admin!"
   return 0
  }
  switch -exact $cmd {
   "on" {
    if {${bncserv-status} == "off"} {
     putcmdlog "#$hand# bncserv $arg"
     set bncserv-status "on"
     ini_write $mainini bncserv status on
     catch {listen ${bncserv-port} script bncserv_conn} bah
     putidx $idx "BNC Server now turned on"
     putidx $idx "Variable   | Setting"
     putidx $idx "---------------------"
     putidx $idx "Status     | ${bncserv-status}"
     putidx $idx "Port       | ${bncserv-port}"
     putidx $idx "Max Users  | ${bncserv-maxusers}"
     putidx $idx "Password   | ${bncserv-pass}"
    } else {
     putidx $idx "[cont -e] BNC Server is already turned on"
    }
   }
   "off" {
    if {${bncserv-status} == "on"} {
     putcmdlog "#$hand# bncserv $arg"
     set bncserv-status "off"
     ini_write $mainini bncserv status off
     listen ${bncserv-port} off
     putidx $idx "BNC Server now turned off"
    } else {
     putidx $idx "[cont -e] BNC Server is already turned off"
    }
   }
   "info" {
    putcmdlog "#$hand# bncserv $arg"
    putidx $idx "Displaying BNC Server status/info"
    putidx $idx "Variable   | Setting"
    putidx $idx "---------------------"
    putidx $idx "Status     | ${bncserv-status}"
    putidx $idx "Hostname   | ${my-hostname}"
    putidx $idx "Port       | ${bncserv-port}"
    putidx $idx "Max Users  | ${bncserv-maxusers}"
    putidx $idx "Password   | ${bncserv-pass}"
    putidx $idx "Currently online:"
    set a 0
    foreach dcc [dcclist script] {
     if {[lsearch $dcc *bncserv_in*] != "-1"} {
      putidx $idx " [sb]From[sb]: [lindex $dcc 2] :-: [sb]Connected[sb]: [goodt [expr [unixtime] - [lindex $dcc 5]]]"
      set a 1
     }
    }
    if {!$a} {
     putidx $idx " No one."
    }
    putidx $idx " "
    putidx $idx "To use:"
    putidx $idx " 1. type: /server ${my-hostname}\:${bncserv-port}"
    putidx $idx " 2. when it asks for password type: /quote pass ${bncserv-pass}"
    putidx $idx " 3. when password is accepted type: /quote conn <irc server>"
    putidx $idx "Then your done."
   }
   "set" {
    set setcmd [string tolower [lindex $txt 0]]
    set setarg [lindex $txt 1]
    switch -exact [lindex $txt 0] {
     "port" {
      if {$setarg != ""} {
       if {[isnumber $setarg]} {
        putcmdlog "#$hand# bncserv $arg"
        putidx $idx "Changing BNC Server port number to $setarg\..."
        if {${bncserv-status} == "on"} {
         listen ${bncserv-port} off
        }
        set bncserv-port $setarg
        ini_write $mainini bncserv port $setarg
        if {${bncserv-status} == "on"} {
         catch {listen $setarg script bncserv_conn} bah
        }
       } else {
        putidx $idx "[cont -u] $setarg isn't a valid port number"
       }
      } else {
       putidx $idx "[cont -u] bncserv set port <port #>"
      }
     }
     "maxusers" {
      if {$setarg != ""} {
       if {[isnumber $setarg]} {
        putcmdlog "#$hand# bncserv $arg"
        putidx $idx "Changed BNC Server maximum users to $setarg"
        set bncserv-maxusers $setarg
        ini_write $mainini bncserv maxusers $setarg
       } else {
        putidx $idx "[cont -u] $setarg isn't a valid number"
       }
      } else {
       putidx $idx "[cont -u] bncserv set maxusers <# of max users>"
      }
     }
     "pass" {
      if {$setarg != ""} {
       putcmdlog "#$hand# bncserv $arg"
       putidx $idx "Changed BNC Server password to: $setarg"
       set bncserv-pass $setarg
       ini_write $mainini bncserv pass $setarg
      } else {
       putidx $idx "[cont -u] bncserv set pass <password>"
      }
     }
     "help" {
      putcmdlog "#$hand# bncserv $arg"
      putidx $idx "Displaying BNC Server setting command help:"
      putidx $idx " .bncserv set port <port #>   = Changes the BNC Server port to listen for connections on"
      putidx $idx " .bncserv set maxusers <#>    = Changes the MAX number of people to allow to connect to BNC Server"
      putidx $idx " .bncserv set pass <password> = Changes the BNC Server password needed for login"
     }
     default {
      putidx $idx "[cont -u] bncserv set <variable/help> \[setting\]"
     }
    }
   }
   "help" {
    putcmdlog "#$hand# bncserv $arg"
    putidx $idx "Displaying BNC Server main command help:"
    putidx $idx " .bncserv on   = Turns the BNC Server on"
    putidx $idx " .bncserv off  = Turns the BNC Server off"
    putidx $idx " .bncserv info = Shows you settings and status of the BNC Server"
    putidx $idx " .bncserv set  = Sets a setting to what you prefer"
    putidx $idx " .bncserv help = Shows you this screen"
   }
   default {
    putidx $idx "[cont -e] command: bncserv <on/off/info/set/help> \[arguments\]"
   }
  }
 }
 return 0
}
if {${bncserv-status} == "on"} {
 catch {listen ${bncserv-port} script bncserv_conn} bncserv-catch
 putlog "Listening on port ${bncserv-catch} for incoming BNC Server connections"
}
foreach i [array names bncserv_data] {
 if {[valididx $i]} {
  putdcc $i "NOTICE AUTH :[cont -w] Rehashing system..."
 } else {
  bncserv_kill $i
 }
}
proc bncserv_kill {bncserv_idx} {
 global bncserv_in bncserv_out bncserv_data bncserv_host
 if {[info exists bncserv_host($bncserv_idx)]} {
  bncserv_log "User $bncserv_host($bncserv_idx) exiting"
  unset bncserv_host($bncserv_idx)
 } else {
  bncserv_log "Unknown user exiting"
 }
 if {[info exists bncserv_in($bncserv_idx)]} {
  if {[info exists bncserv_out($bncserv_in($bncserv_idx))]} {
   unset bncserv_out($bncserv_in($bncserv_idx))
  }
  unset bncserv_in($bncserv_idx)
 }
 if {[info exists bncserv_data($bncserv_idx)]} {
  unset bncserv_data($bncserv_idx)
 }
 if {[valididx $bncserv_idx]} {
  catch {killdcc $bncserv_idx} 0
 }
}
proc bncserv_conn {idx} {
 global bncserv_data bncserv_host bncserv-maxusers bncserv-pass bncserv-version
 if {([llength [array names bncserv_data]] >= ${bncserv-maxusers}) && (${bncserv-maxusers} != 0)} {
  killdcc $idx
 } else {
  if {${bncserv-pass} != ""} {
   putdcc $idx "NOTICE AUTH :[cont -lf]"
   putdcc $idx "NOTICE AUTH : BNC Server feature"
   putdcc $idx "NOTICE AUTH :Type: /QUOTE PASS <password>"
   set bncserv_data($idx) "0 0"
  } else {
   putdcc $idx "NOTICE AUTH :Type: /QUOTE CONN <server> \[port\]"
   set bncserv_data($idx) "1 0"
  }
  foreach i [dcclist] {
   if {[lindex $i 0] == $idx} {
    set bncserv_host($idx) [lindex $i 2]
   }
  }
  bncserv_log "User $bncserv_host($idx) connected"
  control $idx bncserv_in
 }
}
proc bncserv_in {idx arg} {
 global bncserv_in bncserv_out bncserv_data bncserv_host bncserv-pass
 if {($arg == "") || ([string tolower [lindex $arg 0]] == "quit")} {
  bncserv_kill $idx
  return 0
 }
 if {![lindex $bncserv_data($idx) 0]} {
  if {([string tolower [lindex $arg 0]] == "pass") && (${bncserv-pass} != "")} {
   if {[lindex $arg 1] == ""} {
    putdcc $idx "NOTICE AUTH :[cont -u] /QUOTE PASS <password>"
   } else {
    if {[lindex $arg 1] == ${bncserv-pass}} {
     set bncserv_data($idx) "1 0"
     putdcc $idx "NOTICE AUTH :[sb]\[[sb][su]CNT[su][sb]\][sb] Password correct - Type /QUOTE CONN <server> \[port\]"
    } else {
     putdcc $idx "NOTICE AUTH :[cont -e] Password incorrect - Try again"
    }
   }
  }
 } else {
  if {([string tolower [lindex $arg 0]] == "conn") && ([lindex $bncserv_data($idx) 1] == 0)} {
   if {[lindex $arg 1] == ""} {
    putdcc $idx "NOTICE AUTH :[cont -u] /QUOTE CONN <server> \[port\]"
   } else {
    set bounce_server [lindex $arg 1]
    set bounce_serverport [lindex $arg 2]
    if {$bounce_serverport == ""} {
     set bounce_serverport 6667
    }
    if {[info exists bncserv_in($idx)]} {
     if {[info exists bncserv_out($bncserv_in($idx)]} {
      unset bncserv_out($bncserv_in($idx))
     }
     if {[valididx $bncserv_in($idx)]} {
      catch {killdcc $bncserv_in($idx)} 0
     }
     unset bncserv_in($idx)
    }
    putdcc $idx "NOTICE AUTH :Connecting to $bounce_server:$bounce_serverport"
    putdcc $idx "NOTICE AUTH :If the connection hangs (mIRC users), type /QUOTE REGISTER <your-nickname> <your real name field>"
    bncserv_log "User $bncserv_host($idx) connecting to $bounce_server:$bounce_serverport"
    catch {set bounce_temp [connect $bounce_server $bounce_serverport]} bounce_temp
    if {![catch {expr $bounce_temp}]} {
     set bncserv_in($idx) $bounce_temp
     set bncserv_out($bounce_temp) $idx
     set bncserv_data($idx) "[lindex $bncserv_data($idx) 0] $bounce_server"
     control $bounce_temp bncserv_out
     putdcc $idx ":$bounce_server 451 * :You have not registered"
    } else {
     putdcc $idx "NOTICE AUTH :[cont -s] Connection failed - $bounce_server:$bounce_serverport"
    }
   }
  } elseif {([string tolower [lindex $arg 0]] == "bwho") && ([lindex $bncserv_data($idx) 0] == 2)} {
   foreach i [array names bncserv_data] {
    set bounce_temp $i)
    if {[lindex $bncserv_data($i) 0] == 2} {
     lappend bounce_temp - ADMIN -
    } elseif {[lindex $bncserv_data($i) 0] == 1} {
     lappend bounce_temp - USER -
    } else {
     lappend bounce_temp - WAIT -
    }
    lappend bounce_temp $bncserv_host($i)
    if {[lindex $bncserv_data($i) 1] != 0} {
     lappend bounce_temp ([lindex $bncserv_data($i) 1])
    } else {
     lappend bounce_temp (Not Connected)
    }
    putdcc $idx "NOTICE AUTH :$bounce_temp"
   }
  } elseif {([string tolower [lindex $arg 0]] == "bkill") && ([lindex $bncserv_data($idx) 0] == 2)} {
   if {[lindex $arg 1] == ""} {
    putdcc $idx "NOTICE AUTH :[cont -u] /QUOTE BKILL <user#>"
   } else {
    if {([valididx [lindex $arg 1]]) && ([info exists bncserv_data([lindex $arg 1])])} {
     putdcc $idx "NOTICE AUTH :[cont -e] User [lindex $arg 1] killed - $bncserv_host([lindex $arg 1])"
     bncserv_kill [lindex $arg 1]
    } else {
     putdcc $idx "NOTICE AUTH :[cont -e] No such user [lindex $arg 1]"
    }
   }
  } elseif {([string tolower [lindex $arg 0]] == "main") && ([matchattr [lindex $arg 1] m]) && ([lindex $bncserv_data($idx) 0] == 1)} {
   if {[lindex $arg 2] == ""} {
    putdcc $idx "NOTICE AUTH :[cont -u] /QUOTE MAIN <handle> <password>"
   } else {
    if {[passwdok [lindex $arg 1] [lindex $arg 2]]} {
     set bncserv_data($idx) "2 [lindex $bncserv_data($idx) 1]"
     bncserv_log "User $bncserv_host($idx) gained admin access ([lindex $arg 1])"
    } else {
     putdcc $idx "NOTICE AUTH :[cont -e] Password incorrect - Try again"
    }
   }
  } elseif {[lindex $bncserv_data($idx) 1] != 0} {
   if {[string tolower [lindex $arg 0]] == "register"} {
    if {[lindex $arg 1] == ""} {
     putdcc $idx "NOTICE AUTH :[cont -u] /QUOTE REGISTER <nick> [ircname...]"
    } else {
     catch {
      putdcc $bncserv_in($idx) "NICK [lindex $arg 1]"
      putdcc $bncserv_in($idx) "USER [lindex $arg 1] +i [lindex $arg 1] :[lrange $arg 2 end]"
     } 0
    }
   } else {
    catch {putdcc $bncserv_in($idx) $arg} 0
   }
  }
 }
}
proc bncserv_out {idx arg} {
 global bncserv_in bncserv_out bncserv_data bncserv_host
 if {($arg == "") || ([string tolower [lindex $arg 0]] == "error")} {
  if {[info exists bncserv_out($idx)]} {
   if {[info exists bncserv_data($bncserv_out($idx))]} {
    bncserv_log "User $bncserv_host($bncserv_out($idx)) disconnecting from server"
    if {[valididx $bncserv_out($idx)]} {
     putdcc $bncserv_out($idx) "NOTICE AUTH :[cont -s] Disconnected from server \[[lrange $arg 4 end]\] - Type /QUOTE CONN <server> \[port\]"
     set bncserv_data($bncserv_out($idx)) "[lindex $bncserv_data($bncserv_out($idx)) 0] 0"
     if {[info exists bncserv_in($bncserv_out($idx))]} {
      unset bncserv_in($bncserv_out($idx))
     }
     unset bncserv_out($idx)
    } else {
     bncserv_kill $bncserv_out($idx)
    }
   } else {
    bncserv_kill $bncserv_out($idx)
   }
  } else {
   catch {killdcc $idx} 0
  }
 } else {
  catch {putdcc $bncserv_out($idx) $arg} 0
 }
}
proc bncserv_log {arg} {
 global bncserv_data
 putlog "*** BNC Server: $arg"
 foreach i [array names bncserv_data] {
  if {([valididx $i]) && ([lindex $bncserv_data($i) 0] == 2)} {
   putdcc $i "NOTICE AUTH :[sb]BNC Server[sb]: $arg"
  }
 }
}
lappend loadedtcls "BNC Server"
set sb_status "[ini_read $mainini superbitch chans]"
set sb_chans "[ini_read $mainini superbitch chans]"
if {($sb_status == ";") || ($sb_status == "")} {
 set sl_status "off"
 ini_remove $mainini superbitch status
 ini_remove $mainini superbitch chans
} else {
 set sb_status "on"
 ini_remove $mainini superbitch status
}
if {($sb_chans == ";") || ($sb_chans == "") || ($sb_chans == "none")} {
 set sb_status "off"
 set sb_chans "none"
}
set newsb_chans ""
foreach sbchan $sb_chans {
 if {[validchan $sbchan]} {
  lappend newsb_chans [string tolower $sbchan]
 }
}
set sb_chans $newsb_chans
unset newsb_chans
if {$sb_chans == ""} { set sb_chans "none" }
ini_remove $mainini superbitch chans
ini_write $mainini superbitch status $sb_status
ini_write $mainini superbitch chans $sb_chans
set sb_canop "m|m"
set sb_canopflags "o|o"
set sb_canopany "b|-"
set sb_remove 1
set sb_note $admins
set sb_checkop 0
proc sb_bitch {nick uhost hand chan mode opped} {
 global botnick sb_chans sb_canop sb_canopany sb_canopflags sb_checkop sb_note sb_remove sb_status
 if {$sb_status == "off"} { return 0 }
 if {$mode == "+o"} {
  if {$nick != $botnick} {
   if {((($opped != $botnick) && ($nick != $opped) && ([onchan $nick $chan]) && (![wasop $opped $chan])) && (($sb_chans == "") || ([lsearch -exact $sb_chans [string tolower $chan]] != -1)))} {
    if {![matchattr [nick2hand $opped $chan] $sb_canopflags $chan]} {
     if {(($sb_canopany == "") || (![matchattr $hand $sb_canopany $chan]))} {
      if {![matchchanattr [nick2hand $opped] m|m $chan]} {
       pushmode $chan -o $opped
      }
      pushmode $chan -o $nick
      if {(($sb_remove) && ([validuser $hand]) && ([matchattr $hand o|o $chan]) && (![matchattr $hand m]))} {
       chattr $hand -o+d|-o+d $chan
      }
     }
    } else {
     if {((($sb_canopany == "") || (![matchattr $hand $sb_canopany $chan])) && (($sb_canop == "") || (![matchattr $hand $sb_canop $chan])))} {
      if {![matchchanattr [nick2hand $opped] m|m $chan]} {
       pushmode $chan -o $opped
      }
      pushmode $chan -o $nick
      if {(($sb_remove) && ([validuser $hand]) && ([matchattr $hand o|o $chan]) && (![matchattr $hand m]))} {
       chattr $hand -o+d|-o+d $chan
      }
     }
    }
   }
  } else {
   if {(($sb_checkop) && (![matchattr [nick2hand $opped $chan] o|o $chan]))} {
    pushmode $chan -o $opped
    putlog "[cont -s] Opped non +o user $opped on $chan - reversing."
   }
  }
 }
 return 0
}
set sb_chans [split [string tolower $sb_chans]] ; set sb_note [split $sb_note]
proc dcc_superbitch {hand idx arg} {
 global sb_status sb_chans mainini
 set cmd [string tolower [lindex $arg 0]]
 set arg [string tolower [lindex $arg 1]]
 if {$cmd == ""} {
  putidx $idx "[cont -u] superbitch <on/off/status/addchan/delchan/clear> \[Channel to Add/Remove\]"
 } else {
  switch -exact $cmd {
   "on" {
    if {$sb_status == "on"} {
     putidx $idx "[cont -e] superbitch is already on"
    } else {
     putcmdlog "#$hand# superbitch $cmd $arg"
     set sb_status on
     ini_write $mainini superbitch status on
     putidx $idx "Superbitch now turned on!"
     putidx $idx " -> You must add any channels you want superbitch to affect manually."
     putallbots "bot_linked superbitch $sb_status $sb_chans"
     if {$sb_chans != "none"} {
      foreach sb_chan $sb_chans {
       channel set $sb_chan +bitch
      }
     }
     putidx $idx "  |-> ... Updated superbitch settings on all bots."
    }
    return 0
   }
   "off" {
    if {$sb_status == "off"} {
     putidx $idx "[cont -e] superbitch is already off"
    } else {
     putcmdlog "#$hand# superbitch $cmd $arg"
     set sb_status off
     ini_write $mainini superbitch status off
     putidx $idx "Superbitch now turned off!"
     putidx $idx " -> Superbitch channels will be saved if superbitch turned back on"
     putallbots "bot_linked superbitch $sb_status $sb_chans"
     putidx $idx "  |-> ... Updated superbitch settings on all bots."
     foreach sb_chan $sb_chans {
      channel set $sb_chan -bitch
     }
    }
    return 0
   }
   "status" {
    putcmdlog "#$hand# superbitch $cmd $arg"
    putidx $idx "Status | Channels Active On"
    putidx $idx "---------------------------------------------------"
    putidx $idx "[fstring $sb_status 6] | $sb_chans"
    return 0
   }
   "addchan" {
    if {$arg == ""} {
     putidx $idx "[cont -u] superbitch $cmd <#channel>"
     return 0
    }
    if {![validchan $arg]} {
     putidx $idx "[cont -e] $arg isn't a valid channel"
     return 0
    }
    if {[lsearch [string tolower $sb_chans] $arg] != "-1"} {
     putidx $idx "[cont -e] Superbitch is already active on $arg"
    } else {
     putcmdlog "#$hand# superbitch $cmd $arg"
     putidx $idx "Activating superbitch on $arg\..."
     if {$sb_chans == "none"} {
      set sb_chans $arg
     } else {
      lappend sb_chans $arg
     }
     ini_remove $mainini superbitch chans
     ini_write $mainini superbitch chans $sb_chans
     foreach sb_chan $sb_chans {
      channel set $sb_chan +bitch
     }
     putidx $idx " Done."
     putidx $idx "Status | Channels Active On"
     putidx $idx "---------------------------------------------------"
     putidx $idx "[fstring $sb_status 6] | $sb_chans"
     putallbots "bot_linked superbitch $sb_status $sb_chans"
     putidx $idx "  |-> ... Updated superbitch settings on all bots."
    }
    return 0
   }
   "delchan" {
    if {$arg == ""} {
     putidx $idx "[cont -u] superbitch $cmd <#channel>"
     return 0
    }
    if {[lsearch [string tolower $sb_chans] $arg] == "-1"} {
     putidx $idx "[cont -e] Superbitch isn't active on $arg"
    } else {
     putcmdlog "#$hand# superbitch $cmd $arg"
     putidx $idx "De-Activating superbitch on $arg\..."
     set newsb_chans ""
     foreach sbchan [string tolower $sb_chans] {
      if {$sbchan != $arg} {
       lappend newsb_chans $sbchan
      }
     }
     if {$newsb_chans == ""} {
      set sb_chans "none"
     } else {
      set sb_chans $newsb_chans
     }
     ini_remove $mainini superbitch chans
     ini_write $mainini superbitch chans $sb_chans
     foreach sb_chan $sb_chans {
      channel set $sb_chan -bitch
     }
     putidx $idx " Done."
     putidx $idx "Status | Channels Active On"
     putidx $idx "---------------------------------------------------"
     putidx $idx "[fstring $sb_status 6] | $sb_chans"
     putallbots "bot_linked superbitch $sb_status $sb_chans"
     putidx $idx "  |-> ... Updated superbitch settings on all bots."
    }
    return 0
   }
   "clear" {
    putcmdlog "#$hand# superbitch $cmd $arg"
    putidx $idx "Clearing all channels superbitch is active on..."
    set sb_status off
    foreach sb_chan $sb_chans {
     channel set $sb_chan -bitch
    }
    set sb_chans "none"
    ini_remove $mainini superbitch status
    ini_remove $mainini superbitch chans
    ini_write $mainini superbitch status "off"
    ini_write $mainini superbitch chans $sb_chans
    putidx $idx " Done."
    putidx $idx "Status | Channels Active On"
    putidx $idx "---------------------------------------------------"
    putidx $idx "[fstring $sb_status 6] | $sb_chans"
    putallbots "bot_linked superbitch $sb_status $sb_chans"
    putidx $idx "  |-> ... Updated superbitch settings on all bots."
    return 0
   }
  }
  putidx $idx "[cont -e] First argument must be one of on/off/status/addchan/delchan"
 }
 return 0
}
lappend loadedtcls "Superbitch Channel protection"
set CTCP_Allow "ACTION CHAT"
set CTCP_FloodCount [lindex [split $CTCP_FloodProt :] 0]
set CTCP_FloodTime [lindex [split $CTCP_FloodProt :] 1]
set CTCP_Count 0
set CTCP_StartTime 0
proc ctcp_floodprot { from type text } {
 global botnick
 set text [string trimleft [string range $text \
                              [string first " " $text] end] ": "]
 if {![string match "\001*\001" $text]} {
   return 0
 }
 global CTCP_Allow
 set text [string trim $text "\001"]
 set cmd [string range $text 0 [expr [string first " " $text] - 1]]
 set parms [string range $text [expr [string first " " $text] + 1] end]
 if {$cmd == ""} { set cmd "$text" ; set parms "" }
 if {[lsearch -exact $CTCP_Allow [string toupper $cmd]] >= 0} {
  return 0
 }
 global CTCP_Count CTCP_StartTime
 global CTCP_FloodCount CTCP_FloodTime
 if {[unixtime] - $CTCP_StartTime >= $CTCP_FloodTime} {
  set CTCP_StartTime [unixtime]
  set CTCP_Count 1
  return 0
 } elseif {$CTCP_Count < $CTCP_FloodCount} {
  incr CTCP_Count
  return 0
 }
 set nick [lindex [split $from "!"] 0]
 set uhost [lindex [split $from "!"] 1]
 putlog "[cont -s] CTCP Exceeded \($text\): $nick \($uhost\) -> not replied"
 return 1
}
lappend loadedtcls "CTCP Flood Protection"
proc dcc_remind {hand idx arg} {
 set cmd [string tolower [lindex $arg 0]]
 set when [string tolower [lindex $arg 1]]
 set msg [lrange $arg 2 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] remind add <# of minutes> <reminder message>"
  putidx $idx "       remind remove"
 } else {
  switch -exact $cmd {
   "add" {
    if {$msg == ""} {
     putidx $idx "[cont -u] remind add <# of minutes> <Message>"
     return 0
    }
    if {![isnumber $when]} {
     putidx $idx "[cont -e] $when isn't a number"
     return 0
    }
    putcmdlog "#$hand# remind $cmd $when **Message**"
    timer $when "remind [string tolower $hand] [unixtime] \"$msg\""
    putidx $idx " Reminding $hand in $when\mins: $msg"
    return 0
   }
   "remove" {
    putcmdlog "#$hand# remind $cmd $when $msg"
    putidx $idx " Showing you a list of your reminders (if any):"
    set bah 0
    set num 1
    foreach timer [timers] {
     set a [lindex $timer 1]
     set b [lindex $timer 2]
     if {[lindex $a 0] == "remind"} {
      if {[lindex $a 1] == [string tolower $hand]} {
       set time "[goodt [expr [unixtime] - [lindex $a 2]]]"
       putidx $idx " :: #$num\. (sent $time ago) [lrange $a 3 end]"
       incr num
       killtimer $b
       set bah 1
      }
     }
    }
    if {$bah} {
     putidx $idx " "
     putidx $idx " All reminders removed!"
    } else {
     putidx $idx " No reminders waiting for you to remove."
    }
    return 0
   }
  }
  putidx $idx "[cont -e] first argument must be one of add/remove/help"
 }
 return 0
}
proc remind {hand when msg} {
 global bname
 set time "[goodt [expr [unixtime] - $when]]"
 set bah 0
 foreach dccchat [dcclist CHAT] {
  set dccuser [string tolower [lindex $dccchat 1]]
  set dccidx [lindex $dccchat 0]
  if {$dccuser == $hand} {
   putidx $dccidx " "
   putidx $dccidx "[sb]!![sb]- [su]Reminder[su] -[sb]!![sb]"
   putidx $dccidx " You have the following reminder which was sent $time ago"
   putidx $dccidx " :: $msg"
   putidx $dccidx " "
   set bah 1
  }
 }
 if {!$bah} {
  sendnote $bname $hand "[sb]Reminder[sb]: You sent a reminder [su]$time[su] ago but you wern't on the partyline... Reminder following"
  sendnote $bname $hand " :: $msg"
 }
 return 0
}
lappend loadedtcls "Reminder"
proc dcc_hump {hand idx arg} {
 global humpinprogress
 if {$arg == ""} {
  putidx $idx "[cont -u] hump <who?>"
 } else {
  if {![info exists humpinprogress]} {
   set arg [join [split [split $arg "\]"] "\["] ""]
   putcmdlog "#$hand# hump $arg"
   dccbroadcast "[cont -w] [sb]$hand[sb] is trying to hump [sb]$arg"
   dccbroadcast "[sb]HUMP SHIELD[sb] at [su]100%[su]"
   set humpinprogress 1
   utimer 1 "timer_hump \"0 100 $hand $arg\""
  } else {
   putidx $idx "[cont -e] Hump is already in progress"
  }
 }
 return 0
}
proc timer_hump {arg} {
 global humpinprogress
 set times [lindex $arg 0]
 set percent [lindex $arg 1]
 set hand [lindex $arg 2]
 set who [lrange $arg 3 end]
 if {!$percent} { set hump 0 } else { set hump [rand $percent] }
 set damage [expr $percent - $hump]
 set bah $damage
 if {$damage > 74} {
  set damage "massive critical hump ($damage\% damage)"
 } else {
  if {$damage > 49} {
   set damage "critical hump ($damage\% damage)"
  } else {
   if {$damage > 24} {
    set damage "wicked hump ($damage\% damage)"
   } else {
    if {$damage > 14} {
     set damage "nice hump ($damage\% damage)"
    } else {
     set damage "hump ($damage\% damage)"
    }
   }
  }
 }
 if {($times != "5") && ($hump > 0)} {
  set percent [expr $percent - $bah]
  if {$percent < 0} { set percent 0 }
  dccbroadcast "[sb]HUMP[sb] - Bruised by a $damage\. Hump shield down to $percent\%"
  set timer [expr $times + 1]
  utimer 1 "timer_hump \"$times $percent $hand $who\""
 } else {
  dccbroadcast "[sb]HUMP[sb] - Bruised by a $damage\. Hump shield failing..... DOWN!"
  dccbroadcast "Prepare for impact..."
  dccbroadcast "$hand is now humping $who\..."
  dccbroadcast "Holy fuck!"
  unset humpinprogress
 }
}
proc dcc_picknumbers {hand idx arg} {
 set num [lindex $arg 0]
 set range [lindex $arg 1]
 if {$range == ""} {
  putidx $idx "[cont -u] picknumbers <# of numbers> <from # - to #>"
  putidx $idx "        IE: picknumbers 6 0-49"
 } else {
  if {[isnumber $num]} {
   set from [lindex [split $range "-"] 0]
   set to [lindex [split $range "-"] 1]
   if {[isnumber $from]} {
    if {[isnumber $to]} {
     putcmdlog "#$hand# picknumbers $arg"
     putidx $idx "Generating a number list of $num numbers ranging from $from to $to\..."
     set numbers ""
     while {[llength $numbers] != $num} {
      set randnum [rand $to]
      if {$randnum < $from} {
       while {$randnum < $from} {
        set randnum [rand $to]
       }
      }
      lappend numbers $randnum
     }
     putidx $idx "Done. Placing them in order..."
     set a ""
     while {[llength $a] != [llength $numbers]} {
      set b $to
      foreach num $numbers {
       if {$num < $b} {
        if {[lsearch $a $num] == "-1"} {
         set b $num
        }
       }
      }
      lappend a $b
     }
     putidx $idx "Numbers: $a"
    } else {
     putidx $idx "[cont -e] $to isn't a number"
    }
   } else {
    putidx $idx "[cont -e] $from isn't a number"
   }
  } else {
   putidx $idx "[cont -e] $num isn't a number"
  }
 }
 return 0
}
lappend loadedtcls "Entertainment"
set idle_status [ini_read $mainini idlestats status]
set idle_statstimer [ini_read $mainini idlestats timer]
if {$idle_status == ";"} {
 set idle_status "on"
 set idle_statstimer 20
 ini_write $mainini idlestats status on
 ini_write $mainini idlestats timer 20
}
proc idle_stats {} {
 global lockedchans admins server ver serverlag mainini uptime
 if {[ini_read $mainini idlestats status] == "off"} { return 0 }
 set chans [llength [channels]]
 set bots [llength [bots]]
 if {$lockedchans == ""} { set lchans 0 } else { set lchans [llength $lockedchans] }
 if {$server == ""} {
  set lag "Offline"
 } else {
  set lag "$serverlag\s"
 }
 set up [goodt [expr [unixtime] - $uptime]]
 putlog "[su]([su]Chans: Total-[sb]$chans[sb] Locked-[sb]$lchans[sb][su])-([su]Uptime: [sb]$up[sb][su])-([su]Bots: [sb]$bots[sb][su])-([su]Lag: [sb]$lag[sb][su])[su]"
 timer [ini_read $mainini idlestats timer] idle_stats
}
if {([lsearch [timers] *idle_stats*] == "-1") && ($idle_status == "on")} {
 timer [ini_read $mainini idlestats timer] idle_stats
}
lappend loadedtcls "Idle-Stats for partyline"
proc dcc_mclearqueue {hand idx arg} {
 set arg [lindex $arg 0]
 if {$arg == ""} {
  putidx $idx "[cont -u] mclearqueue <mode|server|help|all>"
 } else {
  if {($arg == "mode") || ($arg == "server") || ($arg == "help") || ($arg == "all")} {
   clearqueue $arg
   putallbots "bot_mclearqueue $arg $hand"
   putcmdlog "#$hand# mclearqueue $arg"
  } else {
   putidx $idx "[cont -e] Invalid argument. Must be one of 'mode server help all'"
  }
 }
 return 0
}
proc mclearqueue_bot {frombot cmd arg} {
 clearqueue [lindex $arg 0]
 putlog "[cont -s] Ordered to clearqueue-([lindex $arg 0]) by [lindex $arg 1]@$frombot"
 return 0
}
proc dcc_tcl {hand idx arg} {
 global admins
 if {[isadmin $hand]} {
  *dcc:tcl $hand $idx $arg
 } else {
  putidx $idx "[cont -e] No authorization"
 }
 return 0
}
proc dcc_set {hand idx arg} {
 global admins
 if {[isadmin $hand]} {
  *dcc:set $hand $idx $arg
 } else {
  putidx $idx "[cont -e] No authorization"
 }
 return 0
}
proc dcc_chanmode {hand idx arg} {
 if {$arg == ""} {
  putidx $idx "[cont -u] chanmode <#channel> <modes>"
 } else {
  if {[validchan [lindex $arg 0]]} {
   channel set [lindex $arg 0] chanmode [lindex $arg 1]
   putcmdlog "#$hand# chanmode $arg"
   putidx $idx "Channel modes for [lindex $arg 0] are now set to [lindex $arg 1]"
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] isn't a valid channel"
  }
 }
 return 0
}
proc dcc_cycle {hand idx arg} {
 if {$arg == ""} {
  putidx $idx "[cont -u] cycle <#channel>"
 } else {
  if {[validchan [lindex $arg 0]]} {
   if {[string match *k* [lindex [getchanmode [lindex $arg 0]] 0]]} {
    set key [lindex [getchanmode [lindex $arg 0]] 1]
   } else {
    set key ""
   }
   putcmdlog "#$hand# cycle $arg"
   putserv "PART [lindex $arg 0]"
   putserv "JOIN [lindex $arg 0] $key"
  } else {
   putidx $idx "[cont -e] [lindex $arg 0] isn't a valid channel"
  }
 }
 return 0
}
proc proc_botlinked {bot via} {
 global hubname althubname bname lockedchans mainini sb_chans sb_status admins getops cookieops
 if {([ishuboralthub]) && ([string tolower $bot] != [string tolower $hubname])} {
  if {$via == $bname} {
   if {[getuser $bot botfl] != ""} {
    putlog "Sending system info to $bot"
    set leafpass [randstring 10]
    putbot $bot "bot_linked leafpass $leafpass"
    setuser $bot pass $leafpass
    quietsave
    putbot $bot "bot_linked admin $admins"
    putbot $bot "bot_linked linked"
    putbot $bot "bot_linked locked $lockedchans"
    if {[syspass status ""]} {
     putbot $bot "bot_linked syspass on [ini_read $mainini Syspass pass]"
    } else {
     putbot $bot "bot_linked syspass off"
    }
    if {$sb_status == "on"} {
     putbot $bot "bot_linked superbitch on $sb_chans"
    } else {
     putbot $bot "bot_linked superbitch off"
    }
    if {[string tolower $bot] == [string tolower $althubname]} {
     global cl_status cl_chans
     putbot $bot "bot_linked chanlimit $cl_status $cl_chans"
    }
    foreach chan [channels] {
     set chaninfo [ini_read $mainini chaninfo [string tolower $chan]]
     set infochan [ini_read $mainini infochan [string tolower $chan]]
     if {$chaninfo == ";"} { set chaninfo "Unknown Unknown" }
     putbot $bot "bot_linked chanadd $chan $chaninfo"
     putbot $bot "bot_linked chanset $chan [lrange [channel info $chan] 12 end]"
     putbot $bot "bot_linked chanset $chan -autovoice -seen -greet"
     putbot $bot "bot_linked chanmode $chan +[lindex [channel info $chan] 0]"
     if {$infochan != ";"} {
      putbot $bot "bot_infochan add $chan $infochan"
     } else {
      putbot $bot "bot_infochan remove $chan"
     }
    }
    putbot $bot "bot_linked getops msgs $getops(msgs)"
    putbot $bot "bot_linked getops quickops $getops(quickops)"
    putbot $bot "bot_linked cookieops $cookieops"
    putlog "Information sent to $bot"
   }
  }
 }
 if {[string tolower $bot] == [string tolower $althubname]} {
  if {[validuser $via]} {
   if {![ishub]} {
    if {[validuser $althubname]} {
     set altpass [rand 4]
     if {$altpass} {
      set pass [randstring 20]
      putbot $althubname "bot_althublink chpass $pass"
      setuser $althubname pass $pass
     }
     chattr $althubname +of
     setuser $althubname botfl +agp
     putbot $althubname "bot_althublink setmisc"
     quietsave
    }
   }
  }
 }
}
proc althublink_bot {frombot cmd arg} {
 if {[validuser $frombot]} {
  switch -exact [lindex $arg 0] {
   "chpass" {
    setuser $frombot pass [lindex $arg 1]
   }
   "setmisc" {
    chattr $frombot +of
    setuser $frombot botfl +gs
   }
  }
  quietsave
 }
 return 0
}
proc linked_bot {frombot cmd arg} {
 global mainini lockedchans sb_status sb_chans getops
 set what [lindex $arg 0]
 set chan [lindex $arg 1]
 set info [lrange $arg 2 end]
 if {(![validuser $frombot]) || ([getuser $frombot botfl] == "") || ([ishub])} {
  return 0
 }
 switch -exact $what {
  "admin" {
   global admins
   set admins "[lrange $arg 1 end]"
   ini_remove $mainini admin users
   ini_write $mainini admin users $admins
  }
  "linked" {
   putlog "Receiving system info from $frombot"
  }
  "leafpass" {
   setuser $frombot pass [lindex $arg 1]
   quietsave
  }
  "locked" {
   set lockedchans "[lrange $arg 1 end]"
   ini_remove $mainini Locked chans
   ini_write $mainini Locked chans $lockedchans
  }
  "syspass" {
   if {[lindex $arg 1] == "on"} {
    ini_write $mainini Syspass status on
    ini_write $mainini Syspass pass [lindex $arg 2]
   } else {
    if {[syspass status ""]} {
     ini_write $mainini Syspass status off
     ini_remove $mainini Syspass pass
    }
   }
  }
  "superbitch" {
   if {$chan == "on"} {
    set sb_status "on"
    set sb_chans $info
    foreach sb_chan $sb_chans {
     if {[validchan $sb_chan]} {
      channel set $sb_chan +bitch
     }
    }
    ini_remove $mainini superbitch status
    ini_remove $mainini superbitch chans
    ini_write $mainini superbitch status $sb_status
    ini_write $mainini superbitch chans $sb_chans
   } else {
    set sb_status "off"
    foreach sb_chan $sb_chans {
     if {[validchan $sb_chan]} {
      channel set $sb_chan -bitch
     }
    }
    set sb_chans "none"
    ini_remove $mainini superbitch status
    ini_remove $mainini superbitch chans
    ini_write $mainini superbitch status $sb_status
    ini_write $mainini superbitch chans $sb_chans
   }
  }
  "chanadd" {
   if {![validchan $chan]} {
    channel add $chan
    if {$info == ""} {
     ini_write $mainini chaninfo [string tolower $chan] "$info"
    }
    channel set $chan need-op "get op $chan"
    channel set $chan need-invite "get invite $chan"
    channel set $chan need-unban "get unban $chan"
    channel set $chan need-limit "get limit $chan"
    channel set $chan need-key "get key $chan"
   }
  }
  "chanset" {
   foreach setting $info {
    if {$setting != "-inactive" && $setting != "+inactive"} {
    channel set $chan $setting
    }
   }
   channel set $chan -autovoice
  }
  "chanmode" {
   channel set $chan chanmode $info
  }
  "chanlimit" {
   global cl_status cl_chans cl_timer
   set cl_status [lindex $arg 1]
   set cl_chans [lrange $arg 2 end]
   ini_write $mainini chanlimit status $cl_status
   ini_write $mainini chanlimit chans $cl_chans
   if {$cl_status == "off"} {
    kill_timer cl_dolimit
   } else {
    if {[lsearch [timers] *cl_dolimit*] == "-1"} {
     timer $cl_timer cl_dolimit
    }
   }
  }
  "getops" {
   set cmd [lindex $arg 1]
   set switch [lindex $arg 2]
   set getops($cmd) $switch
   ini_write $mainini getops $cmd $switch
  }
  "cookieops" {
   global cookieops
   set status [lindex $arg 1]
   set cookieops $status
   ini_write $mainini cookieops status $status
  }
 }
}
proc rawalldo_bot {frombot cmd arg} {
 putlog "[sb]Rawalldo[sb][su]:[su] Received Raw Command ([lrange $arg 1 end]) from $frombot ([lindex $arg 0])"
 putserv "[lrange $arg 1 end]"
}
proc join_autovoice {nick uhost hand chan} {
 if {[validuser $hand] && [matchattr $hand v|v $chan]} {
 if {[ishub]} {
  pushmode $chan +v $nick
 } else {
  if {[isalthub]} {
   utimer [expr [rand 10] + 4] "timer_joinmode voice $chan $nick"
  }
 }
 }
}
proc join_autoop {nick uhost hand chan} {
 if {[validuser $hand] && [matchattr $hand a|a $chan]} {
 if {[ishub]} {
  pushmode $chan +o $nick
 } else {
  utimer [expr [rand 10] + 4] "timer_joinmode autoop $chan $nick"
 }
 }
}
proc timer_joinmode {what chan nick} {
 if {$what == "voice"} {
  if {![isvoice $nick $chan]} {
   pushmode $chan +v $nick
  }
 }
 if {$what == "autoop"} {
  if {![isop $nick $chan]} {
   pushmode $chan +o $nick
  }
 }
}
proc filt_dcc_action {idx text} {
  return ".me [string trim [join [lrange [split $text] 1 end]] \001]"
}
proc filt_telnet_action {idx text} {
  return ".me [join [lrange [split $text] 1 end]]"
}
proc join_checkpass {nick uhost hand chan} {
 global botnick passmsg hubname
 if {[ishuboralthub]} {
  if {([isalthub]) && ([hand2nick $hubname] != "")} {
   return 0
  }
  if {[validuser $hand]} {
   if {![matchattr $hand b]} {
    if {[passwdok $hand ""]} {
     putlog "[sb]Join-Checkpass[sb][su]:[su] $nick (hand: $hand) joined $chan but has no password set. Noticing..."
     putserv "NOTICE $nick :[cont -w] You don't have a password set on me. Your handle: $hand - Global Flags|Channel Flags: [chattr $hand $chan]"
     putserv "NOTICE $nick :-        Please set a password by typing /msg $botnick $passmsg <password>"
    }
   }
  }
 }
}
proc dcc_uptime {hand idx arg} {
 global uptime bname
 set cmd [string tolower [lindex $arg 0]]
 set bot [lindex $arg 1]
 if {$cmd == ""} {
  putidx $idx "[cont -u] uptime <bot/shell> \[allbots/bot\]"
 } else {
  switch -exact $cmd {
   "bot" {
    if {$bot == ""} {
     putcmdlog "#$hand# uptime $arg"
     putidx $idx "Online for [goodt [expr [unixtime] - $uptime]]"
    } else {
     if {$bot == "allbots"} {
      putcmdlog "#$hand# uptime $arg"
      putidx $idx "Online for [goodt [expr [unixtime] - $uptime]]"
      putallbots "bot_uptime bot $hand $idx"
     } else {
      if {[validuser $bot]} {
       if {[islinked $bot]} {
        putcmdlog "#$hand# uptime $arg"
        putidx $idx "Getting $bot\'s bot uptime info..."
        putbot $bot "bot_uptime bot $hand $idx"
       } else {
        putidx $idx "[cont -e] $bot isn't linked"
       }
      } else {
       putidx $idx "[cont -e] $bot isn't a valid bot"
      }
     }
    }
   }
   "shell" {
    if {$bot == ""} {
     putcmdlog "#$hand# uptime $arg"
     putidx $idx "Shell [lrange [exec uptime] 1 end]"
    } else {
     if {$bot == "allbots"} {
      putcmdlog "#$hand# uptime $arg"
      putidx $idx "$bname\: Shell [lrange [exec uptime] 1 end]"
      putallbots "bot_uptime shell $hand $idx"
     } else {
      if {[validuser $bot]} {
       if {[islinked $bot]} {
        putcmdlog "#$hand# uptime $arg"
        putidx $idx "Getting $bot\'s shell uptime info..."
        putbot $bot "bot_uptime shell $hand $idx"
       } else {
        putidx $idx "[cont -e] $bot isn't linked"
       }
      } else {
       putidx $idx "[cont -e] $bot isn't a valid bot"
      }
     }
    }
   }
   default {
    putidx $idx "[cont -u] uptime <bot/shell \[allbots/bot\]>"
   }
  }
 }
 return 0
}
proc uptime_bot {frombot cmd arg} {
 global uptime
 set cmd [lindex $arg 0]
 set hand [lindex $arg 1]
 set idx [lindex $arg 2]
 putlog "[cont -s] $hand@$frombot just read my $cmd uptime info"
 switch -exact $cmd {
  "shell" {
   set msg "Shell [lrange [exec uptime] 1 end]"
  }
  "bot" {
   set msg "Online for [goodt [expr [unixtime] - $uptime]]"
  }
 }
 putbot $frombot "bot_uptimemsg $idx $msg"
 return 0
}
proc uptimemsg_bot {frombot cmd arg} {
 set idx [lindex $arg 0]
 set msg [lrange $arg 1 end]
 putidx $idx "$frombot\: $msg"
 return 0
}
proc dcc_uname {hand idx arg} {
 global bname
 set cmd [string tolower [lindex $arg 0]]
 if {$cmd == ""} {
  putidx $idx "[cont -u] uname <-flag> \[allbots/bot\]"
 } else {
  set bot [string tolower [lindex $arg 1]]
  if {[string index $cmd 0] != "-"} { set cmd "-$cmd" }
  if {$bot == ""} {
   putcmdlog "#$hand# uname $arg"
   putidx $idx "Displaying shell command: (uname $cmd)"
   catch {exec uname $cmd} bah
   putidx $idx "$bah"
  } else {
   if {$bot == "allbots"} {
    putcmdlog "#$hand# uname $arg"
    putidx $idx "Displaying shell command: (uname $cmd)"
    catch {exec uname $cmd} bah
    putallbots "bot_uname $hand $idx $cmd"
    putidx $idx " [fstring $bname\: 15] $bah"
   } else {
    if {![validuser $bot]} {
     putidx $idx "[cont -e] $bot isn't a valid bot"
    } else {
     if {![islinked $bot]} {
      putidx $idx "[cont -e] $bot isn't linked"
     } else {
      putcmdlog "#$hand# uname $arg"
      putidx $idx "Making $bot display shell command: (uname $cmd)"
      putbot $bot "bot_uname $hand $idx $cmd"
     }
    }
   }
  }
 }
 return 0
}
proc uname_bot {frombot cmd arg} {
 set hand [lindex $arg 0]
 set idx [lindex $arg 1]
 set cmd [lindex $arg 2]
 putlog "[cont -s] Displaying shell command (uname $cmd) for $hand@$frombot"
 catch {exec uname $cmd} bah
 putbot $frombot "bot_unamemsg $idx $bah"
 return 0
}
proc unamemsg_bot {frombot cmd arg} {
 putidx [lindex $arg 0] " [fstring $frombot\: 15] [lrange $arg 1 end]"
 return 0
}
proc dcc_shell {hand idx arg} {
 set cmd [string tolower [lindex $arg 0]]
 set arg [lrange $arg 1 end]
 if {$cmd == ""} {
  putidx $idx "[cont -u] shell <command/HELP> \[arguments\]"
 } else {
  if {![isadmin $hand]} {
   putidx $idx "[cont -e] Your not an 'Admin'. Access denied"
   return 0
  }
  switch -exact $cmd {
   "help" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "[sb]Showing[sb] '[su].shell[su]' command [sb]help[sb]:"
    putidx $idx "[sb].shell systemname[sb]   = Shows the shell's system (uname)"
    putidx $idx "[sb].shell freespace[sb]    = Shows the shell's free space left"
    putidx $idx "[sb].shell processes[sb]    = Shows the current processes running"
    putidx $idx "[sb].shell who[sb]          = Shows who's currently logged in"
    putidx $idx "[sb].shell quota[sb]        = Shows your disk quota"
    return 0
   }
   "systemname" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "Displaying you the System Name:"
    catch {exec [exec which uname] -a} a
    putidx $idx "$a"
    return 0
   }
   "freespace" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "Displaying you the shell's free space:"
    catch {exec [exec which df]} a
    putidx $idx "$a"
    return 0
   }
   "processes" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "Displaying the shells current running processes:"
    catch {exec [exec which ps] -x} a
    putidx $idx "$a"
    return 0
   }
   "who" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "Displaying who's logged into the shell:"
    catch {exec [exec which who]} a
    putidx $idx "$a"
    return 0
   }
   "quota" {
    putcmdlog "#$hand# shell $cmd $arg"
    putidx $idx "Showing your disk quota on shell account"
    catch {exec [exec which quota]} a
    putidx $idx "$a"
    return 0
   }
  }
  putidx $idx "[cont -e] Invalid argument. Try '.shell HELP'"
  return 0
 }
}
proc dcc_dccsend {hand idx arg} {
 if {[lindex $arg 1] == ""} {
  putidx $idx "[cont -u] dccsend <file> <Nickname to send file to>"
 } else {
  if {![isadmin $hand]} {
   putidx $idx "[cont -e] Your not an 'Admin'. Access denied!"
  } else {
   putcmdlog "#$hand# dccsend $arg"
   set file [lindex $arg 0]
   set nick [lindex $arg 1]
   putidx $idx "  Sending $file to $nick"
   dccsend $file $nick
  }
 }
 return 0
}
proc dcc_idlestats {hand idx arg} {
 global mainini
 set arg [string tolower $arg]
 if {$arg == ""} {
  putidx $idx "[cont -u] idlestats <on/off/settimer> \[timer in minutes\]"
  return 0
 }
 putcmdlog "#$hand# idlestats $arg"
 set idle_status "[ini_read $mainini idlestats status]"
 set idle_timer "[ini_read $mainini idlestats timer]"
 switch -exact [lindex $arg 0] {
  "on" {
   if {$idle_status == "off"} {
    putidx $idx "Idle-Stats now turned on"
    ini_write $mainini idlestats status on
    set idle_stats "on"
    utimer 5 idle_stats
   } else {
    putidx $idx "Idle-Stats already turned on"
   }
  }
  "off" {
   if {$idle_status == "on"} {
    putidx $idx "Idle-Stats now turned off"
    ini_write $mainini idlestats status off
    kill_timer idle_stats
    set idle_stats "off"
   } else {
    putidx $idx "Idle-Stats already turned off"
   }
  }
  "settimer" {
   if {[lindex $arg 1] == ""} {
    putidx $idx "[cont -u] idlestats settimer <minutes>"
   } else {
    if {[isnumber [lindex $arg 1]]} {
     putcmdlog "#$hand# idlestats $arg"
     ini_write $mainini idlestats timer [lindex $arg 1]
     putidx $idx "Set idlestats timer to display every [lindex $arg 1] minutes"
    } else {
     putidx $idx "[cont -e] [lindex $arg 1] isn't a number"
    }
   }
  }
  default {
   putidx $idx "[cont -u] idlestats <on/off/settimer> \[timer in minutes\]"
  }
 }
 return 0
}
if {[ini_read $mainini chaninfo [string tolower $bchan]] == ";"} {
 ini_write $mainini chaninfo [string tolower $bchan] "$bname [unixtime]"
}
if {[ini_read $mainini infochan [string tolower $bchan]] == ";"} {
 ini_write $mainini infochan [string tolower $bchan] "Main botnet channel. Don't Remove!"
}
proc dcc_mquickops {hand idx arg} {
 global botnick
 set arg [lindex $arg 0]
 if {$arg == ""} {
  putidx $idx "[cont -u] mquickops <#channel>"
 } else {
  putcmdlog "#$hand# mquickops $arg"
  putidx $idx "Making all bots get ops FASSSSST on $arg"
  putallbots "bot_mquickops request $hand $arg"
  if {![botisop $arg]} {
   putallbots "bot_mquickops getop $arg $botnick"
  }
 }
 return 0
}
proc mquickops_bot {frombot cmd arg} {
 global botnick
 set cmd [lindex $arg 1]
 set hand [lindex $arg 1]
 set chan [lindex $arg 2]
 switch -exact $cmd {
  "request" {
   putlog "[cont -s] Ordered to get ops NOW on $chan from $hand@$frombot"
   if {![botisop $chan]} {
    putallbots "bot_mquickops getop $chan $botnick"
   }
  }
  "getop" {
   set chan $hand
   set nick [lindex $arg 2]
   if {[validchan $chan]} {
    if {[botisop $chan]} {
     if {![isop $nick $chan]} {
      putlog "[cont -s] [sb]$frombot[sb] requested ops [su]NOW[su].. Oping!"
      pushmode $chan +o $nick
     }
    }
   }
  }
 }
}
proc quietsave {} {
 global quiet-save
 if {${quiet-save}} {
  save
 } else {
  set quiet-save 1
  save
  set quiet-save 0
 }
}
proc dcc_ping {hand idx arg} {
 global bchan
 if {[matchattr $hand p]} {
  if {![matchattr $hand t]} {
   if {[hand2nick $person] == ""} {
    putidx $idx "[cont -e] I can't see you on any channels I'm in. Try joining $bchan then try again."
   } else {
    putcmdlog "#$hand# ping **HIM/HERSELF**"
    putserv "PRIVMSG [hand2nick $hand] :\001PING\001 [clock clicks]"
   }
  } else {
   set person [lindex $arg 0]
   if {$person == ""} {
    putidx $idx "[cont -u] ping <irc nick>"
   } else {
    putcmdlog "#$hand# ping $arg"
    putidx $idx "Pinging $person and waiting for reply..."
    putserv "PRIVMSG $person :\001PING [clock clicks]\001"
   }
  }
 } else {
  putidx $idx "[cont -e] Access denied to command"
 }
 return 0
}
proc ctcr_pingreply {nick uhost hand dest keyword arg} {
 putlog "Received CTCP [su]PING[su] REPLY from [sb]$nick[sb]\. Calculating:"
 if {([lindex $arg 0] == "") || (![isnumber [lindex $arg 0]])} {
  putlog " -> Erroneous PING reply from $nick\. No reply time specified!"
  return 0
 }
 set time [expr abs([clock clicks] - [lindex $arg 0]) / 1000000.0]
 putlog " -> Replied [sb]$time\s[sb] after [su]PING[su] was sent."
 return 0
}
proc dcc_loadedtcls {hand idx arg} {
 global loadedtcls
 putcmdlog "#$hand# loadedtcls $arg"
 set loadedtcls2 ""
 set loadedtcls3 0
 while {[llength $loadedtcls] != [llength $loadedtcls2]} {
  if {[lindex $loadedtcls [expr $loadedtcls3 + 1]] != ""} {
   lappend loadedtcls2 "[lindex $loadedtcls $loadedtcls3] :-: [lindex $loadedtcls [expr $loadedtcls3 + 1]]"
  } else {
   lappend loadedtcls2 "[lindex $loadedtcls $loadedtcls3]"
  }
  set loadedtcls3 [expr $loadedtcls3 + 2]
 }
 foreach line $loadedtcls2 {
  if {$line != ""} {
   putidx $idx "Loaded: $line"
  }
 }
 return 0
}
proc dcc_dns {hand idx arg} {
 set dns [lindex $arg 0]
 if {$dns == ""} {
  putidx $idx "[cont -u] dns <Nickname/Hostname/IP>"
 } else {
  putcmdlog "#$hand# dns $arg"
  set a 0
  set b 0
  set c $dns
  while {$a != [string length $c]} {
   if {[string index $c $a] == "."} {
    set b 1
   }
   incr a
  }
  if {$b} {
   putidx $idx "Resolving address $dns for you:"
   catch {exec host $dns} bah
   putidx $idx "$bah"
  } else {
   putidx $idx "Resolving address of $dns on IRC..."
   putidx $idx "Getting hostname..."
   if {[getchanhost $dns] == ""} {
    putidx $idx "Error: $dns isn't on any channels I monitor"
   } else {
    set host [lindex [split [getchanhost $dns] @] 1]
    putidx $idx "Got hostname of $dns. Resolving:"
    catch {exec host $host} bah
    putidx $idx "$bah"
   }
  }
 }
 return 0
}
proc dcc_putserv {hand idx arg} {
 global server
 if {$arg == ""} {
  putidx $idx "[cont -u] putserv <server stuff>"
 } else {
  if {[isadmin $hand]} {
   putcmdlog "#$hand# putserv $arg"
   putserv $arg
   putidx $idx "Sent server stuff to [lindex [split $server :] 0]"
  } else {
   putidx $idx "[cont -e] Your not authorized to use this command"
  }
 }
 return 0
}
proc dcc_limit {hand idx arg} {
 set chan [lindex $arg 0]
 set what [lindex $arg 1]
 if {$what == ""} {
  putidx $idx "[cont -u] limit <#channel> <#/+#/-#/off>"
 } else {
  if {[validchan $chan]} {
   if {[botonchan $chan]} {
    if {[botisop $chan]} {
     set a [string index $what 0]
     set b [string range $what 1 end]
     if {[isnumber $b]} {
      if {($a != "+") || ($a != "-")} {
       putcmdlog "#$hand# limit $arg"
       putidx $idx "Changing the limit on $chan to $what"
       putserv "MODE $chan +l $what"
      } else {
       if {[string match *l* [getchanmode $chan]]} {
        set c [lindex [getchanmode $chan] [llength [getchanmode $chan]]]
        if {$a == "+"} {
         putcmdlog "#$hand# limit $arg"
         putidx $idx "Setting the limit $what so that the limit is now [expr $c + $b] on $chan"
         putserv "MODE $chan +l [expr $c + $b]"
        } else {
         if {[expr $c - $b] > 0} {
          putcmdlog "#$hand# limit $arg"
          putidx $idx "Setting the limit $what so that the limit is now [expr $c - $b] on $chan"
          putserv "MODE $chan +l [expr $c - $b]"
         } else {
          putidx $idx "[cont -e] Changing the limit $what will make it [expr $c - $b], which isn't allowed."
         }
        }
       }
      } else {
       putidx $idx "[cont -e] $chan doesn't have a limit set!"
      }
     } else {
      putidx $idx "[cont -e] $what isn't a number!"
     }
    } else {
     putidx $idx "[cont -e] I'm not currently op'd on $chan"
    }
   } else {
    putidx $idx "[cont -e] I'm not currently on $chan"
   }
  } else {
   putidx $idx "[cont -e] $chan doesn't exist"
  }
 }
 return 0
}
proc dcc_getkey {hand idx arg} {
 set chan [lindex $arg 0]
 if {$chan == ""} {
  putidx $idx "[cont -u] getkey <#channel>"
 } else {
  if {[validchan $chan]} {
   if {[matchchanattr $hand o|f $chan]} {
    putcmdlog "#$hand# getkey $arg"
    putidx $idx "Retrieving key of $chan for you..."
    set a [getchanmode $chan]
    set key "There is no key set on $chan"
    if {[lsearch [lindex $a 0] *k*] != "-1"} {
     set key "The key for $chan is: [lindex $a 1]"
    }
    putidx $idx "$key"
   } else {
    putidx $idx "[cont -e] No authorization. You need at least global +o or channel +f"
   }
  } else {
   putidx $idx "[cont -e] $chan isn't a valid channel"
  }
 }
 return 0
}
set cookieops [ini_read $mainini cookieops status]
if {$cookieops == ";"} {
 set cookieops 1
 ini_write $mainini cookieops status $cookieops
}
proc dcc_cookieops {hand idx arg} {
 global cookieops mainini
 if {$arg == ""} {
  putidx $idx "[cont -u] cookieops <on/off>"
 } else {
  switch -exact $arg {
   "on" {
    putcmdlog "#$hand# cookieops $arg"
    putidx $idx "Turned +o-b security ops [sb]on"
    set cookieops 1
    ini_write $mainini cookieops status 1
    putallbots "bot_linked cookieops $cookieops"
   }
   "off" {
    putcmdlog "#$hand# cookieops $arg"
    putidx $idx "Turned +o-b security ops [sb]off"
    set cookieops 0
    ini_write $mainini cookieops status 0
    putallbots "bot_linked cookieops $cookieops"
   }
   default {
    putidx $idx "[cont -u] cookieops <on/off>"
   }
  }
 }
}
proc mode_adminprot {nick uhost hand chan mode victim} {
 global botnick hubname
 if {$nick != $botnick} {
 if {$mode == "-o"} {
  if {[isadmin [nick2hand $victim]]} {
   if {($hand == "*") || (![matchattr $hand m])} {
    if {$nick != $victim} {
     if {([ishub]) || (([isalthub]) && (![onchan [hand2nick $hubname] $chan]))} {
      if {[botisop $chan]} {
       putquick "KICK $chan $nick :Illegal deop of $victim"
       putquick "NOTICE $victim :Punished $nick for deoping you on $chan"
      }
     }
    }
   }
  }
 }
 }
}
proc kick_adminprot {nick uhost hand chan target reason} {
 global botnick hubname
 if {$nick != $botnick} {
 if {[isadmin [nick2hand $target]]} {
  if {($hand == "*") || (![matchattr $hand m])} {
   if {$nick != $target} {
    if {[ishuboralthub]} {
     if {([ishub]) || (([isalthub]) && (![onchan [hand2nick $hubname] $chan]))} {
      if {[botisop $chan]} {
       putquick "KICK $chan $nick :Illegal kick of $target"
       putquick "NOTICE $target :Punished $nick for kicking you on $chan"
      }
     }
    }
   }
  }
 }
 }
}
lappend loadedtcls "Other small misc. TCLs"
proc dcc_help {hand idx arg} {
 global cont-helpindex botnick
 set cmd [string tolower [lindex $arg 0]]
 if {$cmd == ""} {
  putidx $idx "[cont -u] help <new/old> \[command\]"
 } else {
  if {$cmd == "new"} {
   set arg1 [lindex $arg 1]
   if {$arg1 == ""} {
    putcmdlog "#$hand# help $arg"
    putidx $idx "Showing help topics matching your flags: (+[chattr $hand])"
    set list ""
    foreach a ${cont-helpindex} {
     set flag [lindex $a 1]
     set cmd [lindex $a 2]
     if {[matchattr $hand $flag]} {
      lappend list $cmd
     }
    }
    set blist ""
    set z 0
    while {[llength $blist] < [llength $list]} {
     lappend blist "[lrange $list $z [expr $z + 3]]"
     incr z 4
    }
    foreach c $blist {
     if {$c != ""} {
      putidx $idx "    [fstring [lindex $c 0] 14] [fstring [lindex $c 1] 14] [fstring [lindex $c 2] 14] [fstring [lindex $c 3] 14]"
     }
    }
    putidx $idx "End of list. For individual command help, type: .help new <command>"
   } else {
    putcmdlog "#$hand# help $arg"
    set a ""
    foreach help ${cont-helpindex} {
     lappend a [lindex $help 2]
    }
    if {[lsearch [string tolower $a] [string tolower $arg1]] == "-1"} {
     putidx $idx "No help available on that. Try typing: .help"
    } else {
     putidx $idx "Displaying specific command help for: $arg1"
     foreach help ${cont-helpindex} {
      set arg1 [string tolower $arg1]
      set type [string toupper [lindex $help 0]]
      set flag [lindex $help 1]
      set cmd [lindex $help 2]
      set usage [lindex $help 3]
      set desc [lindex $help 4]
      if {$arg1 == [string tolower $cmd]} {
       if {[matchattr $hand $flag]} {
        putidx $idx "  [sb]Command Name[sb]: $cmd"
        putidx $idx "  [sb]Type[sb]:         $type"
        if {[string tolower $type] == "dcc"} {
         putidx $idx "  [sb]Usage[sb]:        .$cmd $usage"
        } else {
         putidx $idx "  [sb]Usage[sb]:        /msg $botnick $cmd $usage"
        }
        putidx $idx "  [sb]Flag[sb]:         +$flag needed"
        putidx $idx "  [sb]Description[sb]:  $desc"
        putidx $idx " "
        if {$type == "DCC"} {
         putidx $idx "  For extra usage help, type without any arguments: .$cmd"
        } else {
         putidx $idx "  For extra usage help, type without any arguments: /msg $botnick $cmd"
        }
       } else {
        putidx $idx "  Cannot display help for topic. You have no access to that command."
       }
      }
     }
     putidx $idx "End of help."
    }
   }
  } else {
   if {$cmd == "old"} {
    putcmdlog "#$hand# help $arg"
    putidx $idx "Showing you commands matching your flags: [chattr $hand]"
    foreach helpmsg ${cont-helpindex} {
     set msgbah "[lrange $helpmsg 0 2] [lindex $helpmsg 4]"
     set type [lindex $msgbah 0]
     set flag [lindex [lindex $msgbah 1] 0]
     if {$flag == "-"} { set flag "p" }
     set cmd [lindex $msgbah 2]
     set desc [lrange $msgbah 3 end]
     if {[matchattr $hand $flag]} {
      if {$type == "dcc"} {
       if {![info exists dcc($flag)]} {
        set dcc($flag) "{$cmd} {$desc}"
       } else {
        lappend dcc($flag) "{$cmd} {$desc}"
       }
      } else {
       if {$type == "msg"} {
        if {![info exists msg($flag)]} {
         set msg($flag) "{$cmd} {$desc}"
        } else {
         lappend msg($flag) "{$cmd} {$desc}"
        }
       }
      }
     }
    }
    foreach array [array names dcc] {
     putidx $idx "Commands matching flag: $array"
     set whore 0
     foreach int $dcc($array) {
      set int "[string trimright [string trimleft [lindex $int 0] \{] \}] [string trimright [string trimleft [lindex $int 1] \{] \}]"
      if {$whore == "0"} {
       set slut "$int"
       set whore [expr $whore + 1]
      } else {
       if {$whore == "1"} {
        set slut "$slut $int"
        set whore [expr $whore + 1]
       } else {
        if {$whore == "2"} {
         putidx $idx " [sb][fstring [lindex $slut 0] 11][sb] = [lrange $slut 1 end]"
         set whore 3
        } else {
         putidx $idx " [sb][fstring [lindex $int 0] 11][sb] = [lrange $int 1 end]"
        }
       }
      }
     }
    }
    putidx $idx "End of list."
   } else {
    putidx $idx "[cont -u] help <old/new> \[command\]"
   }
  }
 }
 return 0
}
proc dcc_contagious {hand idx arg} {
 putcmdlog "#$hand# contagious $arg"
 putidx $idx "Displaying [cont -sf] Information"
 putidx $idx "- - - - - - - - - - - - - - - - - - - -"
 putidx $idx "[sb][su]Contagious+MT Info[sb]:[su]"
 putidx $idx "[sb]Release Date[sb]: [cont -r]"
 putidx $idx "[sb]Version[sb]:      [cont -v]"
 putidx $idx "[sb]+MT Version[sb]:  $vermt"
 putidx $idx " "
 putidx $idx "[sb][su]MT Author's Info[sb]:[su]"
 putidx $idx "[sb]Irc Nickname[sb]: MTrez"
 putidx $idx "[sb]Irc Network[sb]:  EFnet"
 putidx $idx "[sb]Irc Channel[sb]:  N/A"
 putidx $idx "[sb]Website[sb]:      http://www.rezzie.net/cnt/"
 putidx $idx "[sb]ICQ UIN[sb]:      N/A"
 putidx $idx "[sb]AIM Name[sb]:     MTD6"
 putidx $idx "[sb]E-Mail[sb]:       rezzie@rezzie.net"
 putidx $idx " "
 putidx $idx "[sb][su]Author's Info[sb]:[su]"
 putidx $idx "[sb]Irc Nickname[sb]: Silverado"
 putidx $idx "[sb]Irc Network[sb]:  EFnet & irc.turbulent.net"
 putidx $idx "[sb]Irc Channel[sb]:  #Contagious"
 putidx $idx "[sb]Website[sb]:      http://silverado.acrilic.net:222/cnt/"
 putidx $idx "[sb]ICQ UIN[sb]:      16990238"
 putidx $idx "[sb]AIM Name[sb]:     SilverS1ut (I barely use AIM... use ICQ)"
 putidx $idx "[sb]E-Mail[sb]:       silverado@roadrunner.nf.net"
 putidx $idx " "
 return 0
}
lappend loadedtcls "DCC Help Command"
if {[ini_read $mainini uses firststart] == ";"} {
 ini_write $mainini uses firststart [unixtime]
 ini_write $mainini uses used 0
} else {
 if {![info exists used]} {
  utimer 6 timer_usedcheck
 }
}
kill_timer mt_setupalthub
timer 1 mt_setupalthub
set firststart [ini_read $mainini uses firststart]
set used [expr [ini_read $mainini uses used] + 1]
proc timer_usedcheck {} {
 global mainini used
 ini_write $mainini uses used $used
}
kill_timer alcheck
timer 1 alcheck
proc alcheck {} {
 global admins owner mainini
 if {[ishub]} {
  if {[llength $admins] < "1"} {
   if {[validuser $owner] == "1"} {
    set admins [string tolower $owner]
    set returnzz1 [ini_remove $mainini admin users]
    set returnzz1 [ini_write $mainini admin users $admins]
    sendnote CNT $owner "The hub's admin list has become corrupted, it has been restored for you to: ($owner)."
    putallbots "bot_admin $admins"
   }
  }
  timer 15 alcheck
 }
}
putlog "Finished loading botpack."
putlog " "
putlog " - Bot's Info -"
putlog "Name:       $bname"
set bah 0
if {${my-ip} == ""} {
 set myip "System Default IP"
 set bah 1
}
if {!$bah} {
 putlog "IP Address: ${my-ip} (${my-hostname}\)"
} else {
 putlog "IP Address: $myip"
}
putlog "Port:       $btelnet"
if {$admins == ""} {
 putlog "Admins:     None (0)"
} else {
 putlog "Admins:     $admins ([llength $admins])"
}
putlog "Channels:   [llength [channels]]"
putlog " "
putlog "Bot has been started up $used times"
putlog "Bot is [goodt [expr [unixtime] - $firststart]] old"
putlog "Bot was first started on [ctime $firststart]"
putlog " "
putlog "Completed loading in [expr abs([clock clicks] - $loadstart) / 1000000.0]s"
putlog ".::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::.::."
set contloaded 1
##############################################EOF##############################################
