rm result.csv
make
echo "MEM,func,k,AAE,ARE,_sum,throughput" >> result.csv
ruleDir[40]="/Users/caolu/Downloads/Data/temp.dat"

for MEM in $(seq 100 100 1000)
do
    for K in 10 50 $(seq 100 100 1000)
    do
        cmd="./cuckoo -d $ruleDir -m $MEM -k $K"
        echo $cmd
        eval $cmd
        pid = $!
        wait $pid
        if ps -p $pid > /dev/null; then
            kill -9 $pid
        fi
        echo "done"
        sleep 1
    done
done

