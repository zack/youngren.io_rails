CHART_SIZE = 100

generate_nums = (i) ->
  arr = []
  for n in [1..i]
    arr.push(Math.floor(Math.random()*10)+1)
  arr.unshift('data')
  arr

update_nums = (chart) ->
  arr = chart.data()[0].values
  seed = Math.random()*10
  arr = (Math.max(0, (n.value + Math.floor(Math.random()*seed-seed/3))) for n in arr)
  arr.unshift('data')
  arr

@nums = generate_nums(CHART_SIZE)

gen_chart = ->
  @chart = c3.generate
    data:
      columns:[ @nums ]
      type: 'bar'
    bar:
      width:
        ratio: 0.5
    legend:
      hide: true
    axis:
      x:
        tick:
          count: 1
      y:
        tick:
          count: 1
    transition:
      duration: 0

run_update = (chart) =>
  t = setInterval(update_chart, 30)

update_chart = =>
  @chart.load
    columns: [ update_nums(@chart) ]

$ -> gen_chart()
$ -> run_update()
