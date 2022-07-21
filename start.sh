#!/bin/sh

# Default to 1 seconds before exiting
WAIT_FOR_EXIT=${WAIT_FOR_EXIT:-1}
WITH_TAIL=${WITH_TAIL:-0}

cleanup() {
	start=$(date +%s)
	echo "SIGTERM received. Waiting ${WAIT_FOR_EXIT}(s) before terminating ..."
	sleep "${WAIT_FOR_EXIT}"
	kill -9 "${child_process}"
	end=$(date +%s)
	runtime=$((end - start))

	echo "Time to exit: ${runtime}"
}

mysleep() {
	if [ "${WITH_TAIL}" != "1" ]; then
		echo "sleeping with: 'sleep infinity'"
		sleep infinity
	else
		echo "sleeping with: 'tail -f /dev/null'"
		tail -f /dev/null
	fi
}

trap 'cleanup' TERM

mysleep &
child_process=$!

wait "${child_process}"
