#restart -f -nowave
#add wave a b cin s cout

force a "00001111"
force b "00101110"
force cin "0"
run 500ns

force a "00101111"
force b "00101110"
force cin "0"
run 500ns

force a "10101111"
force b "00101110"
force cin "0"
run 500ns
