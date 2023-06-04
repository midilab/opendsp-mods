# Midilab Dub Station MOD
  
Emulates a classic Dub Sound System setup for DJing: a mixer, 2 decks, spring reverb and tape delay. Just map you midi controller and plug it to your opendsp.  
  

# MIDI Mapping

opendsp mixer and efx channel: 15  
  
Send A goes to the valvulated Spring Reverb  
Send B goes to tape delay  
  
channel A  
volume: cc 12  
send a: cc 14  
send b: cc 15  
  
channel B  
volume: cc 16  
send a: cc 18  
send b: cc 19  
  
tape delay  
time: cc 30  
feedback: cc 31  
  
delay: time 0-40  
feedback: 0-95 or maybe 0-100  
  
# Spring Reverb Impulse notes
  
Credits goes to Fokke van Saane, please check his great work at: https://fokkie.home.xs4all.nl/IR.htm

# How to check outputs?

ecasignalview -f:s16_le,2,48000,i jack,mixer:out null
