#= require jquery
#= require underscore
#= require flipclock
#= require segment

$(document).ready ->
  luxola = 
    class: 'luxola'
    link: 'http://www.luxola.co.th/categories/makeup/view-all?utm_source=singlesdayth&utm_medium=banner&utm_campaign=promo'

  moxy = 
    class: 'moxy'
    link: 'http://moxyst.com/singlesdayth'

  pomelo = 
    class: 'pomelo'
    link: 'http://www.pomelofashion.com/singles-day/?utm_source=singlesday&utm_medium=banner&utm_campaign=promo'

  sanoga =
    class: 'sanoga'
    link: 'http://www.sanoga.com/th/clearance-deals/all-deals/single-day-sale.html?utm_source=SinglesDayTH&utm_medium=banner&utm_campaign=promo'

  shops = [luxola, moxy, pomelo, sanoga]
  randomized = _.shuffle(_.shuffle(shops))

  $('a.shop-link').click (e) ->
    window.analytics.track 'Clicked Shop',
      link: $(this).attr('href')

  $('#links div.ball').each (index) ->
    $(this).parent().attr('href', randomized[index].link)
    $(this).addClass(randomized[index].class)

  $('#links-mobile div.ball').each (index) ->
    $(this).parent().attr('href', randomized[index].link)
    $(this).addClass(randomized[index].class)

  currentDate = new Date()
  futureDate  = new Date(2014, 10, 11, 11, 11)

  console.log futureDate
  diff  = futureDate.getTime() / 1000 - currentDate.getTime() / 1000

  clock = $('.clock').FlipClock(diff,
    clockFace: 'DailyCounter',
    countdown: true
  )
