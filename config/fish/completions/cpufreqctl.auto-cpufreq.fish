# Completions for cpufreqctl.auto-cpufreq
# Author: second2050 <me@second2050.me>

set -l progname cpufreqctl.auto-cpufreq

# arguments
complete -c $progname -f -r

complete -c $progname -x      -l help    -d 'Show help options'
complete -c $progname -x      -l version -d 'Package version'
complete -c $progname -x -s v -l verbose -d 'Verbose output'

complete -c $progname -f      -l set       -d 'Set VALUE for selected option' -a ($progname --governor --available)
complete -c $progname         -l core      -d 'Apply selected option just for the core NUMBER (0 ~ N - 1)'
complete -c $progname         -l available -d 'Get available values instand of default: current'

complete -c $progname -x      -l driver              -d 'Current processor driver' 
complete -c $progname         -l governor            -d 'Scaling governor\'s options'
complete -c $progname         -l epp                 -d 'Governor\'s energy_performance_preference options'
complete -c $progname         -l frequency           -d 'frequency options'
complete -c $progname         -l on                  -d 'Turn on --core=NUMBER'
complete -c $progname         -l off                 -d 'Turn off --core=NUMBER'
complete -c $progname         -l frequency-min       -d 'Minimal frequency options'
complete -c $progname         -l frequency-max       -d 'Maximum frequency options'
complete -c $progname -x      -l frequency-min-limit -d 'Get minimal frequency limit'
complete -c $progname -x      -l frequency-max-limit -d 'Get maximum frequency limit'
complete -c $progname         -l boost               -d 'Current cpu boost value'

complete -c $progname         -l no-turbo -d ''
complete -c $progname         -l min-perf -d ''
complete -c $progname         -l max-perf -d ''
 
complete -c $progname         -l throttle       -d ''
complete -c $progname         -l throttle-event -d ''
complete -c $progname         -l irqbalance     -d ''

