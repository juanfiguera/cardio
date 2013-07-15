# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(document).ready ->
		if ($(".session-unit #session-chart").length > 0)
			$.each $(".session-unit #session-chart"), ->				

				# implementation heavily influenced by http://bl.ocks.org/1166403 

				# define dimensions of graph
				m = [10, 10, 20, 30] # margins
				w = 760 - m[1] - m[3] # width
				h = 70 - m[0] - m[2] # height
				padding = 0

				# Dataset
				data = $(this).data().array

				# X scale 
				x = d3.scale.linear().domain([0, data.length]).range([0, w])

				# Y scale 
				y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0])

				# create a line function
				# return the X coordinate where we want to plot this datapoint
				line = d3.svg.line().x((d, i) ->
				  x i
				).y((d) ->
				  # return the Y coordinate where we want to plot this datapoint
				  y d
				)

				# Add an SVG element with the desired dimensions and margin.
				graph = d3.select(this).append("svg:svg")
									.attr("width", w + m[1] + m[3])
									.attr("height", h + m[0] + m[2])
									.append("svg:g")
									.attr("transform", "translate(" + m[3] + "," + m[0] + ")")

				# Create X-Axis
				xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true).ticks(5)

				# Add the X-axis.
				graph.append("svg:g").attr("class", "x axis").attr("transform", "translate(0," + h + ")").attr("font-family", "sans-serif").attr("font-size", "11px").call xAxis

				# Create Y-Axis
				yAxis = d3.svg.axis().scale(y).orient("left").ticks(4)

				#Create Y axis
				graph.append("svg:g").attr("class", "y axis").attr("transform", "translate(" + padding + ",0)").attr("font-family", "sans-serif").attr("font-size", "11px").call yAxis

				# Adding line 
				graph.append("svg:path").attr "d", line(data)



