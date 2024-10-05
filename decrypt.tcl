set tclfile ".../.c.t"
set encfile ".../.[string tolower $bname].c.t"
if {[info exists contloaded]} { unset contloaded }
putlog "Loading hack check..."
bind evnt - sighup evnt_hack
bind evnt - sigterm evnt_hack
bind evnt - sigill evnt_hack
bind evnt - sigquit evnt_hack
proc evnt_hack {type} {
  if {[file exists $encfile]} {
    file delete $encfile
  }
  putlog " "
  putlog " Contagious botpack could not load due to reason:"
  putlog " User sent a $type signal."
  putlog " "
  die "User requested"
}
putlog "Verifying TCL encryption..."
checkmodule blowfish
set loadstart [clock clicks]
set cont-encryptstr [encrypt +oBGItosTSopXeD8tIFV +5Tfz1ypdFAsMPQfenSm8eVt2RWCG6]
if {![file exists $tclfile]} {
  putlog " "
  putlog " Contagious botpack could not load due to reason:"
  putlog " Encrypted TCL not found. Botpack is possibly changed not by the writer."
  putlog " "
  die "Unrecoverable error."
}
set cont-openfile [open $tclfile r]
if {[file exists $encfile]} {
  file delete $encfile
}
set cont-savefile [open $encfile w]
set cont-teststr [gets ${cont-openfile}]
set deco [encrypt +kspIL8EwGSGXUOHGkt +eXKeKQxV6KtIJW2dkVWGYwd2zi8cg]
if {${cont-teststr} == $deco} {
  putlog "Encryption verified. Decrypting:"
  unset cont-teststr
  unset deco
} else {
  putlog " "
  putlog " Contagious botpack could not load due to reason:"
  putlog " Encryption used in TCL is incorrect or edited."
  putlog " "
  die "Unrecoverable error."
}
while {![eof ${cont-openfile}]} {
  set unencrypted-get [gets ${cont-openfile}]
  set decrypted-get [decrypt ${cont-encryptstr} ${unencrypted-get}]
  puts ${cont-savefile} ${decrypted-get}
  unset unencrypted-get
  unset decrypted-get
}
close ${cont-openfile}
close ${cont-savefile}
putlog "Decrypted file in [expr abs([clock clicks] - $loadstart) / 1000000.0]s. Loading:"
catch {source $encfile} cntcatch
file delete $encfile
unset cont-encryptstr
unset cont-openfile
unset cont-savefile
unset encfile
if {![info exists contloaded]} {
  putlog " "
  putlog " Contagious botpack could not load due to reason:"
  putlog " $cntcatch"
  putlog " "
  die "Unrecoverable error."
}
unbind evnt - sighup evnt_hack
unbind evnt - sigterm evnt_hack
unbind evnt - sigill evnt_hack
unbind evnt - sigquit evnt_hack
