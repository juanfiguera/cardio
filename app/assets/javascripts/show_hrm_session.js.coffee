jQuery ->
	$(document).ready ->
	  Morris.Line
	    element: 'chart'
	    data: $('#chart').data('sessions')
	    xkey: 'started_at'
	    ykeys: ['bpm']
	    labels: ['BPM']