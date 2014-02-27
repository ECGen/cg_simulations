#! /usr/bin/env bash

#start a screen session and navigate to src
screen -dmS "cgsim2"
screen -S cgsim -X screen
# screen -S cgsim -X screen
# screen -S cgsim -X screen


#r00
screen -S cgsim2 -p 0 -X stuff $'ssh compute-0-0\n'
screen -S cgsim2 -p 0 -X stuff $'cd projects/cg_simulations/src\n'
screen -S cgsim2 -p 0 -X stuff $'sh getStatsr00.sh\n'
echo '...' |mail -s 'hoth: cgs r00 setup done.' mkl48@nau.edu

#r0
screen -S cgsim2 -p 1 -X stuff $'ssh compute-0-0\n'
screen -S cgsim2 -p 1 -X stuff $'cd projects/cg_simulations/src\n'
screen -S cgsim2 -p 1 -X stuff $'sh getStatsr0.sh\n'
echo '...' |mail -s 'hoth: cgs r0 setup done.' mkl48@nau.edu

# #c0
# screen -S cgsim -p 2 -X stuff $'ssh compute-0-0\n'
# screen -S cgsim -p 2 -X stuff $'cd projects/cg_simulations/src\n'
# screen -S cgsim -p 2 -X stuff $'sh getStatsc0.sh\n'
# echo '...' |mail -s 'hoth: cgs c0 setup done.' mkl48@nau.edu

# #r1
# screen -S cgsim -p 3 -X stuff $'ssh compute-0-0\n'
# screen -S cgsim -p 3 -X stuff $'cd projects/cg_simulations/src\n'
# screen -S cgsim -p 3 -X stuff $'sh getStatsr1.sh\n'
# echo '...' |mail -s 'hoth: cgs r1 setup done.' mkl48@nau.edu

# #email notification
# echo '...' |mail -s 'hoth: cg stats setup done.' mkl48@nau.edu