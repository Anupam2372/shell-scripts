dir0=/data/ursa/Jay/RF/ZC
dir1=$dir0/Scripts

source $dir1/set_dir.sh               # edit to include the working directory for data, then run to set variable "dir"
source $dir1/wget_IRISDMC.sh          # download files from IRIS DMC
source $dir1/openssl.sh               # unencrypt encripted SEED files
source $dir1/move_seed.sh             # create a directory for each event and move SEED files for each event to that directory
source $dir1/rdseed.sh                # cycle through the event directories and read data into SAC format files
source $dir1/sac_process_BH.sh        # identify sets of 3 files for each BH station, rename and remove trend & mean, rotate to great circle path
source $dir1/sac_process_HH.sh        # identify sets of 3 files for each HH station, rename and remove trend & mean, rotate to great circle path
source $dir1/sac_process_EH.sh        # identify sets of 3 files for each EH station, rename and remove trend & mean, rotate to great circle path
source $dir1/sac_process_MoveLeftovers.sh # move SAC files that are too complicated to deal with easily to a directory called "Backup"
source $dir1/rename_files.sh          # rename files again so each event/station pair has unique name
source $dir1/phase_markers_events.sh  # write predicted P picks into T1, T2, and T3, respectively
source $dir1/phase_markers_events_P.sh    # write predicted P picks into T1
source $dir1/phase_markers_events_PKP.sh  # write predicted P picks into T2
source $dir1/phase_markers_events_PP.sh   # write predicted P picks into T3
source $dir1/phase_markers_events_PcP.sh  # write predicted P picks into T4
source $dir1/aggregate_stations.sh    # move data into unique directory for each station
source $dir1/create_run_recfunk.sh    # create a script to run recfunk and generate baz and epi plots
source $dir1/recfunk.sh               # Jeff Park's multi-taper receiver function code
# source $dir1/aggregate_phases.sh    # create input files for recfunk that use RFs for a (user-specified) variety of phases (e.g., P &/or PKP &/or PP &/or PcP)
# plotbaz                  # GMT script to plot RFs vs. backazimuth
# plotepi                  # GMT script to plot RFs vs. epicentral distance
# stn=SDDR
# plotepi outr_epi.grid outt_epi.grid 0.5 ${stn}_2.0Hz_P_PP_PKP    # GMT script to plot RFs vs. epicentral distance
# mv plot.ps plot_${stn}_epi.ps
# plotbaz outr_baz.grid outt_baz.grid 1.0 ${stn}_2.0Hz_P_PP_PKP    # GMT script to plot RFs vs. backazimuth
# mv plot.ps plot_${stn}_baz.ps
